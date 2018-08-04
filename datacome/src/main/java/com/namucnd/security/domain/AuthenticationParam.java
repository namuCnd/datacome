package com.namucnd.security.domain;

import java.io.Serializable;

import com.namucnd.common.domain.CommonParam;

/**
 * 본인인증 Parameter domain
 * @author Administrator
 *
 */
public class AuthenticationParam extends CommonParam implements Serializable {

	private static final long serialVersionUID = 4136774938367703674L;

	private String reqSeq;

	public String getReqSeq() {
		return reqSeq;
	}

	public void setReqSeq(String reqSeq) {
		this.reqSeq = reqSeq;
	}

	public String toString() {
		return "AuthenticationParam [reqSeq=" + reqSeq + "]";
	}
}