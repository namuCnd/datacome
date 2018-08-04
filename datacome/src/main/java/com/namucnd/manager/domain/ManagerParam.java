package com.namucnd.manager.domain;

import java.io.Serializable;
import java.util.Date;

import com.namucnd.common.domain.CommonParam;

/**
 * <pre>
 * 관리자 parameter
 * </pre>
 * @FileName ManagerParam.java
 * @Package com.univeramall.manager.domain
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
public class ManagerParam extends CommonParam implements Serializable {

	private static final long serialVersionUID = -5387838445867946273L;

	private String mngrId			; // VARCHAR2(20 BYTE)	No		사용자아이디
	private String mngrPw			; // VARCHAR2(255 BYTE)	No		비밀번호
	private String mngrName		; // VARCHAR2(60 BYTE)	Yes		이름
	private String mngrEmail		; // VARCHAR2(100 BYTE)	Yes		이메일
	private String mngrPhone		; // VARCHAR2(20 BYTE)	Yes		전화번호
	private String mngrCellular	; // VARCHAR2(20 BYTE)	Yes		휴대폰번호
	private String mngrDesc		; // VARCHAR2(4000 BYTE)	Yes		기타사항
	private String mngrIp			; // VARCHAR2(60 BYTE) 	Yes		최근접속IP
	private Date mngrLoginDate	; // DATE				Yes 	최근접속시간
	
	public String getMngrId() {
		return mngrId;
	}
	public void setMngrId(String mngrId) {
		this.mngrId = mngrId;
	}
	public String getMngrPw() {
		return mngrPw;
	}
	public void setMngrPw(String mngrPw) {
		this.mngrPw = mngrPw;
	}
	public String getMngrName() {
		return mngrName;
	}
	public void setMngrName(String mngrName) {
		this.mngrName = mngrName;
	}
	public String getMngrEmail() {
		return mngrEmail;
	}
	public void setMngrEmail(String mngrEmail) {
		this.mngrEmail = mngrEmail;
	}
	public String getMngrPhone() {
		return mngrPhone;
	}
	public void setMngrPhone(String mngrPhone) {
		this.mngrPhone = mngrPhone;
	}
	public String getMngrCellular() {
		return mngrCellular;
	}
	public void setMngrCellular(String mngrCellular) {
		this.mngrCellular = mngrCellular;
	}
	public String getMngrDesc() {
		return mngrDesc;
	}
	public void setMngrDesc(String mngrDesc) {
		this.mngrDesc = mngrDesc;
	}
	public String getMngrIp() {
		return mngrIp;
	}
	public void setMngrIp(String mngrIp) {
		this.mngrIp = mngrIp;
	}
	public Date getMngrLoginDate() {
		return mngrLoginDate;
	}
	public void setMngrLoginDate(Date mngrLoginDate) {
		this.mngrLoginDate = mngrLoginDate;
	}
	
}
