package com.yuguo.net.dao;

import java.util.List;

import com.yuguo.net.common.config.ibatis.GenericDAO;
import com.yuguo.net.model.SysUserAuthority;
import com.yuguo.net.model.SysUserAuthorityExample;

public class SysUserAuthorityDAO extends GenericDAO<SysUserAuthority,SysUserAuthorityExample> implements ISysUserAuthorityDAO {

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public SysUserAuthorityDAO() {
        super();
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public int countByExample(SysUserAuthorityExample example) {
        Integer count = (Integer)  getSqlMapClientTemplate().queryForObject("SysUserAuthority.countByExample", example);
        return count;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public int deleteByExample(SysUserAuthorityExample example) {
        int rows = getSqlMapClientTemplate().delete("SysUserAuthority.deleteByExample", example);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public int deleteByPrimaryKey(String authId) {
        SysUserAuthority key = new SysUserAuthority();
        key.setAuthId(authId);
        int rows = getSqlMapClientTemplate().delete("SysUserAuthority.deleteByPrimaryKey", key);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public void insert(SysUserAuthority record) {
        getSqlMapClientTemplate().insert("SysUserAuthority.insert", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public void insertSelective(SysUserAuthority record) {
        getSqlMapClientTemplate().insert("SysUserAuthority.insertSelective", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    @SuppressWarnings("unchecked")
    public List<SysUserAuthority> selectByExample(SysUserAuthorityExample example) {
        List<SysUserAuthority> list = getSqlMapClientTemplate().queryForList("SysUserAuthority.selectByExample", example);
        return list;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public SysUserAuthority selectByPrimaryKey(String authId) {
        SysUserAuthority key = new SysUserAuthority();
        key.setAuthId(authId);
        SysUserAuthority record = (SysUserAuthority) getSqlMapClientTemplate().queryForObject("SysUserAuthority.selectByPrimaryKey", key);
        return record;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public int updateByExampleSelective(SysUserAuthority record, SysUserAuthorityExample example) {
        UpdateByExampleParms parms = new UpdateByExampleParms(record, example);
        int rows = getSqlMapClientTemplate().update("SysUserAuthority.updateByExampleSelective", parms);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public int updateByExample(SysUserAuthority record, SysUserAuthorityExample example) {
        UpdateByExampleParms parms = new UpdateByExampleParms(record, example);
        int rows = getSqlMapClientTemplate().update("SysUserAuthority.updateByExample", parms);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public int updateByPrimaryKeySelective(SysUserAuthority record) {
        int rows = getSqlMapClientTemplate().update("SysUserAuthority.updateByPrimaryKeySelective", record);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public int updateByPrimaryKey(SysUserAuthority record) {
        int rows = getSqlMapClientTemplate().update("SysUserAuthority.updateByPrimaryKey", record);
        return rows;
    }

    /**
    /**
     * <p>t_sys_user_authority查询条件参数。</p>
     */
    private static class UpdateByExampleParms extends SysUserAuthorityExample {
        private SysUserAuthority record;

        /**
         * <p>UpdateByExampleParms构造函数。</p>
         * @param record 实体
         * @param example 条件
         */
        public UpdateByExampleParms(SysUserAuthority record, SysUserAuthorityExample example) {
            super(example);
            this.record = record;
        }

        /**
         * This method was generated by Apache iBATIS ibator.
         * This method corresponds to the database table t_sys_user_authority
         *
         * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
         */
        @SuppressWarnings("unused")
        public SysUserAuthority getRecord() {
            return record;
        }
    }
}