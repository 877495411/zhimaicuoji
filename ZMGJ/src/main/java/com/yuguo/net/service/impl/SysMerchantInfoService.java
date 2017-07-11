package com.yuguo.net.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yuguo.net.dao.ISysMerchantInfoDAO;
import com.yuguo.net.model.SysMerchantInfo;
import com.yuguo.net.model.SysMerchantInfoExample;
import com.yuguo.net.service.ISysMerchantInfoService;


@Service
@Transactional
public class SysMerchantInfoService implements ISysMerchantInfoService{
	@Resource
	private ISysMerchantInfoDAO sysMerchantInfoDAO;

	public List<SysMerchantInfo> selectByExample(SysMerchantInfoExample example) {
		return sysMerchantInfoDAO.selectByExample(example);
	}

	public int updateByPrimaryKey(SysMerchantInfo record) {
		return sysMerchantInfoDAO.updateByPrimaryKey(record);
	}

	public void insert(SysMerchantInfo record) {
		sysMerchantInfoDAO.insert(record);
	}

	public SysMerchantInfo selectByPrimaryKey(String id) {
		return sysMerchantInfoDAO.selectByPrimaryKey(id);
	}

	public SysMerchantInfo getMerchantInfoByNameOrPhone(String search) {
		return sysMerchantInfoDAO.getMerchantInfoByNameOrPhone(search);
	}

	public int updateByPrimaryKeySelective(SysMerchantInfo record) {

		return sysMerchantInfoDAO.updateByPrimaryKeySelective(record);
	}

	public int countByExample(SysMerchantInfoExample example) {

		return sysMerchantInfoDAO.countByExample(example);
	}

	public List<SysMerchantInfo> selectTwoTableByExample(SysMerchantInfoExample example) {
		
		return sysMerchantInfoDAO.selectTwoTableByExample(example);
	}
	

}
