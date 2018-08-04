package com.namucnd.security.domain;

import java.io.Serializable;

import com.namucnd.common.domain.CommonEntity;

/**
 * 본인인증 Domain
 * @author Administrator
 *
 */
public class AuthenticationReq extends CommonEntity implements Serializable {

	private static final long serialVersionUID = -1957108925840753417L;

	String s_enc_data; // 요청 번호
	String req_seq; // 요청 번호
	String token; // 회원초대 토큰 (가입시 쓰이니 그냥 여기에 만듬)
	int count;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getS_enc_data() {
		return s_enc_data;
	}
	public void setS_enc_data(String s_enc_data) {
		this.s_enc_data = s_enc_data;
	}
	public String getReq_seq() {
		return req_seq;
	}
	public void setReq_seq(String req_seq) {
		this.req_seq = req_seq;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
}