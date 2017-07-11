package com.yuguo.net.service.impl;

import org.springframework.transaction.annotation.Transactional;

import com.yuguo.net.dao.ISysPictureInfoDAO;
import com.yuguo.net.model.SysPictureInfo;
import com.yuguo.net.service.IKindEditorService;

@Transactional
public class KindEditorService implements IKindEditorService{
	private ISysPictureInfoDAO sysPictureInfoDAO;
	
	public void insert(SysPictureInfo tSysPicUpload) {
		sysPictureInfoDAO.insert(tSysPicUpload);
	}

	public ISysPictureInfoDAO getSysPictureInfoDAO() {
		return sysPictureInfoDAO;
	}

	public void setSysPictureInfoDAO(ISysPictureInfoDAO sysPictureInfoDAO) {
		this.sysPictureInfoDAO = sysPictureInfoDAO;
	}
	
}
