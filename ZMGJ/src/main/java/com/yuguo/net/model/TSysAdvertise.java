package com.yuguo.net.model;

import java.io.Serializable;
import java.util.Date;

public class TSysAdvertise implements Serializable {
	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.AD_ID
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private String adId;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.AD_TITLE
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private String adTitle;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.AD_TYPE
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private String adType;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.IMAGE_URL
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private String imageUrl;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.AD_DETAIL_DESC
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private String adDetailDesc;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.AD_URL
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private String adUrl;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.AD_BEGINTIME
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private Date adBegintime;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.AD_ENDTIME
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private Date adEndtime;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.AD_CUSTOMER_ID
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private String adCustomerId;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.CREATE_TIME
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private Date createTime;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.AD_LOCATION
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private Integer adLocation;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.AD_PAGE_LOCATION
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private Integer adPageLocation;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.AD_HEIGHT
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private Integer adHeight;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.AD_INDEX
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private Integer adIndex;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.REMARK
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private String remark;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.REMARK1
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private String remark1;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.REMARK2
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private String remark2;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database column t_sys_advertise.AD_DESC
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private byte[] adDesc;

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds
	 * to the database table t_sys_advertise
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 构造函数
	 */
	public TSysAdvertise() {
		// Auto-generated Constructor stub
	}

