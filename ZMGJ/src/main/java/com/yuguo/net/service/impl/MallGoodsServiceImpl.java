package com.yuguo.net.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yuguo.net.dao.IMallGoodsClassDAO;
import com.yuguo.net.dao.IMallGoodsDAO;
import com.yuguo.net.dao.IMallGoodsInfoDAO;
import com.yuguo.net.model.MallGoods;
import com.yuguo.net.model.MallGoodsClass;
import com.yuguo.net.model.MallGoodsClassExample;
import com.yuguo.net.model.MallGoodsExample;
import com.yuguo.net.model.MallGoodsInfo;
import com.yuguo.net.model.MallGoodsInfoExample;
import com.yuguo.net.service.MallGoodsService;

@Service
@Transactional
public class MallGoodsServiceImpl implements MallGoodsService {
	@Resource
	private IMallGoodsDAO mallGoodsDAO;
	@Resource
	private IMallGoodsClassDAO mallGoodsClassDAO;
	@Resource
	private IMallGoodsInfoDAO tMallGoodInfoDAO;

	public List<MallGoods> selectByExample(MallGoodsExample example)
			throws Exception {
		return mallGoodsDAO.selectTwoTable(example);
	}

	public List<MallGoodsClass> selectClassByExample(
			MallGoodsClassExample example) throws Exception {
		return mallGoodsClassDAO.selectByExample(example);
	}

	public List<MallGoodsClass> selectClass(MallGoodsClassExample example)
			throws Exception {
		return mallGoodsClassDAO.selectByExample(example);
	}

	public List<MallGoodsInfo> selectInfo(MallGoodsInfoExample example)
			throws Exception {
		return tMallGoodInfoDAO.selectByExampleWithBLOBs(example);
	}

	public void addGoods(MallGoods mallGoods) {
		mallGoodsDAO.insert(mallGoods);

	}

	public void addClass(MallGoodsClass mallGoodsClass) {
		mallGoodsClassDAO.insert(mallGoodsClass);
	}

	public void addInFo(MallGoodsInfo tMallGoodInfo) {
		tMallGoodInfoDAO.insert(tMallGoodInfo);
	}

	public void updGoods(MallGoods mallGoods) {
		mallGoodsDAO.updateByPrimaryKeyWithBLOBs(mallGoods);
	}

	public void updInfo(MallGoodsInfo record, MallGoodsInfoExample example) {
		tMallGoodInfoDAO.updateByExample(record, example);
	}

	public void updInfoRecord(MallGoodsInfo record) {
		tMallGoodInfoDAO.updateByPrimaryKeyWithBLOBs(record);
		
		
	}

	public int updateByPrimaryKey(MallGoodsClass record) {
		return mallGoodsClassDAO.updateByPrimaryKey(record);
	}
	
	public int updateByExample(MallGoodsClass record,
			MallGoodsClassExample example) {
		return mallGoodsClassDAO.updateByExample(record, example);
	}

	public int deleteByPrimaryKey(String id) {
		return mallGoodsClassDAO.deleteByPrimaryKey(id);
	}
	
	public int countByExample(MallGoodsInfoExample example) {
		return tMallGoodInfoDAO.countByExample(example);
	}
	
	public List<MallGoods> selectTwoTableWithBLOBs(MallGoodsExample example)
			throws Exception {
		return mallGoodsDAO.selectTwoTableWithBLOBs(example);
	}
	
	public int countTwoByExample(MallGoodsExample example) {
		return mallGoodsDAO.countTwoByExample(example);
	}

	public int selectClassMaxIndexByExample(MallGoodsClassExample example)
			throws Exception {
		return mallGoodsClassDAO.selectClassMaxIndexByExample(example);
	}

	public MallGoodsClass selectClassById(String id) throws Exception {
		return mallGoodsClassDAO.selectByPrimaryKey(id);
	}
	public List<MallGoods> selectGoodsIdByGoodsClass(String goodsClass) {
		return mallGoodsDAO.selectGoodsIdByGoodsClass(goodsClass);
	}

	public List<MallGoods> selectTwoTable(MallGoodsExample example) {
		
		return mallGoodsDAO.selectTwoTable(example);
	}
}
