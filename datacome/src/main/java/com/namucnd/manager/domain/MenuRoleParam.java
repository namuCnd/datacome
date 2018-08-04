package com.namucnd.manager.domain;

import java.io.Serializable;

import com.namucnd.common.domain.CommonParam;

/**
 * <pre>
 * MenuRole Parameter
 * </pre>
 * 
 * @FileName MenuRoleParam.java
 * @Package com.univeramall.menu.domain
 * @Organization
 * @author Sorcerer.Picoo
 * @since 2015. 9. 1.
 * 
 */
public class MenuRoleParam extends CommonParam implements Serializable {

	private static final long serialVersionUID = 5482105134146692171L;

	private String roleId; // VARCHAR2(20 BYTE) No 권한아이디
	private String menuId; // VARCHAR2(20 BYTE) No 메뉴아이디
	private String reqestUrl; // 접속한 페이지 url

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getReqestUrl() {
		return reqestUrl;
	}

	public void setReqestUrl(String reqestUrl) {
		this.reqestUrl = reqestUrl;
	}

}
