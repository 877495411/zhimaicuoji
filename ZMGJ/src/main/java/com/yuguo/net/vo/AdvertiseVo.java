package com.yuguo.net.vo;

/**
 * 广告
 * 
 * @author xinhui
 * 
 */
public class AdvertiseVo {
	private String adTitle;
	private String adType;
	private String imageUrl;
	private String adDetailDesc;
	private String adUrl;
	private String adStrDesc;
	private Integer adLocation;
	private Integer adPageLocation;

	@Override
	public String toString() {
		return "Advertise [adTitle=" + adTitle + ", adType=" + adType + ", imageUrl=" + imageUrl + ", adDetailDesc=" + adDetailDesc + ", adUrl=" + adUrl + ", adStrDesc=" + adStrDesc + ", adLocation=" + adLocation + ", adPageLocation=" + adPageLocation + "]";
	}

	public String getAdTitle() {
		return adTitle;
	}

	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
	}

	public String getAdType() {
		return adType;
	}

	public void setAdType(String adType) {
		this.adType = adType;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getAdDetailDesc() {
		return adDetailDesc;
	}

	public void setAdDetailDesc(String adDetailDesc) {
		this.adDetailDesc = adDetailDesc;
	}

	public String getAdUrl() {
		return adUrl;
	}

	public void setAdUrl(String adUrl) {
		this.adUrl = adUrl;
	}

	public String getAdStrDesc() {
		return adStrDesc;
	}

	public void setAdStrDesc(String adStrDesc) {
		this.adStrDesc = adStrDesc;
	}

	public Integer getAdLocation() {
		return adLocation;
	}

	public void setAdLocation(Integer adLocation) {
		this.adLocation = adLocation;
	}

	public Integer getAdPageLocation() {
		return adPageLocation;
	}

	public void setAdPageLocation(Integer adPageLocation) {
		this.adPageLocation = adPageLocation;
	}

}
