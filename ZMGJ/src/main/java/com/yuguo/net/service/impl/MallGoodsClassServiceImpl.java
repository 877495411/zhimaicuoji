package com.yuguo.net.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yuguo.net.dao.IMallGoodsClassDAO;
import com.yuguo.net.model.MallGoodsClass;
import com.yuguo.net.model.MallGoodsClassExample;
import com.yuguo.net.service.IMallGoodsClassService;

@Service
@Transactional
public class MallGoodsClassServiceImpl implements IMallGoodsClassService {

	@Resource
	private IMallGoodsClassDAO mallGoodsClassDAO;
	
	public List<MallGoodsClass> getClassNameForHotWords() {
		return mallGoodsClassDAO.getClassNameForHotWords();
	}
//根据条件查询出分类信息
	public List<MallGoodsClass> selectByExample(MallGoodsClassExample example) {
		
		return mallGoodsClassDAO.selectByExample(example);
	}

	public Map<String,Object> selectByExample() {
		MallGoodsClassExample example = new MallGoodsClassExample();
		MallGoodsClassExample.Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo("0");
		List<MallGoodsClass> list = mallGoodsClassDAO.selectByExample(example);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list);
		if(list == null || list.size() == 0) {
			map.put("success", false);
		} else {
			map.put("success",true);
		}
		return map;
	}

}
