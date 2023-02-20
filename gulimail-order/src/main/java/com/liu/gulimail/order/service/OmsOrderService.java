package com.liu.gulimail.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.liu.common.utils.PageUtils;
import com.liu.gulimail.order.entity.OmsOrderEntity;

import java.util.Map;

/**
 * ????
 *
 * @author liusenbiao
 * @email 1805336068@qq.com
 * @date 2022-04-10 00:23:55
 */
public interface OmsOrderService extends IService<OmsOrderEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

