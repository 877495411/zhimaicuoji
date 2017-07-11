package com.yuguo.net.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yuguo.net.dao.ITSysAdvertiseDAO;
import com.yuguo.net.model.TSysAdvertise;
import com.yuguo.net.model.TSysAdvertiseExample;
import com.yuguo.net.service.ISysAdvertiseService;
import com.yuguo.net.utils.BeanUtils;
import com.yuguo.net.vo.AdVo;
import com.yuguo.net.vo.AdvertiseVo;

@Service
@Transactional
public class SysAdvertiseServiceImpl implements ISysAdvertiseService {
	@Resource
	private ITSysAdvertiseDAO tSysAdvertiseDAO;

	public List<TSysAdvertise> selectByExample(TSysAdvertiseExample example) throws Exception {
		return tSysAdvertiseDAO.selectByExampleWithBLOBs(example);
	}

	public void addAdvertise(TSysAdvertise sysAdvertise) {
		tSysAdvertiseDAO.insert(sysAdvertise);
	}

	public void updateAdInfo(TSysAdvertise record) {
		tSysAdvertiseDAO.updateByPrimaryKeySelective(record);
	}

	public int deleteByPrimaryKey(String adId) {
		return tSysAdvertiseDAO.deleteByPrimaryKey(adId);
	}

	public Map<String, Object> getIndexInfo(Map<String, Object> jsonResult) throws Exception {
		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdTypeEqualTo("1");
		criteria.andAdPageLocationEqualTo(1);
		example.setFromNumber(0);
		example.setToNumber(3);
		example.setOrderByClause(" tSysAdvertise_AD_LOCATION ASC");
		List<TSysAdvertise> adAllInfo = tSysAdvertiseDAO.selectByExampleWithBLOBs(example);
		List<AdvertiseVo> adIndexList = null;
		if (adAllInfo != null && adAllInfo.size() > 0) {
			adIndexList = new ArrayList<AdvertiseVo>();
			for (TSysAdvertise adIndex : adAllInfo) {
				AdvertiseVo advertiseVo = new AdvertiseVo();
				BeanUtils.copyProperties(adIndex, advertiseVo);
				advertiseVo.setAdStrDesc(new String(adIndex.getAdDesc()));
				adIndexList.add(advertiseVo);
			}
		}
		jsonResult.put("adAllInfo", adIndexList);
		return jsonResult;
	}

	public Map<String, Object> getIndexInfoByFloor(Map<String, Object> jsonResult, List<Integer> floor) throws Exception {
		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdTypeEqualTo("1");
		criteria.andAdLocationIn(floor);
		criteria.andAdPageLocationEqualTo(1);
		example.setOrderByClause(" tSysAdvertise_AD_LOCATION ASC");
		List<TSysAdvertise> adAllInfo = tSysAdvertiseDAO.selectByExampleWithBLOBs(example);
		List<AdvertiseVo> adIndexList = null;
		if (adAllInfo != null && adAllInfo.size() > 0) {
			adIndexList = new ArrayList<AdvertiseVo>();
			for (TSysAdvertise adIndex : adAllInfo) {
				AdvertiseVo advertiseVo = new AdvertiseVo();
				BeanUtils.copyProperties(adIndex, advertiseVo);
				advertiseVo.setAdStrDesc(new String(adIndex.getAdDesc()));
				adIndexList.add(advertiseVo);
			}
		}
		jsonResult.put("success", Boolean.TRUE);
		jsonResult.put("adAllInfo", adIndexList);
		jsonResult = getIndexFloorInfo(jsonResult);
		return jsonResult;
	}

	public Map<String, Object> getIndexFloorInfo(Map<String, Object> jsonResult) throws Exception {
		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdTypeEqualTo("F");
		example.setOrderByClause(" tSysAdvertise_AD_LOCATION ASC");
		List<TSysAdvertise> adAllInfo = tSysAdvertiseDAO.selectByExampleWithBLOBs(example);
		if (adAllInfo != null && adAllInfo.size() > 0) {
			jsonResult.put("floorInfo", adAllInfo);
		} else {
			jsonResult.put("floorInfo", null);
		}
		return jsonResult;
	}

