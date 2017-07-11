package com.yuguo.net.service;

import java.util.List;
import java.util.Map;

import com.yuguo.net.model.SysDictionary;
import com.yuguo.net.model.SysDictionaryExample;


public interface ISysDictionaryService {
	List<SysDictionary> selectByExample(SysDictionaryExample example) throws Exception;
	
	int countByExample(SysDictionaryExample example);
	
	int deleteByPrimaryKey(Long id);
	
	void insertSelective(SysDictionary record);
	
	int updateByPrimaryKeySelective(SysDictionary record);

	/**
	 * @return
	 * @throws Exception 
	 */
	Map<String, Object> getModules() throws Exception;

	/**
	 * @param pId
	 * @return
	 * @throws Exception 
	 */
	Map<String, Object> getModulesByParentId(String pId) throws Exception;
}