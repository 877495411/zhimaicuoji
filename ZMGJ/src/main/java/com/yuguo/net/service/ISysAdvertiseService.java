package com.yuguo.net.service;

import java.util.List;
import java.util.Map;

import com.yuguo.net.model.TSysAdvertise;
import com.yuguo.net.model.TSysAdvertiseExample;
import com.yuguo.net.vo.AdvertiseVo;

public interface ISysAdvertiseService {
	List<TSysAdvertise> selectByExample(TSysAdvertiseExample example) throws Exception;

	void addAdvertise(TSysAdvertise sysAdvertise);

	void updateAdInfo(TSysAdvertise record) throws Exception;

	int deleteByPrimaryKey(String adId);

	TSysAdvertise selectByPrimaryKey(String adId);

	/**
	 * 获取首页所有广告
	 * 
	 * @param jsonResult
	 * @return adAllInfo
	 */
	Map<String, Object> getIndexInfo(Map<String, Object> jsonResult) throws Exception;

	/**
	 * 楼层信息
	 * 
	 * @param jsonResult
	 * @return floorInfo
	 * @throws Exception
	 */
	Map<String, Object> getIndexFloorInfo(Map<String, Object> jsonResult) throws Exception;

	/**
	 * 获得广告信息
	 * 
	 * @param adType
	 *            广告类型 ：如首页，美妆
	 * @param adPage
	 *            页面位置
	 * @param adPosition
	 *            广告位置
	 * @return List<TSysAdvertise>
	 * @throws Exception
	 */
	List<TSysAdvertise> getAdvertiseInfo(String adType, int adPage, int adPosition) throws Exception;

	/**
	 * 根据楼层加载广告信息
	 * 
	 * @param adType
	 *            广告类型 ：如首页，美妆
	 * @param adPage
	 *            页面位置
	 * @param adPosition
	 *            广告位置
	 * @return List<TSysAdvertise>
	 * @throws Exception
	 */
	public Map<String, Object> getIndexInfoByFloor(Map<String, Object> jsonResult, List<Integer> floor) throws Exception;

	List<AdvertiseVo> getCommonAdvertiseInfo(String adType, int adPage, int adPosition) throws Exception;

	String getAppAdvertiseImgUrl(String adType, String adTitle) throws Exception;

	Map<String, Object> getMobileAdByTypeTitle(String type, String title, Map<String, Object> jsonResult);
}