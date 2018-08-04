package com.namucnd.user.domain;

import java.io.Serializable;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.NotEmpty;

import com.namucnd.common.domain.CommonParam;

/**
 * <pre>
 * 아이디/비밀번호 찾기 parameter
 * </pre>
 * @FileName FileAccountParam.java
 * @Package com.univeramall.user.domain
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2018. 3. 15.
 * 
 */
public class FindAccountParam extends CommonParam implements Serializable {

	private static final long serialVersionUID = -2355438525596024484L;

	@NotEmpty(message="인증방식을 선택해 주세요.")
	private String certMethod; // 방식 구분 (휴대전화/이메일) 
	@NotEmpty(message="대상선택이 빠져있습니다.")
	private String certLocation; // 찾을 대상 (FINDID/FINDPW)
	
	private String userCellular		; // VARCHAR2(20 BYTE)	Yes		사용자휴대폰번호
	private String userCellular1		; // VARCHAR2(20 BYTE)	Yes		사용자휴대폰번호 국번
	private String userCellular2		; // VARCHAR2(20 BYTE)	Yes		사용자휴대폰번호 앞자리
	private String userCellular3		; // VARCHAR2(20 BYTE)	Yes		사용자휴대폰번호 뒷자리
	private String userEmail			; // VARCHAR2(100 BYTE)	Yes		사용자이메일

	@NotEmpty(message="사용자아이디가 비어있습니다.", groups={ValidFindPw.class})
	private String userId				; // VARCHAR2(20 BYTE)	No		사용자아이디
	@NotEmpty(message="사용자이름을 입력해 주세요.", groups={ValidFindId.class, ValidFindPw.class})
	private String userName				; // VARCHAR2(60 BYTE)	Yes		사용자이름

	private String userCertNo; // 인증번호
	
	@NotEmpty(message="인증번호를 입력해 주세요.", groups={ValidFindPw.class})
	private String certNo; // 자체인증 인증번호

	/**
	 * <pre>
	 * 휴대폰 
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 3. 28.
	 * @param user_cellular
	 */
	public void setCellularSplit(String user_cellular) {
		try {
			String[] arr = StringUtils.split(user_cellular, "-");
			this.userCellular1 = arr[0];
			this.userCellular2 = arr[1];
			this.userCellular3 = arr[2];
		} catch (Exception e) {}
	}
	
	/**
	 * <pre>
	 * 휴대폰 조합
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 3. 29.
	 */
	public void setCellularJoin() {
		try {
			if (StringUtils.isNotEmpty(this.userCellular1) && StringUtils.isNotEmpty(this.userCellular2)
					&& StringUtils.isNotEmpty(this.userCellular3)) {
				this.userCellular = this.userCellular1 + "-" + this.userCellular2 + "-" + this.userCellular3;
			}
		} catch (Exception e) {}
	}

	public String getCertMethod() {
		return certMethod;
	}

	public void setCertMethod(String certMethod) {
		this.certMethod = certMethod;
	}

	public String getCertLocation() {
		return certLocation;
	}

	public void setCertLocation(String certLocation) {
		this.certLocation = certLocation;
	}

	public String getUserCellular() {
		return userCellular;
	}

	public void setUserCellular(String userCellular) {
		this.userCellular = userCellular;
		this.setCellularSplit(userCellular);
	}

	public String getUserCellular1() {
		return userCellular1;
	}

	public void setUserCellular1(String userCellular1) {
		this.userCellular1 = userCellular1;
		setCellularJoin();
	}

	public String getUserCellular2() {
		return userCellular2;
	}

	public void setUserCellular2(String userCellular2) {
		this.userCellular2 = userCellular2;
		setCellularJoin();
	}

	public String getUserCellular3() {
		return userCellular3;
	}

	public void setUserCellular3(String userCellular3) {
		this.userCellular3 = userCellular3;
		setCellularJoin();
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserCertNo() {
		return userCertNo;
	}

	public void setUserCertNo(String userCertNo) {
		this.userCertNo = userCertNo;
	}

	public String getCertNo() {
		return certNo;
	}

	public void setCertNo(String certNo) {
		this.certNo = certNo;
	}

}
