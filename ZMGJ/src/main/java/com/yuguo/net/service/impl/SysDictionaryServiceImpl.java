package com.yuguo.net.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yuguo.net.dao.ISysDictionaryDAO;
import com.yuguo.net.model.SysDictionary;
import com.yuguo.net.model.SysDictionaryExample;
import com.yuguo.net.service.ISysDictionaryService;


@Service
@Transactional
public class SysDictionaryServiceImpl implements ISysDictionaryService {
	@Resource
	private ISysDictionaryDAO sysDictionaryDao ;
	
	public List<SysDictionary> selectByExample(SysDictionaryExample example) throws Exception{
		return sysDictionaryDao.selectByExample(example);
	}

	public int countByExample(SysDictionaryExample example) {
		return sysDictionaryDao.countByExample(example);
	}

	public int deleteByPrimaryKey(Long id) {
		return sysDictionaryDao.deleteByPrimaryKey(id);
	}

	public void insertSelective(SysDictionary record) {
		sysDictionaryDao.insertSelective(record);
	}

	public int updateByPrimaryKeySelective(SysDictionary record) {
		return sysDictionaryDao.updateByPrimaryKeySelective(record);
	}
	
	/* (non-Javadoc)
	 * @see com.yuguo.net.service.ISysDictionaryService#getModules()
	 */
	@Override
	public Map<String, Object> getModules() throws Exception {
		SysDictionaryExample example = new SysDictionaryExample();
		SysDictionaryExample.Criteria cri = example.createCriteria();
		cri.andRemarkEqualTo("0");
		List<SysDictionary> list = selectByExample(example);
		Map<String,Object> jsonResult = new HashMap<String, Object>();
		if(list != null && list.size() > 0) {
			jsonResult.put("success", Boolean.TRUE);
			jsonResult.put("list", list);
		}else {
			jsonResult.put("success", Boolean.FALSE);
		}
		return jsonResult;
		
	}
	
	@Override
	public Map<String, Object> getModulesByParentId(String pId) throws Exception {
		SysDictionaryExample example = new SysDictionaryExample();
		SysDictionaryExample.Criteria cri = example.createCriteria();
		cri.andRemarkEqualTo(pId);
		List<SysDictionary> list = selectByExample(example);
		Map<String,Object> jsonResult = new HashMap<String, Object>();
		if(list != null && list.size() > 0) {
			jsonResult.put("success", Boolean.TRUE);
			jsonResult.put("list", list);
		}else {
			jsonResult.put("success", Boolean.FALSE);
		}
		return jsonResult;
	}
}