package com.yuguo.net.service;


import java.util.List;
import java.util.Map;

import com.yuguo.net.model.MallGoodsInfo;
import com.yuguo.net.model.MallGoodsInfoExample;

public interface MallGoodsInfoService {
	public void updateByPrimaryKey(MallGoodsInfo mallInfo);
	public List<MallGoodsInfo> selectxml(MallGoodsInfoExample example);
	public int countByExample(MallGoodsInfoExample giExample);
	int updateByExample(MallGoodsInfo record, MallGoodsInfoExample example);
	
	int updateAllAuditStatusByInfo(MallGoodsInfoExample example);
	int updateAuditByInfo(MallGoodsInfoExample example);
	
	/**
	 * 根据商家ID查询商品销售排行榜top num
	 * @param merchantId 商家ID
	 * @param num top 数值
	 * @return
	 * */
	Map<String, Object> selectgoodsSaleTopByMerchantId(String merchantId,Integer num);
}
