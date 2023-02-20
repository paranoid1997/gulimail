package com.liu.gulimail.product.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.liu.gulimail.product.entity.BrandEntity;
import com.liu.gulimail.product.vo.BrandVo;
import com.liu.gulimail.product.vo.CategoryBrandRelationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.liu.gulimail.product.entity.CategoryBrandRelationEntity;
import com.liu.gulimail.product.service.CategoryBrandRelationService;
import com.liu.common.utils.PageUtils;
import com.liu.common.utils.R;



/**
 * @author liusenbiao
 * @email 1805336068@qq.com
 * @date 2022-04-09 23:19:20
 */
@RestController
@RequestMapping("product/categorybrandrelation")
public class CategoryBrandRelationController {
    @Autowired
    private CategoryBrandRelationService categoryBrandRelationService;

    /**
     * /product/categorybrandrelation/brands/list
     */
    @GetMapping("/brands/list")
    public R relationBrandList(@RequestParam(value = "catId",required = true)Long catId) {
        List<BrandVo> vos = categoryBrandRelationService.getBrandsBycatId(catId);
        return R.ok().put("data",vos);
    }
    /**
     * 列表
     */
    @GetMapping("/catelog/list")
    public R cateloglist(CategoryBrandRelationVo categoryBrandRelationVo,@RequestParam("brandId") Long brandId){
        List<CategoryBrandRelationVo> data = categoryBrandRelationService.queryRelationList(categoryBrandRelationVo,brandId);
        return R.ok().put("data", data);
    }

    /**
     * 关联分类列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = categoryBrandRelationService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		CategoryBrandRelationEntity categoryBrandRelation = categoryBrandRelationService.getById(id);

        return R.ok().put("categoryBrandRelation", categoryBrandRelation);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody CategoryBrandRelationEntity categoryBrandRelation){
		categoryBrandRelationService.saveDetail(categoryBrandRelation);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody CategoryBrandRelationEntity categoryBrandRelation){
		categoryBrandRelationService.updateById(categoryBrandRelation);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		categoryBrandRelationService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
