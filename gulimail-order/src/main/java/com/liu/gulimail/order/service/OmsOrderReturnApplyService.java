package com.liu.gulimail.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.liu.common.utils.PageUtils;
import com.liu.gulimail.order.entity.OmsOrderReturnApplyEntity;

import java.util.Map;

/**
 * ?????˻????
 *
 * @author liusenbiao
 * @email 1805336068@qq.com
 * @date 2022-04-10 00:23:56
 */
public interface OmsOrderReturnApplyService extends IService<OmsOrderReturnApplyEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

