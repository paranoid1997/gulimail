package com.liu.gulimail.product.vo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class AttrVo {
        /**
         * 属性id
         */
        @TableId
        private Long attrId;
        /**
         * 属性名
         */
        private String attrName;
        /**
         * 是否需要检索[0-不需要，1-需要]
         */
        private Integer searchType;
        /**
         * 图标
         */
        private String icon;
        /**
         *值选择
         */
        private String valueSelect;
        /**
         *attr类型
         */
        private Integer attrType;
        /**
         * 启用状态[0-禁用，1-启用]
         */
        private Long enable;
        /**
         * 所属分类
         */
        private Long catelogId;
        /**
         * 快速展示【是否在展示上介绍 0-否，1-是】在sku中仍然可以调整
         */
        private Integer showDesc;

        private Long attrGroupId;

}
