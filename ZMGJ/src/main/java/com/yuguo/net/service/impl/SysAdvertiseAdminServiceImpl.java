package com.yuguo.net.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yuguo.net.dao.ISysAdvertiseAdminDAO;
import com.yuguo.net.model.SysAdvertiseAdmin;
import com.yuguo.net.model.SysAdvertiseAdminExample;
import com.yuguo.net.service.ISysAdvertiseAdminService;

@Service
@Transactional
public class SysAdvertiseAdminServiceImpl implements ISysAdvertiseAdminService {
	@Resource
	private ISysAdvertiseAdminDAO sysAdvertiseAdminDAO;

	public void insert(SysAdvertiseAdmin record) {
		sysAdvertiseAdminDAO.insert(record);
	}

	public SysAdvertiseAdmin selectByPrimaryKey(String adId) {
		return sysAdvertiseAdminDAO.selectByPrimaryKey(adId);
	}

	public int updateByPrimaryKeyWithBLOBs(SysAdvertiseAdmin record) {
		return sysAdvertiseAdminDAO.updateByPrimaryKeyWithBLOBs(record);
	}

	public int deleteByPrimaryKey(String adId) {
		return sysAdvertiseAdminDAO.deleteByPrimaryKey(adId);
	}

	@Override
	public Map<String, Object> getAdvertiseInfoByDicId(String pId, String page) throws Exception {
		int pageSize = 5;
		int pageIndex = page != null ? Integer.parseInt(page) : 1;
		int totalPage = 0;
		
		SysAdvertiseAdminExample example = new SysAdvertiseAdminExample();
		example.setFromNumber(pageSize * (pageIndex - 1));
		example.setToNumber(pageSize);
		example.setOrderByClause("sysAdvertiseAdmin.CREATE_TIME DESC");
		SysAdvertiseAdminExample.Criteria cri = example.createCriteria();
		cri.andAdTypeEqualTo(pId);
		List<SysAdvertiseAdmin> list = selectByExample(example);
		
		SysAdvertiseAdminExample e2 = new SysAdvertiseAdminExample();
		e2.createCriteria().andAdTypeEqualTo(pId);
		int count = sysAdvertiseAdminDAO.countByExample(e2);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		if(count != 0) {
			totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
		}
		if(list != null && list.size() > 0) {
			jsonResult.put("success", Boolean.TRUE);
			jsonResult.put("list", list);
			jsonResult.put("totalPages", totalPage);
			jsonResult.put("nowPage", page);
		} else {
			jsonResult.put("success", Boolean.FALSE);
		}
		return jsonResult;
	}

	@Override
	public List<SysAdvertiseAdmin> selectByExample(SysAdvertiseAdminExample example) {
		return sysAdvertiseAdminDAO.selectByExample(example);
	}
	
	

}