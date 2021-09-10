package com.workflow.process.center.controller;

import com.workflow.process.center.common.ResultBean;
import com.workflow.process.center.domain.entity.WorkFlowCategory;
import com.workflow.process.center.service.WorkFlowCategoryService;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.Serializable;
import java.util.List;

/**
 * 流程分类(WorkFlowCategory)表控制层[不建议修改，如果有新增的方法，写在子类中]
 *
 * @author 土豆仙
 * @since 2021-06-21 15:59:48
 */
@Api(tags = "流程分类")
@RestController
@RequestMapping("/workFlowCategory")
public class WorkFlowCategoryController {

    /**
     * 服务对象
     */
    @Autowired
    WorkFlowCategoryService workFlowCategoryService;

    /**
     * 查询所有不分页
     */
    @ApiOperation(value = "查询所有流程分类信息", notes = "不分页")
    @GetMapping("/list")
    public ResultBean<List<WorkFlowCategory>> list() {

        List<WorkFlowCategory> list = workFlowCategoryService.list();
        return ResultBean.ofSuccess(list);
    }

    /**
     * 分页查询所有数据
     *
     * @param pageIndex        页码
     * @param pageSize         页长
     * @param workFlowCategory 查询实体
     * @return 所有数据
     */
    @ApiOperation("分页查询所有数据")
    @GetMapping("/selectAll")
    public ResultBean<List<WorkFlowCategory>> list(WorkFlowCategory workFlowCategory,
                                                   @RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                                   @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(pageIndex, pageSize, true);
        List<WorkFlowCategory> list = workFlowCategoryService.list(new QueryWrapper<>(workFlowCategory));
        PageInfo<WorkFlowCategory> pageInfo = new PageInfo<>(list);
        return ResultBean.ofSuccess(list, pageInfo.getTotal(), pageInfo.getPageNum(), pageInfo.getPageSize());

    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @ApiOperation("通过主键查询单条数据")
    @GetMapping("/{id}")
    public ResultBean<WorkFlowCategory> selectOne(@PathVariable Serializable id) {
        return ResultBean.ofSuccess(workFlowCategoryService.getById(id));
    }

    /**
     * 新增数据
     *
     * @param workFlowCategory 实体对象
     * @return 新增结果
     */
    @ApiOperation("新增数据")
    @PostMapping("/insert")
    public ResultBean<Integer> insert(@RequestBody WorkFlowCategory workFlowCategory) {
        boolean rs = workFlowCategoryService.save(workFlowCategory);
        return ResultBean.ofSuccess(rs ? workFlowCategory.getId() : 0);
    }

    /**
     * 修改数据
     *
     * @param workFlowCategory 实体对象
     * @return 修改结果
     */
    @ApiOperation("修改数据")
    @PutMapping("/update")
    public ResultBean<String> update(@RequestBody WorkFlowCategory workFlowCategory) {
        boolean b = workFlowCategoryService.updateById(workFlowCategory);
        return ResultBean.ofSuccess(b?"修改成功！":"修改失败！");
    }

    /**
     * 单条/批量删除数据
     *
     * @param idList 主键集合
     * @return 删除结果
     */
    @ApiOperation("单条/批量删除数据")
    @DeleteMapping("/delete")
    public ResultBean<String> delete(@RequestBody List<Long> idList) {
        boolean b = workFlowCategoryService.removeByIds(idList);
        return ResultBean.ofSuccess(b?"删除成功！":"删除失败！");
    }
}
