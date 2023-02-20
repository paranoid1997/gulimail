package com.liu.gulimail.product.vo;

import lombok.Data;

@Data
public class AttrResponseVo extends AttrVo {
    /**
     * 所属分类的名字
     */
    private String catelogName;
    /**
     * 所属分组的名字
     */
    private String groupName;
    /**
     * 分类完整路径
     */
    private Long[] catelogPath;
}
