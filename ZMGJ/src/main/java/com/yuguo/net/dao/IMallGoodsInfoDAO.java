package com.yuguo.net.dao;

import java.util.List;
import java.util.Map;

import com.yuguo.net.model.MallGoodsInfo;
import com.yuguo.net.model.MallGoodsInfoExample;
import com.yuguo.net.vo.SaleRankListVo;

public interface IMallGoodsInfoDAO {
    /**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table t_mall_goods_info
	 * @ibatorgenerated  Thu Dec 22 10:37:24 CST 2016
	 */
	int countByExample(MallGoodsInfoExample example);

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table t_mall_goods_info
	 * @ibatorgenerated  Thu Dec 22 10:37:24 CST 2016
	 */
	int deleteByExample(MallGoodsInfoExample example);

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table t_mall_goods_info
	 * @ibatorgenerated  Thu Dec 22 10:37:24 CST 2016
	 */
	int deleteByPrimaryKey(String goodsId, Long id);

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table t_mall_goods_info
	 * @ibatorgenerated  Thu Dec 22 10:37:24 CST 2016
	 */
	void insert(MallGoodsInfo record);

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table t_mall_goods_info
	 * @ibatorgenerated  Thu Dec 22 10:37:24 CST 2016
	 */
	void insertSelective(MallGoodsInfo record);

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table t_mall_goods_info
	 * @ibatorgenerated  Thu Dec 22 10:37:24 CST 2016
	 */
	List<MallGoodsInfo> selectByExampleWithBLOBs(MallGoodsInfoExample example);

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table t_mall_goods_info
	 * @ibatorgenerated  Thu Dec 22 10:37:24 CST 2016
	 */
	List<MallGoodsInfo> selectByExampleWithoutBLOBs(MallGoodsInfoExample example);

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table t_mall_goods_info
	 * @ibatorgenerated  Thu Dec 22 10:37:24 CST 2016
	 */
	MallGoodsInfo selectByPrimaryKey(String goodsId, Long id);

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table t_mall_goods_info
	 * @ibatorgenerated  Thu Dec 22 10:37:24 CST 2016
	 */
	int updateByExampleSelective(MallGoodsInfo record,
			MallGoodsInfoExample example);

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table t_mall_goods_info
	 * @ibatorgenerated  Thu Dec 22 10:37:24 CST 2016
	 */
	int updateByExample(MallGoodsInfo record, MallGoodsInfoExample example);

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table t_mall_goods_info
	 * @ibatorgenerated  Thu Dec 22 10:37:24 CST 2016
	 */
	int updateByExampleWithoutBLOBs(MallGoodsInfo record,
			MallGoodsInfoExample example);

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table t_mall_goods_info
	 * @ibatorgenerated  Thu Dec 22 10:37:24 CST 2016
	 */
	int updateByPrimaryKeySelective(MallGoodsInfo record);

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table t_mall_goods_info
	 * @ibatorgenerated  Thu Dec 22 10:37:24 CST 2016
	 */
	int updateByPrimaryKeyWithBLOBs(MallGoodsInfo record);

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table t_mall_goods_info
	 * @ibatorgenerated  Thu Dec 22 10:37:24 CST 2016
	 */
	int updateByPrimaryKeyWithoutBLOBs(MallGoodsInfo record);

	int updateAllAuditStatusByInfo(MallGoodsInfoExample example);
    
    int updateAuditByInfo(MallGoodsInfoExample example);
    /**
     * 鏍规嵁鍟嗗ID鏌ヨ閿�敭鎺掕姒�
     * */
	List<SaleRankListVo> selectgoodsSaleTopByMerchantId(Map<String,Object> param);
}