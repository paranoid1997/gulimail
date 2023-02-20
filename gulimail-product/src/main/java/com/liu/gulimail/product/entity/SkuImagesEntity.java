package com.liu.gulimail.product.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * skuͼƬ
 * 
 * @author liusenbiao
 * @email 1805336068@qq.com
 * @date 2022-04-09 23:19:21
 */
@Data
@TableName("pms_sku_images")
public class SkuImagesEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Long id;
	/**
	 * sku_id
	 */
	private Long skuId;
	/**
	 * 图片url地址
	 */
	private String imgUrl;
	/**
	 * 图片排序
	 */
	private Integer imgSort;
	/**
	 * 默认图片
	 */
	private Integer defaultImg;

}
