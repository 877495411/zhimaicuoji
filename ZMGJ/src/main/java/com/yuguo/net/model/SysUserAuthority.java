package com.yuguo.net.model;

import java.io.Serializable;

public class SysUserAuthority implements Serializable {
    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column t_sys_user_authority.AUTH_ID
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    private String authId;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column t_sys_user_authority.USER_ID
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    private String userId;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column t_sys_user_authority.ROLE_ID
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    private String roleId;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column t_sys_user_authority.AUTHORITY_LIST
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    private String authorityList;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column t_sys_user_authority.REMARK
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    private String remark;
    
    private String roleAuthorityList;	//角色权限列表
    
    private String roleName;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    private static final long serialVersionUID = 1L;

    /**
     * 构造函数
     */
    public SysUserAuthority() {
        //Auto-generated Constructor stub
    }

    /**
     * 构造函数
     * @param authId authId
     */
    public SysUserAuthority(String authId) {
        this.authId = authId;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column t_sys_user_authority.AUTH_ID
     *
     * @return the value of t_sys_user_authority.AUTH_ID
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public String getAuthId() {
        return authId;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column t_sys_user_authority.AUTH_ID
     *
     * @param authId the value for t_sys_user_authority.AUTH_ID
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public void setAuthId(String authId) {
        this.authId = authId;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column t_sys_user_authority.USER_ID
     *
     * @return the value of t_sys_user_authority.USER_ID
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public String getUserId() {
        return userId;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column t_sys_user_authority.USER_ID
     *
     * @param userId the value for t_sys_user_authority.USER_ID
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column t_sys_user_authority.ROLE_ID
     *
     * @return the value of t_sys_user_authority.ROLE_ID
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public String getRoleId() {
        return roleId;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column t_sys_user_authority.ROLE_ID
     *
     * @param roleId the value for t_sys_user_authority.ROLE_ID
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column t_sys_user_authority.AUTHORITY_LIST
     *
     * @return the value of t_sys_user_authority.AUTHORITY_LIST
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public String getAuthorityList() {
        return authorityList;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column t_sys_user_authority.AUTHORITY_LIST
     *
     * @param authorityList the value for t_sys_user_authority.AUTHORITY_LIST
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public void setAuthorityList(String authorityList) {
        this.authorityList = authorityList;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column t_sys_user_authority.REMARK
     *
     * @return the value of t_sys_user_authority.REMARK
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public String getRemark() {
        return remark;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column t_sys_user_authority.REMARK
     *
     * @param remark the value for t_sys_user_authority.REMARK
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRoleAuthorityList() {
		return roleAuthorityList;
	}

	public void setRoleAuthorityList(String roleAuthorityList) {
		this.roleAuthorityList = roleAuthorityList;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	/**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (!(that instanceof SysUserAuthority)) {
            return false;
        }
        SysUserAuthority other = (SysUserAuthority) that;
        return this.getAuthId() == null ? other == null : this.getAuthId().equals(other.getAuthId())
            && this.getUserId() == null ? other == null : this.getUserId().equals(other.getUserId())
            && this.getRoleId() == null ? other == null : this.getRoleId().equals(other.getRoleId())
            && this.getAuthorityList() == null ? other == null : this.getAuthorityList().equals(other.getAuthorityList())
            && this.getRemark() == null ? other == null : this.getRemark().equals(other.getRemark());
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table t_sys_user_authority
     *
     * @ibatorgenerated Fri Apr 15 15:38:44 CST 2016
     */
    @Override
    public int hashCode() {
        int hash = 23;
        if (getAuthId() != null) {
            hash *= getAuthId().hashCode();
        }
        if (getUserId() != null) {
            hash *= getUserId().hashCode();
        }
        if (getRoleId() != null) {
            hash *= getRoleId().hashCode();
        }
        if (getAuthorityList() != null) {
            hash *= getAuthorityList().hashCode();
        }
        if (getRemark() != null) {
            hash *= getRemark().hashCode();
        }
        return hash;
    }
}