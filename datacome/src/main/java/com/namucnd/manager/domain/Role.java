package com.namucnd.manager.domain;

import java.io.Serializable;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import com.namucnd.common.domain.CommonEntity;

/**
 * <pre>
 * 권한 domain
 * </pre>
 * 
 * @FileName Role.java
 * @Package com.univeramall.manager.domain
 * @Organization
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
public class Role extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 4019049168373604207L;

	@NotEmpty(message="권한 아이디를 입력하셔야 합니다.")
	private String role_id; // VARCHAR2(20 BYTE) No 권한아이디
	private String role_dup_id;
	private String role_parent_id; // VARCHAR2(20 BYTE) Yes 권한아이디
	private String represent_id; // 
	private String site_id; // VARCHAR2(20 BYTE) No 사이트아이디
	private String role_name; // VARCHAR2(60 BYTE) No 권한분류명
	private String role_desc; // VARCHAR2(4000 BYTE) Yes 권한분류설명

	private List<MenuRole> menuRoleList;
	 
	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public String getRole_dup_id() {
		return role_dup_id;
	}

	public void setRole_dup_id(String role_dup_id) {
		this.role_dup_id = role_dup_id;
	}

	public String getRole_parent_id() {
		return role_parent_id;
	}

	public void setRole_parent_id(String role_parent_id) {
		this.role_parent_id = role_parent_id;
	}

	public String getSite_id() {
		return site_id;
	}

	public void setSite_id(String site_id) {
		this.site_id = site_id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getRole_desc() {
		return role_desc;
	}

	public void setRole_desc(String role_desc) {
		this.role_desc = role_desc;
	}

	public String getRepresent_id() {
		return represent_id;
	}

	public void setRepresent_id(String represent_id) {
		this.represent_id = represent_id;
	}

	public List<MenuRole> getMenuRoleList() {
		return menuRoleList;
	}

	public void setMenuRoleList(List<MenuRole> menuRoleList) {
		this.menuRoleList = menuRoleList;
	}

}
