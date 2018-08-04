package com.namucnd.manager.domain;

import java.io.Serializable;

import com.namucnd.common.domain.CommonEntity;

/**
 * <pre>
 * 메뉴 권한 Mapping
 * </pre>
 * 
 * @FileName MenuRole.java
 * @Package com.univeramall.menu.domain
 * @Organization
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
public class MenuRole extends CommonEntity implements Serializable {

	private static final long serialVersionUID = -6134050742865670521L;
	
	private Integer idx; // VARCHAR2(20 BYTE) No 권한아이디
	private String role_id; // VARCHAR2(20 BYTE) No 권한아이디
	private String menu_id; // VARCHAR2(20 BYTE) No 메뉴아이디
	private String site_id; // VARCHAR2(20 BYTE) No 사이트아이디
	
	
	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public String getSite_id() {
		return site_id;
	}

	public void setSite_id(String site_id) {
		this.site_id = site_id;
	}

	public Integer getIdx() {
		return idx;
	}

	public void setIdx(Integer idx) {
		this.idx = idx;
	}

}
