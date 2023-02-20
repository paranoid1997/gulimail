package com.liu.gulimail.product.vo;

import lombok.Data;

@Data
public class QuerySpuInfoListVo {
    /**
     *  page: 1,//当前页码
     *    limit: 10,//每页记录数
     *    sidx: 'id',//排序字段
     *    order: 'asc/desc',//排序方式
     *    key: '华为',//检索关键字
     *    catelogId: 6,//三级分类id
     *    brandId: 1,//品牌id
     *    status: 0,//商品状态
     */
    private Long page;
    private Long limit;
    private String sidx;
    private String order;
    private String key;
    private Long catelogId;
    private Long brandId;
    private int status;
}
