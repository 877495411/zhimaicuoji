package com.yuguo.net.service;

import java.util.List;
import java.util.Map;

import com.yuguo.net.model.SysAdvertiseAdmin;
import com.yuguo.net.model.SysAdvertiseAdminExample;


public interface ISysAdvertiseAdminService {
	 void insert(SysAdvertiseAdmin record);
	 List<SysAdvertiseAdmin> selectByExample(SysAdvertiseAdminExample example);
	 SysAdvertiseAdmin selectByPrimaryKey(String adId);
	 int updateByPrimaryKeyWithBLOBs(SysAdvertiseAdmin record);
	 int deleteByPrimaryKey(String adId);
	/**
	 * @param pId
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	Map<String, Object> getAdvertiseInfoByDicId(String pId, String page) throws Exception;
}