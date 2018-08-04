package com.namucnd.user.domain;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * <pre>
 * 비밀번호 재확인
 * </pre>
 * @FileName MypageSignin.java
 * @Package com.univeramall.user.domain
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2018. 3. 26.
 * 
 */
public class MypageSignin implements Serializable {

	private static final long serialVersionUID = -3196906390376356645L;

	@NotEmpty(message="사용자 아이디를 입력해 주세요.")
	private String user_id				; // VARCHAR2(20 BYTE)	No		사용자아이디
	@NotEmpty(message="사용자 비밀번호를 입력해 주세요.")
	private String user_pw				; // VARCHAR2(255 BYTE)	Yes		사용자비밀번호

	private String redirectUrl; // 로그인 후 이동할 페이지
	private String location;	// (EDITUSER: 회원정보수정, EDITPW: 비밀번호 변경, WITHDRAW: 회원탈퇴)

	private String step; // step: editUserForm.do에서 어떤기능을 수행시킬 것인지.
	
	private Boolean secured = false;

	public Boolean getSecured() {
		return secured;
	}

	public void setSecured(Boolean secured) {
		this.secured = secured;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getRedirectUrl() {
		return redirectUrl;
	}

	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

}