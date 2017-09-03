package com.yuguo.net.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yuguo.net.model.SysAdvertiseAdmin;
import com.yuguo.net.model.TSysAdvertise;
import com.yuguo.net.model.TSysAdvertiseExample;
import com.yuguo.net.service.ISysAdvertiseAdminService;
import com.yuguo.net.service.ISysAdvertiseService;
import com.yuguo.net.service.ISysDictionaryService;
import com.yuguo.net.utils.GrnerateUUID;
import com.yuguo.net.utils.ImageUtil;

/**
 * 
 * <p>
 * 广告
 * </p>
 * <p>
 * 创建日期：2015-08-24
 * </p>
 * 
 * @author xuxinhui
 */
@Scope("request")
@RequestMapping("/system/advertise")
@Component
public class SysAdvertiseController {
	@Resource
	private ISysAdvertiseService ISysAdvertiseService;
	@Resource
	private ISysDictionaryService sysDictionaryService;
	@Resource
	private ISysAdvertiseAdminService sysAdvertiseAdminService;

	/**
	 * 获取广告信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getAdvertiseInfo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> getAdvertiseInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdIdEqualTo(request.getParameter("adId"));
		List<TSysAdvertise> adAllInfo = ISysAdvertiseService.selectByExample(example);

		if (adAllInfo.size() > 0 && adAllInfo != null) {
			TSysAdvertise sysAdInfo = adAllInfo.get(0);
			if (!"".equals(adAllInfo.get(0).getAdDesc()) && adAllInfo.get(0).getAdDesc() != null) {
				byte[] adDesc = sysAdInfo.getAdDesc();
				String sadDesc = new String(adDesc);
				map.put("adDescInfo", sadDesc);
			} else {
				map.put("adDescInfo", "");
			}
			List<String> strImgArr = null;
			if (sysAdInfo.getImageUrl() != null && !"".equals(sysAdInfo.getImageUrl())) {
				String[] imgArr = sysAdInfo.getImageUrl().split(";");
				strImgArr = new ArrayList<String>();
				for (String img : imgArr) {
					strImgArr.add(img);
				}
			}
			List<String> strAdUrl = null;
			if (sysAdInfo.getAdUrl() != null && !"".equals(sysAdInfo.getAdUrl())) {
				String[] imgArr = sysAdInfo.getAdUrl().split(";");
				strAdUrl = new ArrayList<String>();
				for (String img : imgArr) {
					strAdUrl.add(img);
				}
			}
			map.put("adAllInfo", adAllInfo.get(0));
			map.put("strImgArr", strImgArr);
			map.put("strAdUrl", strAdUrl);
			map.put("success", Boolean.TRUE);
			/*
			 * map.put("adBTime",
			 * TimeUtils.dateToString(adAllInfo.get(0).getAdBegintime
			 * (),"yyyy-MM-dd HH:mm:ss")); map.put("adETime",
			 * TimeUtils.dateToString
			 * (adAllInfo.get(0).getAdEndtime(),"yyyy-MM-dd HH:mm:ss"));
			 */
		} else {
			map.put("success", Boolean.FALSE);
		}
		return map;
	}

	/**
	 * 新建广告
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/addAdvertise.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> addAdvertise(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int maxIndex = 1;
		List<TSysAdvertise> list = this.getMaxIndex();
		if(list!=null && list.size()==1){
			maxIndex += list.get(0).getAdIndex()==null?0:list.get(0).getAdIndex();
		}

		String adId = GrnerateUUID.getUUID();
		String adCustomerId = request.getSession().getAttribute("userName") + "";
		/*
		 * Date adSTime =
		 * TimeUtils.stringToDate(request.getParameter("adStime"),
		 * "yyyy-MM-dd HH:mm:ss"); Date adETime =
		 * TimeUtils.stringToDate(request.getParameter("adEtime"),
		 * "yyyy-MM-dd HH:mm:ss");
		 */
		String adTitle = request.getParameter("adTitle");
		String images = "";
		String adImgs = request.getParameter("adImg");
		String imgS[] = adImgs.split("attached");
		images = "attached" + imgS[1];

		TSysAdvertise sysAd = new TSysAdvertise();
		sysAd.setAdId(adId);
		sysAd.setAdTitle(adTitle);
		sysAd.setAdType(request.getParameter("adType"));
		sysAd.setAdUrl(request.getParameter("adUrl"));
		/*
		 * sysAd.setAdBegintime(adSTime); sysAd.setAdEndtime(adETime);
		 */
		sysAd.setAdCustomerId(adCustomerId);
		sysAd.setImageUrl(images);
		sysAd.setAdDetailDesc(request.getParameter("adXq"));
		sysAd.setRemark1("0");
		sysAd.setAdIndex(maxIndex);
		sysAd.setRemark(request.getParameter("goType"));
		byte[] d = request.getParameter("adDesc").getBytes();
		sysAd.setAdDesc(d);
		sysAd.setCreateTime(new Date());

		ISysAdvertiseService.addAdvertise(sysAd);
		map.put("success", Boolean.TRUE);
		map.put("adId", adId);
		return map;
	}

	/**
	 * 获取 广告 的 最大index记录
	 * @return
	 * @throws Exception
	 */
	public List<TSysAdvertise> getMaxIndex() throws Exception{
		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		example.setFromNumber(0);
		example.setToNumber(1);
		example.setOrderByClause("tSysAdvertise.AD_INDEX DESC");
		List<TSysAdvertise> list = ISysAdvertiseService.selectByExample(example);
		
		return list;
	}
	/**
	 * 检查广告标题是否已经存在 ture存在 ，false 不存在
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/checkAdvertiseTitle.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> checkAdvertiseTitle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> jsonResult = new HashMap<String, Object>();

		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdTitleEqualTo(request.getParameter("adTitle"));
		List<TSysAdvertise> adList = ISysAdvertiseService.selectByExample(example);
		if (adList != null && adList.size() > 0) {
			jsonResult.put("success", Boolean.TRUE);
		} else {
			jsonResult.put("success", Boolean.FALSE);
		}
		return jsonResult;
	}

	/**
	 * 广告分类中广告标题查询 ture存在 ，false 不存在
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getAdvertiseType.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> getAdvertiseTitle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		TSysAdvertiseExample example1 = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example1.createCriteria();
		criteria.andAdTypeEqualTo(request.getParameter("adType"));
		example1.setOrderByClause(" tSysAdvertise_AD_LOCATION ASC");
		List<TSysAdvertise> adList = ISysAdvertiseService.selectByExample(example1);
		if (adList != null && adList.size() > 0) {
			map.put("adInfo", adList);
			map.put("adNum", adList.size());
			map.put("success", Boolean.TRUE);
		} else {
			map.put("adNum", "0");
			map.put("success", Boolean.FALSE);
		}
		return map;
	}

	/**
	 * 广告修改
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getChangeAdvertise.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> getChangeAdvertise(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String adId = request.getParameter("adId");
		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdIdEqualTo(adId);
		List<TSysAdvertise> adList = ISysAdvertiseService.selectByExample(example);
		if (adList != null && adList.size() > 0) {
			String adCustomerId = request.getSession().getAttribute("userName") + "";
			/*
			 * Date adSTime =
			 * TimeUtils.stringToDate(request.getParameter("adStime"),
			 * "yyyy-MM-dd HH:mm:ss"); Date adETime =
			 * TimeUtils.stringToDate(request.getParameter("adEtime"),
			 * "yyyy-MM-dd HH:mm:ss");
			 */
			String adTitle = request.getParameter("adTitle");
			String images = "";
			String adImgs = request.getParameter("adImgxg");
			String imgS[] = adImgs.split("attached");
			images = "attached" + imgS[1];
			TSysAdvertise sysAd = new TSysAdvertise();
			sysAd.setAdId(adId);
			sysAd.setAdTitle(adTitle);
			sysAd.setAdType(request.getParameter("adType"));
			sysAd.setAdUrl(request.getParameter("adUrl"));
			/*
			 * sysAd.setAdBegintime(adSTime); sysAd.setAdEndtime(adETime);
			 */
			sysAd.setAdCustomerId(adCustomerId);
			sysAd.setImageUrl(images);
			sysAd.setAdDetailDesc(request.getParameter("adXq"));
			sysAd.setRemark1("0");
			sysAd.setRemark(request.getParameter("goType"));
			byte[] d = request.getParameter("adDesc").getBytes();
			sysAd.setAdDesc(d);
			sysAd.setCreateTime(new Date());

			ISysAdvertiseService.updateAdInfo(sysAd);
			map.put("success", Boolean.TRUE);
		} else {
			map.put("success", Boolean.FALSE);
		}
		return map;
	}

	/**
	 * 广告修改判断广告标题是否存在 ture不存在 ，false 存在
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getCkChangeAdvertise.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> getCkChangeAdvertise(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String adId = request.getParameter("adId");
		String adTitles = request.getParameter("adTitle");
		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdIdNotEqualTo(adId);
		criteria.andAdTitleEqualTo(adTitles);
		List<TSysAdvertise> ckTitle = ISysAdvertiseService.selectByExample(example);
		if (ckTitle != null && ckTitle.size() > 0) {
			map.put("isTitle", Boolean.FALSE);
		} else {
			map.put("isTitle", Boolean.TRUE);
		}
		return map;
	}

	/**
	 * 判断 上传广告是否上传 ture已经上传 ，false 末上传
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getAdvertiseIsUpload.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> getAdvertiseIsUpload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String adId = request.getParameter("adId");
		String isUpload = request.getParameter("isUpload");
		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdIdEqualTo(adId);
		criteria.andRemark1EqualTo(isUpload);

		List<TSysAdvertise> ckIsUpload = ISysAdvertiseService.selectByExample(example);
		if (ckIsUpload != null && ckIsUpload.size() > 0 && !"".equals(ckIsUpload.get(0).getRemark1())) {
			if (ckIsUpload.get(0).getRemark1() == "0") {
				map.put("isUpload", Boolean.TRUE);
			} else {
				map.put("isUpload", Boolean.FALSE);
			}
		} else {
			map.put("success", Boolean.FALSE);
		}
		return map;
	}

	/**
	 * 楼层查询
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getLcInfo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> getLcInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdTypeEqualTo("F");
		example.setOrderByClause(" tSysAdvertise_AD_LOCATION ASC");
		List<TSysAdvertise> lcAllInfo = ISysAdvertiseService.selectByExample(example);

		if (lcAllInfo.size() > 0 && lcAllInfo != null) {
			map.put("lcInfo", lcAllInfo);
			map.put("result", Boolean.TRUE);
		} else {
			map.put("result", Boolean.FALSE);
		}
		return map;
	}

	/**
	 * 新建楼层
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/addFloor.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> addFloor(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String adId = GrnerateUUID.getUUID();
		String adMh = request.getParameter("lcMh");
		int adPosition = Integer.parseInt(request.getParameter("adPosition"));
		String images = "";
		String adImgs = request.getParameter("lcImg");
		String imgS[] = adImgs.split("attached");
		images = "attached" + imgS[1];

		TSysAdvertise sysAd = new TSysAdvertise();
		sysAd.setAdId(adId);
		sysAd.setAdTitle(adMh);
		sysAd.setAdType("F");
		sysAd.setAdLocation(adPosition);
		sysAd.setImageUrl(images);
		sysAd.setAdDetailDesc(request.getParameter("lcBt"));
		sysAd.setRemark1("0");
		sysAd.setRemark(request.getParameter("lcMs"));
		sysAd.setCreateTime(new Date());

		ISysAdvertiseService.addAdvertise(sysAd);
		map.put("success", Boolean.TRUE);
		return map;
	}

	/**
	 * 楼层修改
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/floorChange.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> floorChange(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String adId = request.getParameter("adId");
		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdIdEqualTo(adId);
		List<TSysAdvertise> adList = ISysAdvertiseService.selectByExample(example);
		if (adList != null && adList.size() > 0) {
			String adMh = request.getParameter("lcMh");
			int adPosition = Integer.parseInt(request.getParameter("adPosition"));
			String images = "";
			String adImgs = request.getParameter("lcImg");
			String imgS[] = adImgs.split("attached");
			images = "attached" + imgS[1];
			TSysAdvertise sysAd = new TSysAdvertise();
			sysAd.setAdId(adId);
			sysAd.setAdTitle(adMh);
			sysAd.setAdLocation(adPosition);
			sysAd.setImageUrl(images);
			sysAd.setAdDetailDesc(request.getParameter("lcBt"));
			sysAd.setRemark1("0");
			sysAd.setRemark(request.getParameter("lcMs"));
			sysAd.setCreateTime(new Date());

			ISysAdvertiseService.updateAdInfo(sysAd);
			map.put("success", Boolean.TRUE);
		}
		return map;
	}

	/**
	 * 楼层修改判断楼层标题是否存在 ture不存在 ，false 存在
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ckChangeFloorBt.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> ckChangeFloorBt(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String adId = request.getParameter("adId");
		String lcbt = request.getParameter("lcbt");
		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdIdNotEqualTo(adId);
		criteria.andAdDetailDescEqualTo(lcbt);
		List<TSysAdvertise> ckTitle = ISysAdvertiseService.selectByExample(example);
		if (ckTitle != null && ckTitle.size() > 0) {
			map.put("isTitle", Boolean.FALSE);
		} else {
			map.put("isTitle", Boolean.TRUE);
		}
		return map;
	}

	/**
	 * 检查楼层标题是否已经存在 ture存在 ，false 不存在
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/checkAddFloor.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> checkAddFloor(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> jsonResult = new HashMap<String, Object>();

		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdTitleEqualTo(request.getParameter("lcMh"));
		List<TSysAdvertise> adList = ISysAdvertiseService.selectByExample(example);

		if (adList != null && adList.size() > 0) {
			jsonResult.put("success", Boolean.TRUE);
		} else {
			jsonResult.put("success", Boolean.FALSE);
		}
		return jsonResult;
	}

	/**
	 * 新建美妆广告
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveMzAdvertise.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> saveMzAdvertise(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		String adTitle = request.getParameter("adTitle");
		String adType = request.getParameter("adType");
		int adPage = Integer.parseInt(request.getParameter("adPage"));
		int adPosition = Integer.parseInt(request.getParameter("adPosition"));
		String imgUrl = request.getParameter("imgUrl");
		String adDetailDesc = request.getParameter("adDetailDesc"); // 广告描述
		String adImages = request.getParameter("adImages");
		String stradDesc = request.getParameter("adDesc");
		int saveType = Integer.parseInt(request.getParameter("saveType"));
		if (saveType == 0) {
			String adId = GrnerateUUID.getUUID();
			TSysAdvertise sysAd = new TSysAdvertise();
			sysAd.setAdId(adId);
			sysAd.setAdTitle(adTitle);
			sysAd.setAdType(adType);
			sysAd.setAdUrl(imgUrl);
			sysAd.setImageUrl(adImages);
			sysAd.setAdDetailDesc(adDetailDesc);
			sysAd.setAdLocation(adPosition);
			sysAd.setAdPageLocation(adPage);
			sysAd.setCreateTime(new Date());
			byte[] adDesc = stradDesc.getBytes();
			sysAd.setAdDesc(adDesc);
			sysAd.setRemark1("0"); // 是否已经上传

			ISysAdvertiseService.addAdvertise(sysAd);
			jsonResult.put("success", Boolean.TRUE);
			jsonResult.put("adId", adId);
		} else {
			String adId = request.getParameter("adId");
			if (adId != null && !"".equals(adId)) {
				TSysAdvertiseExample example = new TSysAdvertiseExample();
				TSysAdvertiseExample.Criteria criteria = example.createCriteria();
				criteria.andAdIdEqualTo(adId);
				List<TSysAdvertise> adList = ISysAdvertiseService.selectByExample(example);
				if (adList != null && adList.size() == 1) {
					TSysAdvertise sysAd = new TSysAdvertise();
					sysAd.setAdId(adId);
					sysAd.setAdUrl(imgUrl);
					sysAd.setImageUrl(adImages);
					sysAd.setAdDetailDesc(adDetailDesc);
					byte[] adDesc = stradDesc.getBytes();
					sysAd.setAdDesc(adDesc);
					sysAd.setCreateTime(new Date());
					sysAd.setRemark1("0"); // 是否已经上传

					ISysAdvertiseService.updateAdInfo(sysAd);

					jsonResult.put("success", Boolean.TRUE);
					jsonResult.put("adId", adId);
				} else {
					jsonResult.put("success", Boolean.FALSE);
				}
			} else {
				jsonResult.put("success", Boolean.FALSE);
			}
		}
		return jsonResult;
	}

	/**
	 * 获取美妆馆广告信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getMzAdvertise.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> getMzAdvertise(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdIdEqualTo(request.getParameter("adId"));
		List<TSysAdvertise> adAllInfo = ISysAdvertiseService.selectByExample(example);

		if (adAllInfo.size() > 0 && adAllInfo != null) {
			TSysAdvertise sysAdInfo = adAllInfo.get(0);
			if (!"".equals(adAllInfo.get(0).getAdDesc()) && adAllInfo.get(0).getAdDesc() != null) {
				byte[] adDesc = sysAdInfo.getAdDesc();
				String sadDesc = new String(adDesc);
				jsonResult.put("adDescInfo", sadDesc);
			} else {
				jsonResult.put("adDescInfo", "");
			}
			List<String> strImgArr = null;
			if (sysAdInfo.getImageUrl() != null && !"".equals(sysAdInfo.getImageUrl())) {
				String[] imgArr = sysAdInfo.getImageUrl().split(";");
				strImgArr = new ArrayList<String>();
				for (String img : imgArr) {
					strImgArr.add(img);
				}
			}
			List<String> strAdUrl = null;
			if (sysAdInfo.getAdUrl() != null && !"".equals(sysAdInfo.getAdUrl())) {
				String[] imgArr = sysAdInfo.getAdUrl().split(";");
				strAdUrl = new ArrayList<String>();
				for (String img : imgArr) {
					strAdUrl.add(img);
				}
			}
			jsonResult.put("adAllInfo", adAllInfo.get(0));
			jsonResult.put("strImgArr", strImgArr);
			jsonResult.put("strAdUrl", strAdUrl);
			jsonResult.put("success", Boolean.TRUE);
		} else {
			jsonResult.put("success", Boolean.FALSE);
		}
		return jsonResult;
	}

	/**
	 * 确定广告是否存在
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/chickAdIsExits.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> chickAdIsExits(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		String adType = request.getParameter("adType");
		// int adPage = Integer.parseInt(request.getParameter("adPage"));
		// int adPosition =
		// Integer.parseInt(request.getParameter("adPosition"));

		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdTypeEqualTo(adType);
		// criteria.andAdLocationEqualTo(adPosition);
		// criteria.andAdPageLocationEqualTo(adPage);
		List<TSysAdvertise> adAllInfo = ISysAdvertiseService.selectByExample(example);
		if (adAllInfo != null && adAllInfo.size() == 1) {
			jsonResult.put("adId", adAllInfo.get(0).getAdId());
			jsonResult.put("success", Boolean.TRUE);
		} else {
			jsonResult.put("success", Boolean.FALSE);
		}
		return jsonResult;
	}

	/**
	 * 服装广告新增与修改
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/clothingAdAdd.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> clothingAdAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		String adTitle = request.getParameter("adTitle");
		String adType = request.getParameter("adType");
		int adPage = Integer.parseInt(request.getParameter("adPage"));
		int adPosition = Integer.parseInt(request.getParameter("adPosition"));
		String imgUrl = request.getParameter("imgUrl");
		String adDetailDesc = request.getParameter("adDetailDesc"); // 广告描述
		String adImages = request.getParameter("adImages");
		int saveType = Integer.parseInt(request.getParameter("saveType"));
		String strDesc = request.getParameter("adDesc");
		if (saveType == 0) {
			String adId = GrnerateUUID.getUUID();
			TSysAdvertise sysAd = new TSysAdvertise();
			sysAd.setAdId(adId);
			sysAd.setAdTitle(adTitle);
			sysAd.setAdType(adType);
			sysAd.setAdUrl(imgUrl);
			sysAd.setImageUrl(adImages);
			byte[] adDesc = strDesc.getBytes();
			sysAd.setAdDesc(adDesc);
			sysAd.setAdDetailDesc(adDetailDesc);
			sysAd.setAdLocation(adPosition);
			sysAd.setAdPageLocation(adPage);
			sysAd.setCreateTime(new Date());
			sysAd.setRemark1("0"); // 是否已经上传

			ISysAdvertiseService.addAdvertise(sysAd);
			jsonResult.put("success", Boolean.TRUE);
			jsonResult.put("adId", adId);
		} else {
			String adId = request.getParameter("adId");
			if (adId != null && !"".equals(adId)) {
				TSysAdvertiseExample example = new TSysAdvertiseExample();
				TSysAdvertiseExample.Criteria criteria = example.createCriteria();
				criteria.andAdIdEqualTo(adId);
				List<TSysAdvertise> adList = ISysAdvertiseService.selectByExample(example);
				if (adList != null && adList.size() == 1) {
					TSysAdvertise sysAd = new TSysAdvertise();
					sysAd.setAdId(adId);
					sysAd.setAdDetailDesc(adDetailDesc);
					sysAd.setAdUrl(imgUrl);
					sysAd.setImageUrl(adImages);
					byte[] adDesc = strDesc.getBytes();
					sysAd.setAdDesc(adDesc);
					sysAd.setCreateTime(new Date());
					sysAd.setRemark1("0"); // 是否已经上传

					ISysAdvertiseService.updateAdInfo(sysAd);

					jsonResult.put("success", Boolean.TRUE);
					jsonResult.put("adId", adId);
				} else {
					jsonResult.put("success", Boolean.FALSE);
				}
			} else {
				jsonResult.put("success", Boolean.FALSE);
			}
		}
		return jsonResult;
	}

	/**
	 * 服装广告新增与修改
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/allAdChange.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> allAdChange(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		String adTitle = request.getParameter("adTitle");
		String adType = request.getParameter("adType");
		String images = request.getParameter("images");
		String adUrl = request.getParameter("adUrl");
		int adPage = Integer.parseInt(request.getParameter("adPage"));
		int adPosition = Integer.parseInt(request.getParameter("adPosition"));
		int saveType = Integer.parseInt(request.getParameter("saveType"));
		String strDesc = request.getParameter("adDesc");
		if (saveType == 0) {
			String adId = GrnerateUUID.getUUID();
			TSysAdvertise sysAd = new TSysAdvertise();
			sysAd.setAdId(adId);
			sysAd.setAdTitle(adTitle);
			sysAd.setAdType(adType);

			if (images != null && !"".equals(images)) {
				sysAd.setAdUrl(adUrl);
				sysAd.setImageUrl(images);
			} else {
				byte[] adDesc = strDesc.getBytes();
				sysAd.setAdDesc(adDesc);
				String adUrls = ImageUtil.getHrefs(strDesc);
				String adImgs = ImageUtil.getImgsToString(strDesc);
				sysAd.setAdDesc(adDesc);
				sysAd.setAdUrl(adUrls);
				sysAd.setImageUrl(adImgs);
			}
			sysAd.setAdLocation(adPosition);
			sysAd.setAdPageLocation(adPage);
			sysAd.setCreateTime(new Date());
			sysAd.setRemark1("0"); // 是否已经上传

			ISysAdvertiseService.addAdvertise(sysAd);
			jsonResult.put("success", Boolean.TRUE);
			jsonResult.put("adId", adId);
		} else {
			String adId = request.getParameter("adId");
			if (adId != null && !"".equals(adId)) {
				TSysAdvertiseExample example = new TSysAdvertiseExample();
				TSysAdvertiseExample.Criteria criteria = example.createCriteria();
				criteria.andAdIdEqualTo(adId);
				List<TSysAdvertise> adList = ISysAdvertiseService.selectByExample(example);
				if (adList != null && adList.size() == 1) {
					TSysAdvertise sysAd = new TSysAdvertise();
					sysAd.setAdId(adId);
					if (images != null && !"".equals(images)) {
						sysAd.setAdUrl(adUrl);
						sysAd.setImageUrl(images);
					} else {
						byte[] adDesc = strDesc.getBytes();
						String adUrls = ImageUtil.getHrefs(strDesc);
						String adImgs = ImageUtil.getImgsToString(strDesc);
						sysAd.setAdDesc(adDesc);
						sysAd.setAdUrl(adUrls);
						sysAd.setImageUrl(adImgs);
					}
					sysAd.setCreateTime(new Date());
					sysAd.setRemark1("0"); // 是否已经上传

					ISysAdvertiseService.updateAdInfo(sysAd);

					jsonResult.put("success", Boolean.TRUE);
					jsonResult.put("adId", adId);
				} else {
					jsonResult.put("success", Boolean.FALSE);
				}
			} else {
				jsonResult.put("success", Boolean.FALSE);
			}
		}
		return jsonResult;
	}

	/**
	 * 首页广告新增与修改
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveIndexAd.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> saveIndexAd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		int maxIndex = 1;
		String adTitle = request.getParameter("adTitle");
		String adType = request.getParameter("adType");
		String images = request.getParameter("adImages");
		String adUrl = request.getParameter("adUrl");
		String dlTitle = request.getParameter("dlTitle");
		// int adPage = Integer.parseInt(request.getParameter("adPage"));
		// int adPosition =
		// Integer.parseInt(request.getParameter("adPosition"));
		int saveType = Integer.parseInt(request.getParameter("saveType"));
		String strDesc = request.getParameter("adDesc");
		String adDetailDesc = request.getParameter("adDetailDesc");
		if (saveType == 0) {
			List<TSysAdvertise> list = this.getMaxIndex();
			if(list!=null && list.size()==1){
				maxIndex += list.get(0).getAdIndex()==null?0:list.get(0).getAdIndex();
			}
			String adId = GrnerateUUID.getUUID();
			TSysAdvertise sysAd = new TSysAdvertise();
			sysAd.setAdId(adId);
			sysAd.setAdTitle(adTitle);
			sysAd.setAdType(adType);
			sysAd.setAdUrl(adUrl);
			sysAd.setImageUrl(images);
			byte[] adDesc = strDesc.getBytes();
			sysAd.setAdDesc(adDesc);
			sysAd.setAdDetailDesc(adDetailDesc);
			sysAd.setCreateTime(new Date());
			sysAd.setRemark(dlTitle);
			sysAd.setAdIndex(maxIndex);
			sysAd.setRemark1("0"); // 是否已经上传

			ISysAdvertiseService.addAdvertise(sysAd);
			jsonResult.put("success", Boolean.TRUE);
			jsonResult.put("adId", adId);
		} else {
			String adId = request.getParameter("adId");
			if (adId != null && !"".equals(adId)) {
				TSysAdvertiseExample example = new TSysAdvertiseExample();
				TSysAdvertiseExample.Criteria criteria = example.createCriteria();
				criteria.andAdIdEqualTo(adId);
				List<TSysAdvertise> adList = ISysAdvertiseService.selectByExample(example);
				if (adList != null && adList.size() == 1) {
					TSysAdvertise sysAd = new TSysAdvertise();
					sysAd.setAdId(adId);
					sysAd.setAdUrl(adUrl);
					sysAd.setImageUrl(images);
					byte[] adDesc = strDesc.getBytes();
					sysAd.setAdDesc(adDesc);
					sysAd.setAdDetailDesc(adDetailDesc);
					sysAd.setCreateTime(new Date());
					sysAd.setRemark(dlTitle);
					sysAd.setRemark1("0"); // 是否已经上传

					ISysAdvertiseService.updateAdInfo(sysAd);

					jsonResult.put("success", Boolean.TRUE);
					jsonResult.put("adId", adId);
				} else {
					jsonResult.put("success", Boolean.FALSE);
				}
			} else {
				jsonResult.put("success", Boolean.FALSE);
			}
		}
		return jsonResult;
	}

	/**
	 * common 新增与 修改
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/commenAdChange.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> commenAdChange(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		String adTitle = request.getParameter("adTitle");
		String adType = request.getParameter("adType");
		String images = request.getParameter("images");
		String adUrl = request.getParameter("adUrl");
		int adPage = Integer.parseInt(request.getParameter("adPage"));
		int adPosition = Integer.parseInt(request.getParameter("adPosition"));
		int saveType = Integer.parseInt(request.getParameter("saveType"));
		String strDesc = request.getParameter("adDesc");
		if (saveType == 0) {
			String adId = GrnerateUUID.getUUID();
			TSysAdvertise sysAd = new TSysAdvertise();
			sysAd.setAdId(adId);
			sysAd.setAdTitle(adTitle);
			sysAd.setAdType(adType);
			sysAd.setAdUrl(adUrl);
			sysAd.setImageUrl(images);
			byte[] adDesc = strDesc.getBytes();
			sysAd.setAdDesc(adDesc);
			sysAd.setAdLocation(adPosition);
			sysAd.setAdPageLocation(adPage);
			sysAd.setCreateTime(new Date());
			sysAd.setRemark1("0"); // 是否已经上传

			ISysAdvertiseService.addAdvertise(sysAd);
			jsonResult.put("success", Boolean.TRUE);
			jsonResult.put("adId", adId);
		} else {
			String adId = request.getParameter("adId");
			if (adId != null && !"".equals(adId)) {
				TSysAdvertiseExample example = new TSysAdvertiseExample();
				TSysAdvertiseExample.Criteria criteria = example.createCriteria();
				criteria.andAdIdEqualTo(adId);
				List<TSysAdvertise> adList = ISysAdvertiseService.selectByExample(example);
				if (adList != null && adList.size() == 1) {
					TSysAdvertise sysAd = new TSysAdvertise();
					sysAd.setAdId(adId);
					sysAd.setAdUrl(adUrl);
					sysAd.setImageUrl(images);
					byte[] adDesc = strDesc.getBytes();
					sysAd.setAdDesc(adDesc);
					sysAd.setCreateTime(new Date());
					sysAd.setRemark1("0"); // 是否已经上传

					ISysAdvertiseService.updateAdInfo(sysAd);

					jsonResult.put("success", Boolean.TRUE);
					jsonResult.put("adId", adId);
				} else {
					jsonResult.put("success", Boolean.FALSE);
				}
			} else {
				jsonResult.put("success", Boolean.FALSE);
			}
		}
		return jsonResult;
	}

	/**
	 * 上传广告
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uploadAddvertise.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> uploadAddvertise(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("success", Boolean.FALSE);
		String adId = request.getParameter("adId");
		if (adId == null || "".equals(adId)) {
			return jsonResult;
		}

		TSysAdvertise adAllInfo = ISysAdvertiseService.selectByPrimaryKey(adId);

		if (adAllInfo != null) {
			SysAdvertiseAdmin adminInfo = sysAdvertiseAdminService.selectByPrimaryKey(adId);
			if (adminInfo == null) {
				SysAdvertiseAdmin saa = new SysAdvertiseAdmin();
				BeanUtils.copyProperties(adAllInfo, saa);
				saa.setRemark1("1"); // 已上传
				sysAdvertiseAdminService.insert(saa);
			} else {
				SysAdvertiseAdmin saa = new SysAdvertiseAdmin();
				BeanUtils.copyProperties(adAllInfo, saa);
				sysAdvertiseAdminService.updateByPrimaryKeyWithBLOBs(saa);

				adAllInfo.setRemark1("1");
				ISysAdvertiseService.updateAdInfo(adAllInfo);
			}
			jsonResult.put("success", Boolean.TRUE);
		} else {
			return jsonResult;
		}

		return jsonResult;
	}

	/**
	 * 删除广告
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getDeleteAdvertise.do", method = { RequestMethod.GET,RequestMethod.POST })
	public @ResponseBody Map<String,Object> getDeleteAdvertise(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		String adId = request.getParameter("adId");
		map.put("success", Boolean.FALSE);
		map.put("result_err", "后台数据删除失败");
		
		if (adId != null && !"".equals(adId)) {
			TSysAdvertise advertise = ISysAdvertiseService.selectByPrimaryKey(adId);
			if (advertise != null) {
				ISysAdvertiseService.deleteByPrimaryKey(adId);
				sysAdvertiseAdminService.deleteByPrimaryKey(adId);
				map.put("success", Boolean.TRUE);
				map.put("result_err", "删除成功");
			} 
		}
		return map;
	}
}