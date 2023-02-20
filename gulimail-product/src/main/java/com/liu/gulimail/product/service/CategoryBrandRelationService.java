package com.liu.gulimail.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.liu.common.utils.PageUtils;
import com.liu.gulimail.product.entity.CategoryBrandRelationEntity;
import com.liu.gulimail.product.vo.BrandVo;
import com.liu.gulimail.product.vo.CategoryBrandRelationVo;

import java.util.List;
import java.util.Map;

/**
 * @author liusenbiao
 * @email 1805336068@qq.com
 * @date 2022-04-09 23:19:20
 */
public interface CategoryBrandRelationService extends IService<CategoryBrandRelationEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<CategoryBrandRelationVo> queryRelationList(CategoryBrandRelationVo categoryBrandRelationVo, Long brandId);

    void saveDetail(CategoryBrandRelationEntity categoryBrandRelation);

    void updateBrand(Long brandId, String name);

    void updateCategory(Long catId, String name);

    List<BrandVo> getBrandsBycatId(Long catId);
}