	/**
	 * 构造函数
	 * 
	 * @param adId
	 *            adId
	 */
	public TSysAdvertise(String adId) {
		this.adId = adId;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.AD_ID
	 * 
	 * @return the value of t_sys_advertise.AD_ID
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public String getAdId() {
		return adId;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.AD_ID
	 * 
	 * @param adId
	 *            the value for t_sys_advertise.AD_ID
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setAdId(String adId) {
		this.adId = adId;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.AD_TITLE
	 * 
	 * @return the value of t_sys_advertise.AD_TITLE
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public String getAdTitle() {
		return adTitle;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.AD_TITLE
	 * 
	 * @param adTitle
	 *            the value for t_sys_advertise.AD_TITLE
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.AD_TYPE
	 * 
	 * @return the value of t_sys_advertise.AD_TYPE
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public String getAdType() {
		return adType;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.AD_TYPE
	 * 
	 * @param adType
	 *            the value for t_sys_advertise.AD_TYPE
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setAdType(String adType) {
		this.adType = adType;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.IMAGE_URL
	 * 
	 * @return the value of t_sys_advertise.IMAGE_URL
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public String getImageUrl() {
		return imageUrl;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.IMAGE_URL
	 * 
	 * @param imageUrl
	 *            the value for t_sys_advertise.IMAGE_URL
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.AD_DETAIL_DESC
	 * 
	 * @return the value of t_sys_advertise.AD_DETAIL_DESC
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public String getAdDetailDesc() {
		return adDetailDesc;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.AD_DETAIL_DESC
	 * 
	 * @param adDetailDesc
	 *            the value for t_sys_advertise.AD_DETAIL_DESC
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setAdDetailDesc(String adDetailDesc) {
		this.adDetailDesc = adDetailDesc;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.AD_URL
	 * 
	 * @return the value of t_sys_advertise.AD_URL
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public String getAdUrl() {
		return adUrl;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.AD_URL
	 * 
	 * @param adUrl
	 *            the value for t_sys_advertise.AD_URL
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setAdUrl(String adUrl) {
		this.adUrl = adUrl;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.AD_BEGINTIME
	 * 
	 * @return the value of t_sys_advertise.AD_BEGINTIME
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public Date getAdBegintime() {
		return adBegintime;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.AD_BEGINTIME
	 * 
	 * @param adBegintime
	 *            the value for t_sys_advertise.AD_BEGINTIME
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setAdBegintime(Date adBegintime) {
		this.adBegintime = adBegintime;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.AD_ENDTIME
	 * 
	 * @return the value of t_sys_advertise.AD_ENDTIME
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public Date getAdEndtime() {
		return adEndtime;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.AD_ENDTIME
	 * 
	 * @param adEndtime
	 *            the value for t_sys_advertise.AD_ENDTIME
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setAdEndtime(Date adEndtime) {
		this.adEndtime = adEndtime;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.AD_CUSTOMER_ID
	 * 
	 * @return the value of t_sys_advertise.AD_CUSTOMER_ID
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public String getAdCustomerId() {
		return adCustomerId;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.AD_CUSTOMER_ID
	 * 
	 * @param adCustomerId
	 *            the value for t_sys_advertise.AD_CUSTOMER_ID
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setAdCustomerId(String adCustomerId) {
		this.adCustomerId = adCustomerId;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.CREATE_TIME
	 * 
	 * @return the value of t_sys_advertise.CREATE_TIME
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.CREATE_TIME
	 * 
	 * @param createTime
	 *            the value for t_sys_advertise.CREATE_TIME
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.AD_LOCATION
	 * 
	 * @return the value of t_sys_advertise.AD_LOCATION
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public Integer getAdLocation() {
		return adLocation;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.AD_LOCATION
	 * 
	 * @param adLocation
	 *            the value for t_sys_advertise.AD_LOCATION
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setAdLocation(Integer adLocation) {
		this.adLocation = adLocation;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.AD_PAGE_LOCATION
	 * 
	 * @return the value of t_sys_advertise.AD_PAGE_LOCATION
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public Integer getAdPageLocation() {
		return adPageLocation;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.AD_PAGE_LOCATION
	 * 
	 * @param adPageLocation
	 *            the value for t_sys_advertise.AD_PAGE_LOCATION
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setAdPageLocation(Integer adPageLocation) {
		this.adPageLocation = adPageLocation;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.AD_HEIGHT
	 * 
	 * @return the value of t_sys_advertise.AD_HEIGHT
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public Integer getAdHeight() {
		return adHeight;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.AD_HEIGHT
	 * 
	 * @param adHeight
	 *            the value for t_sys_advertise.AD_HEIGHT
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setAdHeight(Integer adHeight) {
		this.adHeight = adHeight;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.AD_INDEX
	 * 
	 * @return the value of t_sys_advertise.AD_INDEX
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public Integer getAdIndex() {
		return adIndex;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.AD_INDEX
	 * 
	 * @param adIndex
	 *            the value for t_sys_advertise.AD_INDEX
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setAdIndex(Integer adIndex) {
		this.adIndex = adIndex;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.REMARK
	 * 
	 * @return the value of t_sys_advertise.REMARK
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.REMARK
	 * 
	 * @param remark
	 *            the value for t_sys_advertise.REMARK
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.REMARK1
	 * 
	 * @return the value of t_sys_advertise.REMARK1
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public String getRemark1() {
		return remark1;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.REMARK1
	 * 
	 * @param remark1
	 *            the value for t_sys_advertise.REMARK1
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setRemark1(String remark1) {
		this.remark1 = remark1;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.REMARK2
	 * 
	 * @return the value of t_sys_advertise.REMARK2
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public String getRemark2() {
		return remark2;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.REMARK2
	 * 
	 * @param remark2
	 *            the value for t_sys_advertise.REMARK2
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method returns
	 * the value of the database column t_sys_advertise.AD_DESC
	 * 
	 * @return the value of t_sys_advertise.AD_DESC
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public byte[] getAdDesc() {
		return adDesc;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method sets the
	 * value of the database column t_sys_advertise.AD_DESC
	 * 
	 * @param adDesc
	 *            the value for t_sys_advertise.AD_DESC
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	public void setAdDesc(byte[] adDesc) {
		this.adDesc = adDesc;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method
	 * corresponds to the database table t_sys_advertise
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	@Override
	public boolean equals(Object that) {
		if (this == that) {
			return true;
		}
		if (!(that instanceof TSysAdvertise)) {
			return false;
		}
		TSysAdvertise other = (TSysAdvertise) that;
		return this.getAdId() == null ? other == null : this.getAdId().equals(other.getAdId()) && this.getAdTitle() == null ? other == null : this.getAdTitle().equals(other.getAdTitle()) && this.getAdType() == null ? other == null : this.getAdType().equals(other.getAdType()) && this.getImageUrl() == null ? other == null : this.getImageUrl().equals(other.getImageUrl()) && this.getAdDetailDesc() == null ? other == null : this.getAdDetailDesc().equals(other.getAdDetailDesc()) && this.getAdUrl() == null ? other == null : this.getAdUrl().equals(other.getAdUrl()) && this.getAdBegintime() == null ? other == null : this.getAdBegintime().equals(other.getAdBegintime()) && this.getAdEndtime() == null ? other == null
				: this.getAdEndtime().equals(other.getAdEndtime()) && this.getAdCustomerId() == null ? other == null : this.getAdCustomerId().equals(other.getAdCustomerId()) && this.getCreateTime() == null ? other == null : this.getCreateTime().equals(other.getCreateTime()) && this.getAdLocation() == null ? other == null : this.getAdLocation().equals(other.getAdLocation()) && this.getAdPageLocation() == null ? other == null : this.getAdPageLocation().equals(other.getAdPageLocation()) && this.getAdHeight() == null ? other == null : this.getAdHeight().equals(other.getAdHeight()) && this.getAdIndex() == null ? other == null : this.getAdIndex().equals(other.getAdIndex()) && this.getRemark() == null ? other == null
						: this.getRemark().equals(other.getRemark()) && this.getRemark1() == null ? other == null : this.getRemark1().equals(other.getRemark1()) && this.getRemark2() == null ? other == null : this.getRemark2().equals(other.getRemark2()) && this.getAdDesc() == null ? other == null : this.getAdDesc().equals(other.getAdDesc());
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method
	 * corresponds to the database table t_sys_advertise
	 * 
	 * @ibatorgenerated Tue Dec 06 10:46:51 CST 2016
	 */
	@Override
	public int hashCode() {
		int hash = 23;
		if (getAdId() != null) {
			hash *= getAdId().hashCode();
		}
		if (getAdTitle() != null) {
			hash *= getAdTitle().hashCode();
		}
		if (getAdType() != null) {
			hash *= getAdType().hashCode();
		}
		if (getImageUrl() != null) {
			hash *= getImageUrl().hashCode();
		}
		if (getAdDetailDesc() != null) {
			hash *= getAdDetailDesc().hashCode();
		}
		if (getAdUrl() != null) {
			hash *= getAdUrl().hashCode();
		}
		if (getAdBegintime() != null) {
			hash *= getAdBegintime().hashCode();
		}
		if (getAdEndtime() != null) {
			hash *= getAdEndtime().hashCode();
		}
		if (getAdCustomerId() != null) {
			hash *= getAdCustomerId().hashCode();
		}
		if (getCreateTime() != null) {
			hash *= getCreateTime().hashCode();
		}
		if (getAdLocation() != null) {
			hash *= getAdLocation().hashCode();
		}
		if (getAdPageLocation() != null) {
			hash *= getAdPageLocation().hashCode();
		}
		if (getAdHeight() != null) {
			hash *= getAdHeight().hashCode();
		}
		if (getAdIndex() != null) {
			hash *= getAdIndex().hashCode();
		}
		if (getRemark() != null) {
			hash *= getRemark().hashCode();
		}
		if (getRemark1() != null) {
			hash *= getRemark1().hashCode();
		}
		if (getRemark2() != null) {
			hash *= getRemark2().hashCode();
		}
		if (getAdDesc() != null) {
			hash *= getAdDesc().hashCode();
		}
		return hash;
	}
}