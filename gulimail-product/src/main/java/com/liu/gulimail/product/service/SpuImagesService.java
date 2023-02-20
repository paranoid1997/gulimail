package com.liu.gulimail.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.liu.common.utils.PageUtils;
import com.liu.gulimail.product.entity.SpuImagesEntity;

import java.util.List;
import java.util.Map;

/**
 *
 * @author liusenbiao
 * @email 1805336068@qq.com
 * @date 2022-04-09 23:19:20
 */
public interface SpuImagesService extends IService<SpuImagesEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveImages(Long id, List<String> images);
}

