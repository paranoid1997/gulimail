package com.liu.gulimail.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.liu.common.utils.PageUtils;
import com.liu.gulimail.product.entity.SkuInfoEntity;

import java.util.Map;

/**
 * @author liusenbiao
 * @email 1805336068@qq.com
 * @date 2022-04-09 23:19:20
 */
public interface SkuInfoService extends IService<SkuInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveSkuInfo(SkuInfoEntity skuInfoEntity);
}

