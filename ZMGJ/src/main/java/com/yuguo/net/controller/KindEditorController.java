package com.yuguo.net.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuguo.net.model.SysPictureInfo;
import com.yuguo.net.service.impl.KindEditorService;
import com.yuguo.net.utils.GrnerateUUID;

@Scope("request")
@RequestMapping("/system/utils")
public class KindEditorController {
	private KindEditorService kindEditorService;
	
    public void saveFileInfo(String filePath,String fileName,HttpServletRequest request){
    	String uuid = GrnerateUUID.getUUID();
    	Date loadTime = new Date();
		SysPictureInfo tSysPicUpload = new SysPictureInfo();
		tSysPicUpload.setId(uuid);
		tSysPicUpload.setFileName(fileName);
		tSysPicUpload.setPicPath("attached"+filePath.split("attached")[1]);
		tSysPicUpload.setLoadTime(loadTime);
		String operName=request.getParameter("userName");
		if(operName!=null&&!"".equals(operName)){
			tSysPicUpload.setOperate(operName);
		}else{
			tSysPicUpload.setOperate("kindeditor");
		}
		tSysPicUpload.setIsUpload("0");
		kindEditorService.insert(tSysPicUpload);
    }

	public KindEditorService getKindEditorService() {
		return kindEditorService;
	}

	public void setKindEditorService(KindEditorService kindEditorService) {
		this.kindEditorService = kindEditorService;
	}
}
