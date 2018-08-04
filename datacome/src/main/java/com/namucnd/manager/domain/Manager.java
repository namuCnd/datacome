package com.namucnd.manager.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import com.namucnd.common.domain.CommonEntity;

/**
 * <pre>
 * 관리자 Domain
 * </pre>
 * @FileName Manager.java
 * @Package com.univeramall.manager.domain
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
public class Manager extends CommonEntity implements Serializable {

	private static final long serialVersionUID = -3484273191262679507L;

	@NotEmpty(message="관리자 아이디를 입력해 주세요.")
	private String mngr_id			; // VARCHAR2(20 BYTE)	No		사용자아이디
	@NotEmpty(message="관리자 아이디 중복확인을 해 주세요.")
	private String mngr_dup_id		; // 중복확인
	private String mngr_pw			; // VARCHAR2(255 BYTE)	No		비밀번호
	private String mngr_pw_confirm	; // VARCHAR2(255 BYTE)	No		비밀번호 확인
	@NotEmpty(message="관리자 이름을 입력해 주세요.")
	private String mngr_name		; // VARCHAR2(60 BYTE)	Yes		이름
	@NotEmpty(message="관리자 이메일을 입력해 주세요.")
	private String mngr_email		; // VARCHAR2(100 BYTE)	Yes		이메일
	private String mngr_phone		; // VARCHAR2(20 BYTE)	Yes		전화번호
	private String mngr_cellular	; // VARCHAR2(20 BYTE)	Yes		휴대폰번호
	private String mngr_desc		; // VARCHAR2(4000 BYTE)	Yes		기타사항
	private String mngr_ip			; // VARCHAR2(60 BYTE) 	Yes		최근접속IP
	private Date mngr_login_date	; // DATE				Yes 	최근접속시간
	private String mngr_menuName		; // 로그인(시스템) 접속기록  XXS_AD_LOGIN_HISTORY  사용
	
	private String up_idx; // 설계사 일련번호
	private String agent_code; // 거래처코드
	private String agent_name; // 거래처명
	private String agent_zipcd; // 거래처 우편번호
	private String agent_base_addr; // 거래처 기본주소
	private String agent_detail_addr; // 거래처 상세주소
	
	private String pwUpdateYn;	// 비밀번호 변경유무

	@NotEmpty(message="권한아이디를 선택해 주세요.")
	private List<ManagerRole> managerRoleList;

	public String getMngr_id() {
		return mngr_id;
	}

	public void setMngr_id(String mngr_id) {
		this.mngr_id = mngr_id;
	}

	public String getMngr_pw() {
		return mngr_pw;
	}

	public void setMngr_pw(String mngr_pw) {
		this.mngr_pw = mngr_pw;
	}

	public String getMngr_name() {
		return mngr_name;
	}

	public void setMngr_name(String mngr_name) {
		this.mngr_name = mngr_name;
	}

	public String getMngr_email() {
		return mngr_email;
	}

	public void setMngr_email(String mngr_email) {
		this.mngr_email = mngr_email;
	}

	public String getMngr_phone() {
		return mngr_phone;
	}

	public void setMngr_phone(String mngr_phone) {
		this.mngr_phone = mngr_phone;
	}

	public String getMngr_cellular() {
		return mngr_cellular;
	}

	public void setMngr_cellular(String mngr_cellular) {
		this.mngr_cellular = mngr_cellular;
	}

	public String getMngr_desc() {
		return mngr_desc;
	}

	public void setMngr_desc(String mngr_desc) {
		this.mngr_desc = mngr_desc;
	}

	public String getMngr_ip() {
		return mngr_ip;
	}

	public void setMngr_ip(String mngr_ip) {
		this.mngr_ip = mngr_ip;
	}

	public Date getMngr_login_date() {
		return mngr_login_date;
	}

	public void setMngr_login_date(Date mngr_login_date) {
		this.mngr_login_date = mngr_login_date;
	}

	public String getMngr_menuName() {
		return mngr_menuName;
	}

	public void setMngr_menuName(String mngr_menuName) {
		this.mngr_menuName = mngr_menuName;
	}

	public List<ManagerRole> getManagerRoleList() {
		return managerRoleList;
	}

	public void setManagerRoleList(List<ManagerRole> managerRoleList) {
		this.managerRoleList = managerRoleList;
	}

	public String getMngr_dup_id() {
		return mngr_dup_id;
	}

	public void setMngr_dup_id(String mngr_dup_id) {
		this.mngr_dup_id = mngr_dup_id;
	}

	public String getMngr_pw_confirm() {
		return mngr_pw_confirm;
	}

	public void setMngr_pw_confirm(String mngr_pw_confirm) {
		this.mngr_pw_confirm = mngr_pw_confirm;
	}

	public String getPwUpdateYn() {
		return pwUpdateYn;
	}

	public void setPwUpdateYn(String pwUpdateYn) {
		this.pwUpdateYn = pwUpdateYn;
	}

	public String getAgent_code() {
		return agent_code;
	}

	public void setAgent_code(String agent_code) {
		this.agent_code = agent_code;
	}

	public String getAgent_name() {
		return agent_name;
	}

	public void setAgent_name(String agent_name) {
		this.agent_name = agent_name;
	}

	public String getAgent_zipcd() {
		return agent_zipcd;
	}

	public void setAgent_zipcd(String agent_zipcd) {
		this.agent_zipcd = agent_zipcd;
	}

	public String getAgent_base_addr() {
		return agent_base_addr;
	}

	public void setAgent_base_addr(String agent_base_addr) {
		this.agent_base_addr = agent_base_addr;
	}

	public String getAgent_detail_addr() {
		return agent_detail_addr;
	}

	public void setAgent_detail_addr(String agent_detail_addr) {
		this.agent_detail_addr = agent_detail_addr;
	}

	public String getUp_idx() {
		return up_idx;
	}

	public void setUp_idx(String up_idx) {
		this.up_idx = up_idx;
	}

}
