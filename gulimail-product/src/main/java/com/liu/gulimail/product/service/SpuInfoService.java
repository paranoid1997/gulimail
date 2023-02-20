package com.liu.gulimail.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.liu.common.utils.PageUtils;
import com.liu.gulimail.product.entity.SpuInfoDescEntity;
import com.liu.gulimail.product.entity.SpuInfoEntity;
import com.liu.gulimail.product.vo.QuerySpuInfoListVo;
import com.liu.gulimail.product.vo.SpuSaveVo;

import java.util.Map;

/**
 * @author liusenbiao
 * @email 1805336068@qq.com
 * @date 2022-04-09 23:19:20
 */
public interface SpuInfoService extends IService<SpuInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveSpuInfo(SpuSaveVo vo);

    void saveBaseSpuInfo(SpuInfoEntity infoEntity);

    void saveSpuInfoDesc(SpuInfoDescEntity spuInfoDescEntity);

    PageUtils queryPageByCondition(Map<String, Object> params, QuerySpuInfoListVo querySpuInfoListVo);
}

