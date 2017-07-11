package com.yuguo.net.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yuguo.net.dao.IMallGoodsInfoDAO;
import com.yuguo.net.model.MallGoodsInfo;
import com.yuguo.net.model.MallGoodsInfoExample;
import com.yuguo.net.service.MallGoodsInfoService;
import com.yuguo.net.vo.SaleRankListVo;
@Service
@Transactional
public class MallGoodsInfoServiceImpl implements MallGoodsInfoService {
	@Resource
	private IMallGoodsInfoDAO tMallGoodInfoDAO;

	public void updateByPrimaryKey(MallGoodsInfo mallInfo) {
		tMallGoodInfoDAO.updateByPrimaryKeyWithBLOBs(mallInfo);
	}

	public List<MallGoodsInfo> selectxml(MallGoodsInfoExample example) {
		
		return tMallGoodInfoDAO.selectByExampleWithBLOBs(example);
	}
	
	public int countByExample(MallGoodsInfoExample example){
		return tMallGoodInfoDAO.countByExample(example);
	}

	public int updateByExample(MallGoodsInfo record,
			MallGoodsInfoExample example) {
		return tMallGoodInfoDAO.updateByExample(record, example);
	}
	
	public int updateAllAuditStatusByInfo(MallGoodsInfoExample example) {
		return tMallGoodInfoDAO.updateAllAuditStatusByInfo(example);
	}

	public int updateAuditByInfo(MallGoodsInfoExample example) {
		return tMallGoodInfoDAO.updateAuditByInfo(example);
	}

	public Map<String, Object> selectgoodsSaleTopByMerchantId(String merchantId,Integer num) {
		List<String> xNames = new ArrayList<String>();
		Map<String,Object> map = new HashMap<String, Object>();
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("merchantId", merchantId);
		param.put("num", num);
		List<SaleRankListVo> list = tMallGoodInfoDAO.selectgoodsSaleTopByMerchantId(param);
		for (int i = 0; i <list.size(); i++) {
			xNames.add(list.get(i).getName());
		}
		map.put("counts", list);
		map.put("xNames", xNames);
		return map;
	}
}
