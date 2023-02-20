package com.liu.gulimail.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.liu.gulimail.product.dao.BrandDao;
import com.liu.gulimail.product.dao.CategoryDao;
import com.liu.gulimail.product.entity.BrandEntity;
import com.liu.gulimail.product.entity.CategoryEntity;
import com.liu.gulimail.product.service.BrandService;
import com.liu.gulimail.product.vo.BrandVo;
import com.liu.gulimail.product.vo.CategoryBrandRelationVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.liu.common.utils.PageUtils;
import com.liu.common.utils.Query;

import com.liu.gulimail.product.dao.CategoryBrandRelationDao;
import com.liu.gulimail.product.entity.CategoryBrandRelationEntity;
import com.liu.gulimail.product.service.CategoryBrandRelationService;


@Service("categoryBrandRelationService")
public class CategoryBrandRelationServiceImpl extends ServiceImpl<CategoryBrandRelationDao, CategoryBrandRelationEntity> implements CategoryBrandRelationService {
    @Autowired
    BrandDao brandDao;
    @Autowired
    CategoryDao categoryDao;
    @Autowired
    CategoryBrandRelationDao RelationDao;
    @Autowired
    BrandService brandService;


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CategoryBrandRelationEntity> page = this.page(
                new Query<CategoryBrandRelationEntity>().getPage(params),
                new QueryWrapper<CategoryBrandRelationEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<CategoryBrandRelationVo> queryRelationList(CategoryBrandRelationVo categoryBrandRelationVo, Long brandId) {
        List<CategoryBrandRelationEntity> dataList = baseMapper.selectList(
                new QueryWrapper<CategoryBrandRelationEntity>().eq("brand_id", brandId));
        List<CategoryBrandRelationVo> relationVos = new ArrayList<>();
        CategoryBrandRelationVo categoryBrandRelationVo1 = new CategoryBrandRelationVo();
        for (CategoryBrandRelationEntity data : dataList) {
            categoryBrandRelationVo1.setCatelogId(data.getCatelogId());
            categoryBrandRelationVo1.setCatelogName(data.getCatelogName());
            categoryBrandRelationVo1.setBrandName(data.getBrandName());
            relationVos.add(categoryBrandRelationVo1);
        }
        return relationVos;
    }

    /**
     * 注入brandDao和categoryDao来避免多表查询
     * @param categoryBrandRelation
     */
    @Override
    public void saveDetail(CategoryBrandRelationEntity categoryBrandRelation) {
        //brandName和catelogName是增加的两个冗余字段
        //数据库最好不要做关联查询，十分影响性能
        Long brandId = categoryBrandRelation.getBrandId();
        Long catelogId = categoryBrandRelation.getCatelogId();
        //1.查询详细名字
        BrandEntity brandEntity = brandDao.selectById(brandId);
        CategoryEntity categoryEntity = categoryDao.selectById(catelogId);
        categoryBrandRelation.setBrandName(brandEntity.getName());
        categoryBrandRelation.setCatelogName(categoryEntity.getName());
        this.save(categoryBrandRelation);
    }

    /**
     * 修改品牌关联
     */
    @Override
    public void updateBrand(Long brandId, String name) {
        CategoryBrandRelationEntity relationEntity = new CategoryBrandRelationEntity();
        relationEntity.setBrandId(brandId);
        relationEntity.setBrandName(name);
        this.update(relationEntity,new UpdateWrapper<CategoryBrandRelationEntity>().eq("brand_id",brandId));
    }

    /**
     * 修改商品关联
     */
    @Override
    public void updateCategory(Long catId, String name) {
        baseMapper.updateCategory(catId,name);
    }

    @Override
    public List<BrandVo> getBrandsBycatId(Long catId) {

        List<CategoryBrandRelationEntity> catelogId = RelationDao.selectList(
                new QueryWrapper<CategoryBrandRelationEntity>()
                .eq("catelog_id", catId));
        List<BrandVo> collect = catelogId.stream().map(item -> {
            BrandVo brandVo = new BrandVo();
            Long brandId = item.getBrandId();
            BrandEntity byId = brandService.getById(brandId);
            brandVo.setBrandId(byId.getBrandId());
            brandVo.setBrandName(byId.getName());
            return brandVo;
        }).collect(Collectors.toList());
        return collect;
    }

}