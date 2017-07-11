package com.yuguo.net.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yuguo.net.dao.ISysUserAuthorityDAO;
import com.yuguo.net.model.SysUserAuthority;
import com.yuguo.net.model.SysUserAuthorityExample;
import com.yuguo.net.service.ISysUserAuthorityService;

@Service
@Transactional
public class SysUserAuthorityService implements ISysUserAuthorityService{
	@Resource
	private ISysUserAuthorityDAO sysUserAuthorityDAO;
	
	public List<SysUserAuthority> selectByExample(
			SysUserAuthorityExample example) throws Exception {
		return sysUserAuthorityDAO.selectByExample(example);
	}

	public SysUserAuthority selectByPrimaryKey(String authId)
			throws Exception {
		return sysUserAuthorityDAO.selectByPrimaryKey(authId);
	}

	public void insertSelective(SysUserAuthority record) throws Exception {
		sysUserAuthorityDAO.insertSelective(record);
		
	}

	public int updateByPrimaryKeySelective(SysUserAuthority record) {
		return sysUserAuthorityDAO.updateByPrimaryKeySelective(record);
	}

	public void deleteByPrimaryKey(String authId) throws Exception {
		sysUserAuthorityDAO.deleteByPrimaryKey(authId);
	}
}
