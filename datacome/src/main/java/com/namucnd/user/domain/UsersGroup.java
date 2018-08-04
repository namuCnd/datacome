package com.namucnd.user.domain;

import java.io.Serializable;

import com.namucnd.common.domain.CommonEntity;

/**
 * <pre>
 * 사용자 그룹
 * </pre>
 * @FileName UsersGroup.java
 * @Package com.univeramall.user.domain
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2018. 3. 2.
 * 
 */
public class UsersGroup extends CommonEntity implements Serializable {

	private static final long serialVersionUID = -3840161319556666909L;

	private String group_id		; // VARCHAR2(20 BYTE)	No		등급아이디
	private String group_name		; // VARCHAR2(60 BYTE)	Yes		등급명
	private String group_desc		; // VARCHAR2(4000 BYTE)	Yes		등급설명
	private String group_fileid	; // VARCHAR2(20 BYTE)	Yes		등급아이콘파일
	private String group_condition	; // VARCHAR2(4000 BYTE)	Yes		등급조건
	private String group_mileage	; // VARCHAR2(4000 BYTE)	Yes		마일리지
	private String group_benefit	; // VARCHAR2(4000 BYTE)	Yes		등급혜택
	private String group_order		; // NUMBER	Yes	1

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getGroup_desc() {
		return group_desc;
	}

	public void setGroup_desc(String group_desc) {
		this.group_desc = group_desc;
	}

	public String getGroup_fileid() {
		return group_fileid;
	}

	public void setGroup_fileid(String group_fileid) {
		this.group_fileid = group_fileid;
	}

	public String getGroup_condition() {
		return group_condition;
	}

	public void setGroup_condition(String group_condition) {
		this.group_condition = group_condition;
	}

	public String getGroup_mileage() {
		return group_mileage;
	}

	public void setGroup_mileage(String group_mileage) {
		this.group_mileage = group_mileage;
	}

	public String getGroup_benefit() {
		return group_benefit;
	}

	public void setGroup_benefit(String group_benefit) {
		this.group_benefit = group_benefit;
	}

	public String getGroup_order() {
		return group_order;
	}

	public void setGroup_order(String group_order) {
		this.group_order = group_order;
	}

}