package com.liu.gulimail.product.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * spu??Ϣ
 * 
 * @author liusenbiao
 * @email 1805336068@qq.com
 * @date 2022-04-09 23:19:20
 */
@Data
@TableName("pms_spu_info")
public class SpuInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Long id;
	/**
	 * spu名字
	 */
	private String spuName;
	/**
	 * 商品描述
	 */
	private String spuDescription;
	/**
	 * 分类id
	 */
	private Long catalogId;
	/**
	 * 品牌d
	 */
	private Long brandId;
	/**
	 * 重量
	 */
	private BigDecimal weight;
	/**
	 * 上架状态
	 */
	private Integer publishStatus;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 更新时间
	 */
	private Date updateTime;

}
