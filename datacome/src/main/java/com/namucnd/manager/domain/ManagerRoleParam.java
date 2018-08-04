package com.namucnd.manager.domain;

import java.io.Serializable;

import com.namucnd.common.domain.CommonParam;

/**
 * <pre>
 * 관리자권한 Parameter
 * </pre>
 * 
 * @FileName ManagerRoleParam.java
 * @Package com.univeramall.manager.domain
 * @Organization
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
public class ManagerRoleParam extends CommonParam implements Serializable {

	private static final long serialVersionUID = 615227779926262331L;
	
	private String roleId; // VARCHAR2(20 BYTE) No 권한아이디
	private String mngrId; // VARCHAR2(20 BYTE) No 사용자아이디
	// private String siteId; // VARCHAR2(20 BYTE) No 사이트아이디
	private String[] roleIds; // VARCHAR2(20 BYTE) No 권한아이디
	private String[] mngrIds; // VARCHAR2(20 BYTE) No 사용자아이디

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getMngrId() {
		return mngrId;
	}

	public void setMngrId(String mngrId) {
		this.mngrId = mngrId;
	}

	public String[] getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(String[] roleIds) {
		this.roleIds = roleIds;
	}

	public String[] getMngrIds() {
		return mngrIds;
	}

	public void setMngrIds(String[] mngrIds) {
		this.mngrIds = mngrIds;
	}

}
