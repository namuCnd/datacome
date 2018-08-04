package com.namucnd.manager.domain;

import java.io.Serializable;

import com.namucnd.common.domain.CommonParam;

/**
 * <pre>
 * 권한 parameter
 * </pre>
 * @FileName RoleParam.java
 * @Package com.univeramall.manager.domain
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
public class RoleParam extends CommonParam implements Serializable {

	private static final long serialVersionUID = -6093555041187351952L;
	private String roleId; // VARCHAR2(20 BYTE) No 권한아이디
	private String roleParentId; // VARCHAR2(20 BYTE) Yes 권한아이디
	// private String siteId; // VARCHAR2(20 BYTE) No 사이트아이디 -> 일단보류 parents 이용
	private String roleName; // VARCHAR2(60 BYTE) No 권한분류명
	private String roleDesc; // VARCHAR2(4000 BYTE) Yes 권한분류설명

	private String[] delId;
	
	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRoleParentId() {
		return roleParentId;
	}

	public void setRoleParentId(String roleParentId) {
		this.roleParentId = roleParentId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public String[] getDelId() {
		return delId;
	}

	public void setDelId(String[] delId) {
		this.delId = delId;
	}

}
