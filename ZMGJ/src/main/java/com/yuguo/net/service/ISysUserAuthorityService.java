package com.yuguo.net.service;

import java.util.List;

import com.yuguo.net.model.SysUserAuthority;
import com.yuguo.net.model.SysUserAuthorityExample;


public interface ISysUserAuthorityService {
	List<SysUserAuthority> selectByExample(SysUserAuthorityExample example)throws Exception;
	SysUserAuthority selectByPrimaryKey(String authId)throws Exception;
	void insertSelective(SysUserAuthority record)throws Exception;
	int updateByPrimaryKeySelective(SysUserAuthority record);
	void deleteByPrimaryKey(String authId)throws Exception;
}
