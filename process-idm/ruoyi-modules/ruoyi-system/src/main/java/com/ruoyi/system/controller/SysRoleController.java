package com.ruoyi.system.controller;

import com.ruoyi.common.core.constant.UserConstants;
import com.ruoyi.common.core.utils.SecurityUtils;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.web.page.TableDataInfo;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.PreAuthorize;
import com.ruoyi.system.api.domain.SysRole;
import com.ruoyi.system.common.ResultBean;
import com.ruoyi.system.service.ISysRoleService;
import com.workflow.process.center.api.domain.WorkFlowRoleDTO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 角色信息
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/role")
public class SysRoleController extends BaseController
{
    @Autowired
    private ISysRoleService roleService;

    @PreAuthorize(hasPermi = "system:role:list")
    @GetMapping("/list")
    public TableDataInfo list(SysRole role)
    {
        startPage();
        List<SysRole> list = roleService.selectRoleList(role);
        return getDataTable(list);
    }

    //对接
    @GetMapping("/listGroups")
    public ResultBean<List<WorkFlowRoleDTO>> listGroups(SysRole role)
    {
       // PageHelper.startPage(pageIndex, pageSize, true);
        List<SysRole> list = roleService.selectRoleList(role);
      //  PageInfo<SysRole> pageInfo = new PageInfo<>(list);
        List<WorkFlowRoleDTO> collect = list.stream().map(sysRole -> {
            WorkFlowRoleDTO workFlowGroupDTO = new WorkFlowRoleDTO();

            BeanUtils.copyProperties(sysRole, workFlowGroupDTO);
            return workFlowGroupDTO;
        }).collect(Collectors.toList());
        return ResultBean.ofSuccess(collect);
    }

    @GetMapping("/queryGroupByKey")
    public ResultBean<WorkFlowRoleDTO> queryGroupByKey(@RequestParam(value = "groupKey", required = true) String groupKey)
    {
        // PageHelper.startPage(pageIndex, pageSize, true);
        SysRole role = roleService.queryGroupByKey(groupKey);
        //  PageInfo<SysRole> pageInfo = new PageInfo<>(list);
        WorkFlowRoleDTO workFlowRoleDTO =null;
        if (role !=null){
            workFlowRoleDTO = new WorkFlowRoleDTO();

            BeanUtils.copyProperties(role, workFlowRoleDTO);

        }

        return ResultBean.ofSuccess(workFlowRoleDTO);
    }


    @Log(title = "角色管理", businessType = BusinessType.EXPORT)
    @PreAuthorize(hasPermi = "system:role:export")
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysRole role) throws IOException
    {
        List<SysRole> list = roleService.selectRoleList(role);
        ExcelUtil<SysRole> util = new ExcelUtil<SysRole>(SysRole.class);
        util.exportExcel(response, list, "角色数据");
    }

    /**
     * 根据角色编号获取详细信息
     */
    @PreAuthorize(hasPermi = "system:role:query")
    @GetMapping(value = "/{roleId}")
    public AjaxResult getInfo(@PathVariable Long roleId)
    {
        return AjaxResult.success(roleService.selectRoleById(roleId));
    }

    /**
     * 新增角色
     */
    @PreAuthorize(hasPermi = "system:role:add")
    @Log(title = "角色管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysRole role)
    {
        if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleNameUnique(role)))
        {
            return AjaxResult.error("新增角色'" + role.getRoleName() + "'失败，角色名称已存在");
        }
        else if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleKeyUnique(role)))
        {
            return AjaxResult.error("新增角色'" + role.getRoleName() + "'失败，角色权限已存在");
        }
        role.setCreateBy(SecurityUtils.getUsername());
        return toAjax(roleService.insertRole(role));

    }

    /**
     * 修改保存角色
     */
    @PreAuthorize(hasPermi = "system:role:edit")
    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysRole role)
    {
        roleService.checkRoleAllowed(role);
        if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleNameUnique(role)))
        {
            return AjaxResult.error("修改角色'" + role.getRoleName() + "'失败，角色名称已存在");
        }
        else if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleKeyUnique(role)))
        {
            return AjaxResult.error("修改角色'" + role.getRoleName() + "'失败，角色权限已存在");
        }
        role.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(roleService.updateRole(role));
    }

    /**
     * 修改保存数据权限
     */
    @PreAuthorize(hasPermi = "system:role:edit")
    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
    @PutMapping("/dataScope")
    public AjaxResult dataScope(@RequestBody SysRole role)
    {
        roleService.checkRoleAllowed(role);
        return toAjax(roleService.authDataScope(role));
    }

    /**
     * 状态修改
     */
    @PreAuthorize(hasPermi = "system:role:edit")
    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SysRole role)
    {
        roleService.checkRoleAllowed(role);
        role.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(roleService.updateRoleStatus(role));
    }

    /**
     * 删除角色
     */
    @PreAuthorize(hasPermi = "system:role:remove")
    @Log(title = "角色管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{roleIds}")
    public AjaxResult remove(@PathVariable Long[] roleIds)
    {
        return toAjax(roleService.deleteRoleByIds(roleIds));
    }

    /**
     * 获取角色选择框列表
     */
    @PreAuthorize(hasPermi = "system:role:query")
    @GetMapping("/optionselect")
    public AjaxResult optionselect()
    {
        return AjaxResult.success(roleService.selectRoleAll());
    }
}