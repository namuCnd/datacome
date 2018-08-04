package com.namucnd.common.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.security.core.context.SecurityContextHolder;

import com.namucnd.utils.PagerUtils;

/**
 * <pre>
 * Table 공통 Column
 * </pre>
 * 
 * @FileName CommonEntity.java
 * @Package com.univeramall.common.domain
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2013. 12. 25.
 */
public class CommonEntity {

	@DateTimeFormat(iso=ISO.DATE)
	private Date create_date; // DATE No SYSDATE 등록일자
	private String create_user; // VARCHAR2(20 BYTE) Yes 등록자
	private String create_user_name; // VARCHAR2(20 BYTE) Yes 등록자
	@DateTimeFormat(iso=ISO.DATE)
	private Date update_date; // DATE No SYSDATE 등록일자
	private String update_user; // VARCHAR2(20 BYTE) Yes 등록자
	private String update_user_name; // VARCHAR2(20 BYTE) Yes 등록자
	private String use_yn; // NUMBER(38,0) No 1 사용유무

	private String definitionName; // 템플릿 명 (tiles template)
	private String siteId; // 사이트 아이디 (web/mobile)
	private String siteType; // 사이트 타입 (user/admin)

	private String loginId; // 로긴아이디
	
	private String errorMsg;
	
	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getCreate_user_name() {
		return create_user_name;
	}

	public void setCreate_user_name(String create_user_name) {
		this.create_user_name = create_user_name;
	}

	public String getUpdate_user_name() {
		return update_user_name;
	}

	public void setUpdate_user_name(String update_user_name) {
		this.update_user_name = update_user_name;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public String getCreate_user() {
		return create_user;
	}

	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public String getUpdate_user() {
		return update_user;
	}

	public void setUpdate_user(String update_user) {
		this.update_user = update_user;
	}

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public String getDefinitionName() {
		return definitionName;
	}

	public void setDefinitionName(String definitionName) {
		this.definitionName = definitionName;
	}

	public String getSiteId() {
		if (this.siteId == null) {
			this.siteId = PagerUtils.getSiteId();
		}
		return siteId;
	}

	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	
	public String getSiteType() {
		if (this.siteType == null) {
			this.siteType = PagerUtils.getSiteType();
		}
		return siteType;
	}

	public void setSiteType(String siteType) {
		this.siteType = siteType;
	}

	public String getLoginId() {
		try {
			loginId = SecurityContextHolder.getContext().getAuthentication().getName();
		} catch (Exception e) {
			loginId = null;
		}
		
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	
	
}
