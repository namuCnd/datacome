package com.namucnd.security.domain;

import java.io.Serializable;

/**
 * 본인인증 Domain
 * @author Administrator
 *
 */
public class Authentication implements Serializable {

	private static final long serialVersionUID = -1957108925840753417L;

	String req_seq; // 요청 번호
	String res_seq; // 인증 고유번호
	String auth_type; // 인증 수단
	String name; // 성명
	String gender; // 성별
	String nationalinfo; // 내/외국인정보 (개발가이드 참조)
	String di; // 중복가입 확인값 (DI_64 byte)
	String birthdate; // 생년월일
	String mobileNo; // 폰 번호
	String email; // 폰 번호
	
	String sReserved1; // 내부 데이터
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getReq_seq() {
		return req_seq;
	}
	public void setReq_seq(String req_seq) {
		this.req_seq = req_seq;
	}
	public String getRes_seq() {
		return res_seq;
	}
	public void setRes_seq(String res_seq) {
		this.res_seq = res_seq;
	}
	public String getAuth_type() {
		return auth_type;
	}
	public void setAuth_type(String auth_type) {
		this.auth_type = auth_type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		
		return gender;
	}
	public void setGender(String gender) {
		
		this.gender = gender;
	}
	public String getNationalinfo() {
		return nationalinfo;
	}
	public void setNationalinfo(String nationalinfo) {
		this.nationalinfo = nationalinfo;
	}
	public String getDi() {
		return di;
	}
	public void setDi(String di) {
		this.di = di;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	
	public String getsReserved1() {
		return sReserved1;
	}
	public void setsReserved1(String sReserved1) {
		this.sReserved1 = sReserved1;
	}
	
	public String toString() {
		return "Authentication [req_seq=" + req_seq + ", res_seq=" + res_seq + ", auth_type=" + auth_type + ", name=" + name
				+ ", gender=" + gender + ", nationalinfo=" + nationalinfo + ", di=" + di + ", birthdate=" + birthdate
				+ ", mobileNo=" + mobileNo + "]";
	}
}