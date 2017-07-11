package com.yuguo.net.service;

import java.util.List;

import com.yuguo.net.model.MallGoods;
import com.yuguo.net.model.MallGoodsClass;
import com.yuguo.net.model.MallGoodsClassExample;
import com.yuguo.net.model.MallGoodsExample;
import com.yuguo.net.model.MallGoodsInfo;
import com.yuguo.net.model.MallGoodsInfoExample;

public interface MallGoodsService {
	//查询商品表和商品信息表
	List<MallGoods> selectByExample(MallGoodsExample example) throws Exception;
	//商品表和商品类型表
	List<MallGoodsClass> selectClassByExample(MallGoodsClassExample example) throws Exception;
	//查询商品类型表
	List<MallGoodsClass> selectClass(MallGoodsClassExample example) throws Exception;
	//查询商品额外信息表
	List<MallGoodsInfo> selectInfo(MallGoodsInfoExample example) throws Exception;
	//添加商品-->商品表
	void addGoods(MallGoods mallGoods);
	//添加商品-->商品分类表
	void addClass(MallGoodsClass mallGoodsClass);
	//添加商品-->商品信息表
	void addInFo(MallGoodsInfo tMallGoodInfo);
	//修改商品
	void updGoods(MallGoods mallGoods);
	//修改商品信息
	void updInfo(MallGoodsInfo record, MallGoodsInfoExample example);
	
	void updInfoRecord(MallGoodsInfo record);
	//修改类目
	int updateByPrimaryKey(MallGoodsClass record);
	//根据条件修改
	int updateByExample(MallGoodsClass record, MallGoodsClassExample example) ;
	//删除类目
	int deleteByPrimaryKey(String id);
	//商品数量
	int countByExample(MallGoodsInfoExample example);
	
	List<MallGoods> selectTwoTableWithBLOBs(MallGoodsExample example)throws Exception;
	
	int countTwoByExample(MallGoodsExample example);
	
	int selectClassMaxIndexByExample(MallGoodsClassExample example) throws Exception;
	
	//查询商品类型表
	 MallGoodsClass selectClassById(String id) throws Exception;
	List<MallGoods> selectGoodsIdByGoodsClass(String goodsClass);
	
	public List<MallGoods> selectTwoTable(MallGoodsExample example);
}
