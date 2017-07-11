package com.yuguo.net.service;

import java.util.List;

import com.yuguo.net.model.SysUserRole;
import com.yuguo.net.model.SysUserRoleExample;

public interface ISysUserRoleService {
	List<SysUserRole> selectByExample(SysUserRoleExample example)throws Exception;
	SysUserRole selectByPrimaryKey(String roleId)throws Exception;
	void insertSelective(SysUserRole record)throws Exception;
	int updateByPrimaryKeySelective(SysUserRole record);
	void deleteByPrimaryKey(String roleId)throws Exception;
}
