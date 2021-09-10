package com.ruoyi.system.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ruoyi.common.core.constant.UserConstants;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.utils.SecurityUtils;
import com.ruoyi.common.core.utils.StringUtils;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.web.page.TableDataInfo;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.PreAuthorize;
import com.ruoyi.system.api.domain.SysRole;
import com.ruoyi.system.api.domain.SysUser;
import com.ruoyi.system.api.model.LoginUser;
import com.ruoyi.system.common.ResultBean;
import com.ruoyi.system.service.ISysPermissionService;
import com.ruoyi.system.service.ISysPostService;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;
import com.workflow.process.center.api.domain.WorkFlowUserDTO;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 用户信息
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/user")
public class SysUserController extends BaseController {
    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysRoleService roleService;

    @Autowired
    private ISysPostService postService;

    @Autowired
    private ISysPermissionService permissionService;

    /**
     * 获取用户列表
     */
    @PreAuthorize(hasPermi = "system:user:list")
    @GetMapping("/list")
    public TableDataInfo list(SysUser user) {
        startPage();
        List<SysUser> list = userService.selectUserList(user);
        return getDataTable(list);
    }

    @Log(title = "用户管理", businessType = BusinessType.EXPORT)
    @PreAuthorize(hasPermi = "system:user:export")
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysUser user) throws IOException {
        List<SysUser> list = userService.selectUserList(user);
        ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
        util.exportExcel(response, list, "用户数据");
    }

    @Log(title = "用户管理", businessType = BusinessType.IMPORT)
    @PreAuthorize(hasPermi = "system:user:import")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
        List<SysUser> userList = util.importExcel(file.getInputStream());
        String operName = SecurityUtils.getUsername();
        String message = userService.importUser(userList, updateSupport, operName);
        return AjaxResult.success(message);
    }

    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response) throws IOException {
        ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
        util.importTemplateExcel(response, "用户数据");
    }

    /**
     * 获取当前用户信息
     */
    @GetMapping("/info/{username}")
    public R<LoginUser> info(@PathVariable("username") String username) {
        SysUser sysUser = userService.selectUserByUserName(username);
        if (StringUtils.isNull(sysUser)) {
            return R.fail("用户名或密码错误");
        }
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(sysUser.getUserId());
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(sysUser.getUserId());
        LoginUser sysUserVo = new LoginUser();
        sysUserVo.setSysUser(sysUser);
        sysUserVo.setRoles(roles);
        sysUserVo.setPermissions(permissions);
        return R.ok(sysUserVo);
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo() {
        Long userId = SecurityUtils.getUserId();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(userId);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(userId);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", userService.selectUserById(userId));
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 根据用户编号获取详细信息
     */
    @PreAuthorize(hasPermi = "system:user:query")
    @GetMapping(value = {"/", "/{userId}"})
    public AjaxResult getInfo(@PathVariable(value = "userId", required = false) Long userId) {
        AjaxResult ajax = AjaxResult.success();
        List<SysRole> roles = roleService.selectRoleAll();
        ajax.put("roles", SysUser.isAdmin(userId) ? roles : roles.stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
        ajax.put("posts", postService.selectPostAll());
        if (StringUtils.isNotNull(userId)) {
            ajax.put(AjaxResult.DATA_TAG, userService.selectUserById(userId));
            ajax.put("postIds", postService.selectPostListByUserId(userId));
            ajax.put("roleIds", roleService.selectRoleListByUserId(userId));
        }
        return ajax;
    }

    /**
     * 新增用户
     */
    @PreAuthorize(hasPermi = "system:user:add")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysUser user) {
        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(user.getUserName()))) {
            return AjaxResult.error("新增用户'" + user.getUserName() + "'失败，登录账号已存在");
        } else if (StringUtils.isNotEmpty(user.getPhonenumber())
                && UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(user))) {
            return AjaxResult.error("新增用户'" + user.getUserName() + "'失败，手机号码已存在");
        } else if (StringUtils.isNotEmpty(user.getEmail())
                && UserConstants.NOT_UNIQUE.equals(userService.checkEmailUnique(user))) {
            return AjaxResult.error("新增用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
        user.setCreateBy(SecurityUtils.getUsername());
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        return toAjax(userService.insertUser(user));
    }

    /**
     * 修改用户
     */
    @PreAuthorize(hasPermi = "system:user:edit")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysUser user) {
        userService.checkUserAllowed(user);
        if (StringUtils.isNotEmpty(user.getPhonenumber())
                && UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(user))) {
            return AjaxResult.error("修改用户'" + user.getUserName() + "'失败，手机号码已存在");
        } else if (StringUtils.isNotEmpty(user.getEmail())
                && UserConstants.NOT_UNIQUE.equals(userService.checkEmailUnique(user))) {
            return AjaxResult.error("修改用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
        user.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(userService.updateUser(user));
    }

    /**
     * 删除用户
     */
    @PreAuthorize(hasPermi = "system:user:remove")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds) {
        return toAjax(userService.deleteUserByIds(userIds));
    }


    @GetMapping("/listUsers")
    public ResultBean<List<WorkFlowUserDTO>> listUsers(SysUser user) {
        List<SysUser> list = userService.selectUserList(user);
        List<WorkFlowUserDTO> collect = list.stream().map(sysUser -> {
            WorkFlowUserDTO workFlowUserDTO = new WorkFlowUserDTO();
            //设置部门和角色
            workFlowUserDTO.setDeptName(sysUser.getDept() == null ? null : sysUser.getDept().getDeptName());

            if (CollectionUtils.isNotEmpty(sysUser.getRoles())) {
                List<String> roles = sysUser.getRoles().stream()
                        .map(sysRole -> sysRole.getRoleName())
                        .collect(Collectors.toList());
            }
            BeanUtils.copyProperties(sysUser, workFlowUserDTO);
            return workFlowUserDTO;
        }).collect(Collectors.toList());
        return ResultBean.ofSuccess(collect);
    }

    @GetMapping("/selectAll")
    public ResultBean<List<WorkFlowUserDTO>> selectAll(WorkFlowUserDTO workFlowUserParam,
                                                       @RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                                       @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
        SysUser user = new SysUser();
        BeanUtils.copyProperties(workFlowUserParam, user);
        PageHelper.startPage(pageIndex, pageSize, true);
        List<SysUser> list = userService.selectUserList(user);
        PageInfo<SysUser> pageInfo = new PageInfo<>(list);
        List<WorkFlowUserDTO> collect = list.stream().map(sysUser -> {
            WorkFlowUserDTO workFlowUserDTO = new WorkFlowUserDTO();
            //设置部门和角色
            workFlowUserDTO.setDeptName(sysUser.getDept() == null ? null : sysUser.getDept().getDeptName());

            if (CollectionUtils.isNotEmpty(sysUser.getRoles())) {
                List<String> roles = sysUser.getRoles().stream()
                        .map(sysRole -> sysRole.getRoleName())
                        .collect(Collectors.toList());
            }
            BeanUtils.copyProperties(sysUser, workFlowUserDTO);
            return workFlowUserDTO;
        }).collect(Collectors.toList());
        return ResultBean.ofSuccess(collect, pageInfo.getTotal(), pageInfo.getPageNum(), pageInfo.getPageSize());
    }

    //对接
    @GetMapping("/selectUserByUserIds")
    public ResultBean<List<WorkFlowUserDTO>> selectUserByUserIds(@RequestParam("idList") List<Long> idList) {
        List<SysUser> users = userService.selectUserByIds(idList);
        List<WorkFlowUserDTO> collect = users.stream().map(sysUser -> {
            WorkFlowUserDTO workFlowUserDTO = new WorkFlowUserDTO();
            //设置部门和角色
            workFlowUserDTO.setDeptName(sysUser.getDept() == null ? null : sysUser.getDept().getDeptName());

            if (CollectionUtils.isNotEmpty(sysUser.getRoles())) {
                List<String> roles = sysUser.getRoles().stream()
                        .map(sysRole -> sysRole.getRoleName())
                        .collect(Collectors.toList());
            }
            BeanUtils.copyProperties(sysUser, workFlowUserDTO);
            return workFlowUserDTO;
        }).collect(Collectors.toList());
        return ResultBean.ofSuccess(collect);
    }

    //对接
    @GetMapping("/selectUserByUserId")
    public ResultBean<WorkFlowUserDTO> selectUserByUserId(@RequestParam(value = "userId", required = true) Long userId) {
        WorkFlowUserDTO workFlowUserDTO = new WorkFlowUserDTO();
        SysUser sysUser = userService.selectUserById(userId);
        //设置部门和角色
        workFlowUserDTO.setDeptName(sysUser.getDept() == null ? null : sysUser.getDept().getDeptName());

        //设置角色
        if (CollectionUtils.isNotEmpty(sysUser.getRoles())) {
            List<String> roles = sysUser.getRoles().stream()
                    .map(sysRole -> sysRole.getRoleName())
                    .collect(Collectors.toList());
        }
        BeanUtils.copyProperties(sysUser, workFlowUserDTO);
        return ResultBean.ofSuccess(workFlowUserDTO);

    }

    @GetMapping("/selectUserByRoleKeys")
    public ResultBean<List<WorkFlowUserDTO>> selectUserByRoleKeys(@RequestParam("keyList") List<String> keyList,
                                                                  @RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                                                  @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(pageIndex, pageSize, true);
        List<SysUser> users = userService.selectUserByRoleKeys(keyList);
        PageInfo<SysUser> pageInfo = new PageInfo<>(users);
        List<WorkFlowUserDTO> collect = users.stream().map(sysUser -> {
            WorkFlowUserDTO workFlowUserDTO = new WorkFlowUserDTO();
            //设置部门和角色
            workFlowUserDTO.setDeptName(sysUser.getDept() == null ? null : sysUser.getDept().getDeptName());

            if (CollectionUtils.isNotEmpty(sysUser.getRoles())) {
                List<String> roles = sysUser.getRoles().stream()
                        .map(sysRole -> sysRole.getRoleName())
                        .collect(Collectors.toList());
            }
            BeanUtils.copyProperties(sysUser, workFlowUserDTO);
            return workFlowUserDTO;
        }).collect(Collectors.toList());
        return ResultBean.ofSuccess(collect, pageInfo.getTotal(), pageInfo.getPageNum(), pageInfo.getPageSize());
    }

    @GetMapping("/selectUserByDeptKeys")
    public ResultBean<List<WorkFlowUserDTO>> selectUserByDeptKeys(@RequestParam("keyList") List<String> keyList,
                                                                  @RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                                                  @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(pageIndex, pageSize, true);
        List<SysUser> users = userService.selectUserByDeptKeys(keyList);
        PageInfo<SysUser> pageInfo = new PageInfo<>(users);

        List<WorkFlowUserDTO> collect = users.stream().map(sysUser -> {
            WorkFlowUserDTO workFlowUserDTO = new WorkFlowUserDTO();
            //设置部门和角色
            workFlowUserDTO.setDeptName(sysUser.getDept() == null ? null : sysUser.getDept().getDeptName());

            if (CollectionUtils.isNotEmpty(sysUser.getRoles())) {
                List<String> roles = sysUser.getRoles().stream()
                        .map(sysRole -> sysRole.getRoleName())
                        .collect(Collectors.toList());
            }
            BeanUtils.copyProperties(sysUser, workFlowUserDTO);
            return workFlowUserDTO;
        }).collect(Collectors.toList());
        return ResultBean.ofSuccess(collect, pageInfo.getTotal(), pageInfo.getPageNum(), pageInfo.getPageSize());
    }

    @GetMapping("/selectUserByAreaDeptRoleKeys")
    public ResultBean<List<WorkFlowUserDTO>> selectUserByAreaDeptRoleKeys(@RequestParam(value = "area", required = false) String area,
                                                                          @RequestParam(value = "dept", required = false) String dept,
                                                                          @RequestParam(value = "role", required = false) String role) {

        List<SysUser> users = userService.selectUserByAreaDeptRoleKeys(area, dept, role);
        List<WorkFlowUserDTO> collect = users.stream().map(sysUser -> {
            WorkFlowUserDTO workFlowUserDTO = new WorkFlowUserDTO();
            //设置部门和角色
            workFlowUserDTO.setDeptName(sysUser.getDept() == null ? null : sysUser.getDept().getDeptName());

            if (CollectionUtils.isNotEmpty(sysUser.getRoles())) {
                List<String> roles = sysUser.getRoles().stream()
                        .map(sysRole -> sysRole.getRoleName())
                        .collect(Collectors.toList());
            }
            BeanUtils.copyProperties(sysUser, workFlowUserDTO);
            return workFlowUserDTO;
        }).collect(Collectors.toList());
        return ResultBean.ofSuccess(collect);
    }

    @GetMapping("/selectPageUserByAreaDeptRoleKeys")
    public ResultBean<List<WorkFlowUserDTO>> selectPageUserByAreaDeptRoleKeys(@RequestParam(value = "area", required = false) String area,
                                                                              @RequestParam(value = "dept", required = false) String dept,
                                                                              @RequestParam(value = "role", required = false) String role,
                                                                              @RequestParam(value = "pageIndex") Integer pageIndex,
                                                                              @RequestParam(value = "pageSize") Integer pageSize) {


        PageHelper.startPage(pageIndex, pageSize, true);
        List<SysUser> users = userService.selectUserByAreaDeptRoleKeys(area, dept, role);
        PageInfo<SysUser> pageInfo = new PageInfo<>(users);
        List<WorkFlowUserDTO> collect = users.stream().map(sysUser -> {
            WorkFlowUserDTO workFlowUserDTO = new WorkFlowUserDTO();
            //设置部门和角色
            workFlowUserDTO.setDeptName(sysUser.getDept() == null ? null : sysUser.getDept().getDeptName());

            if (CollectionUtils.isNotEmpty(sysUser.getRoles())) {
                List<String> roles = sysUser.getRoles().stream()
                        .map(sysRole -> sysRole.getRoleName())
                        .collect(Collectors.toList());
            }
            BeanUtils.copyProperties(sysUser, workFlowUserDTO);
            return workFlowUserDTO;
        }).collect(Collectors.toList());
        return ResultBean.ofSuccess(collect, pageInfo.getTotal(), pageInfo.getPageNum(), pageInfo.getPageSize());
    }

    /**
     * 重置密码
     */
    @PreAuthorize(hasPermi = "system:user:edit")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/resetPwd")
    public AjaxResult resetPwd(@RequestBody SysUser user) {
        userService.checkUserAllowed(user);
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        user.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(userService.resetPwd(user));
    }

    /**
     * 状态修改
     */
    @PreAuthorize(hasPermi = "system:user:edit")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SysUser user) {
        userService.checkUserAllowed(user);
        user.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(userService.updateUserStatus(user));
    }
}