	public List<TSysAdvertise> getAdvertiseInfo(String adType, int adPage, int adPosition) throws Exception {
		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdTypeEqualTo(adType);
		criteria.andAdPageLocationEqualTo(adPage);
		if (adPosition != 0) { // 0 如查看首页广告
			criteria.andAdLocationEqualTo(adPosition);
		}
		example.setOrderByClause(" tSysAdvertise_AD_LOCATION ASC");
		List<TSysAdvertise> adAllInfo = tSysAdvertiseDAO.selectByExampleWithBLOBs(example);
		if (adAllInfo != null && adAllInfo.size() > 0) {
			return adAllInfo;
		} else {
			return null;
		}
	}

	/**
	 * 没有模板的广告查询
	 * 
	 * @param adType
	 * @param adPage
	 * @param adPosition
	 * @return
	 * @throws Exception
	 */
	public List<AdvertiseVo> getCommonAdvertiseInfo(String adType, int adPage, int adPosition) throws Exception {
		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdTypeEqualTo(adType);
		criteria.andAdPageLocationEqualTo(adPage);
		if (adPosition != 0) { // 0 如查看首页广告
			criteria.andAdLocationEqualTo(adPosition);
		}
		example.setOrderByClause(" tSysAdvertise_AD_LOCATION ASC");
		List<TSysAdvertise> adAllInfo = tSysAdvertiseDAO.selectByExampleWithBLOBs(example);
		List<AdvertiseVo> adAllResult = new ArrayList<AdvertiseVo>();
		if (adAllInfo != null && adAllInfo.size() > 0) {
			for (TSysAdvertise adt : adAllInfo) {
				AdvertiseVo adVo = new AdvertiseVo();
				adVo.setAdLocation(adt.getAdLocation());
				adVo.setAdPageLocation(adt.getAdPageLocation());
				if (adt.getAdDesc() != null && !"".equals(adt.getAdDesc())) {
					adVo.setAdStrDesc(new String(adt.getAdDesc()));
				}
				adVo.setAdUrl(adt.getAdUrl());
				adVo.setImageUrl(adt.getImageUrl());
				adAllResult.add(adVo);
			}
			return adAllResult;
		} else {
			return null;
		}
	}

	public TSysAdvertise selectByPrimaryKey(String adId) {
		return tSysAdvertiseDAO.selectByPrimaryKey(adId);
	}

	public String getAppAdvertiseImgUrl(String adType, String adTitle) throws Exception {
		String result = null;
		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdTypeEqualTo(adType);
		criteria.andAdTitleEqualTo(adTitle);
		List<TSysAdvertise> adAllInfo = tSysAdvertiseDAO.selectByExampleWithBLOBs(example);
		if (adAllInfo != null && adAllInfo.size() > 0) {
			result = new String(adAllInfo.get(0).getAdDesc());
		}
		return result;
	}

	/**
	 * 根据广告的ad_type 和广告的ad_title 查询广告
	 */
	public Map<String, Object> getMobileAdByTypeTitle(String type, String title, Map<String, Object> jsonResult) {
		TSysAdvertiseExample example = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example.createCriteria();
		criteria.andAdTypeEqualTo(type);
		criteria.andAdTitleLike("%" + title + "%");
		example.setOrderByClause(" tSysAdvertise.CREATE_TIME ASC");
		List<TSysAdvertise> adAllInfo = tSysAdvertiseDAO.selectByExampleWithBLOBs(example);
		if (adAllInfo != null && adAllInfo.size() > 0) {
			List<AdVo> listAdVo = new ArrayList<AdVo>();
			AdVo adVo = null;
			for (TSysAdvertise tad : adAllInfo) {
				adVo = new AdVo();
				if (tad.getAdDesc() != null && !"".equals(tad.getAdDesc())) {
					byte[] adDesc = tad.getAdDesc();
					adVo.setAdDesc(new String(adDesc));
				}
				adVo.setAdDetailDesc(tad.getAdDetailDesc());
				adVo.setAdTitle(tad.getAdTitle());
				adVo.setAdType(tad.getAdType());
				adVo.setGoType(tad.getRemark());
				adVo.setAdUrl(tad.getAdUrl());
				adVo.setImageUrl(tad.getImageUrl());
				adVo.setCreateTime(tad.getCreateTime());

				listAdVo.add(adVo);
			}
			jsonResult.put("mobileAd", listAdVo);
			jsonResult.put("success", Boolean.TRUE);
		} else {
			jsonResult.put("success", Boolean.FALSE);
		}
		return jsonResult;
	}
}