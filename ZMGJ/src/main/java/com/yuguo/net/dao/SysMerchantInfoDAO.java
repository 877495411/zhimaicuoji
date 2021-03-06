package com.yuguo.net.dao;

import java.util.List;

import com.yuguo.net.common.config.ibatis.GenericDAO;
import com.yuguo.net.model.SysMerchantInfo;
import com.yuguo.net.model.SysMerchantInfoExample;

public class SysMerchantInfoDAO extends GenericDAO<SysMerchantInfo,SysMerchantInfoExample> implements ISysMerchantInfoDAO {

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_merchant_info
     *
     * @ibatorgenerated Wed Aug 24 14:54:29 CST 2016
     */
    public SysMerchantInfoDAO() {
        super();
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_merchant_info
     *
     * @ibatorgenerated Wed Aug 24 14:54:29 CST 2016
     */
    public int countByExample(SysMerchantInfoExample example) {
        Integer count = (Integer)  getSqlMapClientTemplate().queryForObject("SysMerchantInfo.countByExample", example);
        return count;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_merchant_info
     *
     * @ibatorgenerated Wed Aug 24 14:54:29 CST 2016
     */
    public int deleteByExample(SysMerchantInfoExample example) {
        int rows = getSqlMapClientTemplate().delete("SysMerchantInfo.deleteByExample", example);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_merchant_info
     *
     * @ibatorgenerated Wed Aug 24 14:54:29 CST 2016
     */
    public int deleteByPrimaryKey(String merchantId) {
        SysMerchantInfo key = new SysMerchantInfo();
        key.setMerchantId(merchantId);
        int rows = getSqlMapClientTemplate().delete("SysMerchantInfo.deleteByPrimaryKey", key);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_merchant_info
     *
     * @ibatorgenerated Wed Aug 24 14:54:29 CST 2016
     */
    public void insert(SysMerchantInfo record) {
        getSqlMapClientTemplate().insert("SysMerchantInfo.insert", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_merchant_info
     *
     * @ibatorgenerated Wed Aug 24 14:54:29 CST 2016
     */
    public void insertSelective(SysMerchantInfo record) {
        getSqlMapClientTemplate().insert("SysMerchantInfo.insertSelective", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_merchant_info
     *
     * @ibatorgenerated Wed Aug 24 14:54:29 CST 2016
     */
    @SuppressWarnings("unchecked")
    public List<SysMerchantInfo> selectByExample(SysMerchantInfoExample example) {
        List<SysMerchantInfo> list = getSqlMapClientTemplate().queryForList("SysMerchantInfo.selectByExample", example);
        return list;
    }
    
	public List<SysMerchantInfo> selectTwoTableByExample(SysMerchantInfoExample example) {
        @SuppressWarnings("unchecked")
		List<SysMerchantInfo> list = getSqlMapClientTemplate().queryForList("SysMerchantInfo.selectTwoTableByExample", example);
        return list;
	}

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_merchant_info
     *
     * @ibatorgenerated Wed Aug 24 14:54:29 CST 2016
     */
    public SysMerchantInfo selectByPrimaryKey(String merchantId) {
        SysMerchantInfo key = new SysMerchantInfo();
        key.setMerchantId(merchantId);
        SysMerchantInfo record = (SysMerchantInfo) getSqlMapClientTemplate().queryForObject("SysMerchantInfo.selectByPrimaryKey", key);
        return record;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_merchant_info
     *
     * @ibatorgenerated Wed Aug 24 14:54:29 CST 2016
     */
    public int updateByExampleSelective(SysMerchantInfo record, SysMerchantInfoExample example) {
        UpdateByExampleParms parms = new UpdateByExampleParms(record, example);
        int rows = getSqlMapClientTemplate().update("SysMerchantInfo.updateByExampleSelective", parms);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_merchant_info
     *
     * @ibatorgenerated Wed Aug 24 14:54:29 CST 2016
     */
    public int updateByExample(SysMerchantInfo record, SysMerchantInfoExample example) {
        UpdateByExampleParms parms = new UpdateByExampleParms(record, example);
        int rows = getSqlMapClientTemplate().update("SysMerchantInfo.updateByExample", parms);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_merchant_info
     *
     * @ibatorgenerated Wed Aug 24 14:54:29 CST 2016
     */
    public int updateByPrimaryKeySelective(SysMerchantInfo record) {
        int rows = getSqlMapClientTemplate().update("SysMerchantInfo.updateByPrimaryKeySelective", record);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_merchant_info
     *
     * @ibatorgenerated Wed Aug 24 14:54:29 CST 2016
     */
    public int updateByPrimaryKey(SysMerchantInfo record) {
        int rows = getSqlMapClientTemplate().update("SysMerchantInfo.updateByPrimaryKey", record);
        return rows;
    }

    /**
    /**
     * <p>t_sys_merchant_info查询条件参数。</p>
     */
    private static class UpdateByExampleParms extends SysMerchantInfoExample {
        private SysMerchantInfo record;

        /**
         * <p>UpdateByExampleParms构造函数。</p>
         * @param record 实体
         * @param example 条件
         */
        public UpdateByExampleParms(SysMerchantInfo record, SysMerchantInfoExample example) {
            super(example);
            this.record = record;
        }

        /**
         * This method was generated by Apache iBATIS ibator.
         * This method corresponds to the database table t_sys_merchant_info
         *
         * @ibatorgenerated Wed Aug 24 14:54:29 CST 2016
         */
        @SuppressWarnings("unused")
        public SysMerchantInfo getRecord() {
            return record;
        }
    }
    
    @SuppressWarnings("unchecked")
	public SysMerchantInfo getMerchantInfoByNameOrPhone(String search) {
        List<SysMerchantInfo> records = getSqlMapClientTemplate().queryForList("SysMerchantInfo.selectByUserNameOrPhone", search);
        if(records != null && records.size() > 0) {
        	SysMerchantInfo record = records.get(0);
        	return record;
        }
        return null;
    }
}