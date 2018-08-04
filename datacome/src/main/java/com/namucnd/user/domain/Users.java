package com.namucnd.user.domain;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.namucnd.common.domain.CommonEntity;

/**
 * <pre>
 * 사용자(회원)
 * </pre>
 * @FileName Users.java
 * @Package com.univeramall.user.domain
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2018. 2. 27.
 * 
 */
public class Users extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 4355412199434151513L;

	private String user_id				; // VARCHAR2(20 BYTE)	No		사용자아이디

	private String dupPassYn			; // 사용자 아이디 중복검사 통과여부
	
	private String group_id				; // VARCHAR2(20 BYTE)	Yes		등급아이디
	private String user_pw				; // VARCHAR2(255 BYTE)	Yes		사용자비밀번호
	private String user_pw_confirm		; // VARCHAR2(255 BYTE)	Yes		사용자비밀번호 확인
	private String user_name			; // VARCHAR2(60 BYTE)	Yes		사용자이름
	private String user_gender			; // VARCHAR2(20 BYTE)	Yes		성별(10:남, 20:여)
	private String user_cellular		; // VARCHAR2(20 BYTE)	Yes		사용자휴대폰번호

	private String cellularFirst		; 
	private String cellularSecond		; 
	private String cellularLast			; 
	
	private String certNo;
	private String certYn;
	
	private String user_phone			; // VARCHAR2(20 BYTE)	Yes		사용자전화번호

	private String phoneFirst			; 
	private String phoneSecond			; 
	private String phoneLast			; 

	private String user_email			; // VARCHAR2(100 BYTE)	Yes		사용자이메일

	private String emailFirst			; // email id
	private String emailLast			; // email domain
	private String emailType			; // 이메일 종류
	
	private String user_zipcd			; // VARCHAR2(6 BYTE)	Yes		우편번호
	private String user_base_addr		; // VARCHAR2(255 BYTE)	Yes		기본주소
	private String user_detail_addr		; // VARCHAR2(255 BYTE)	Yes		상세주소
	private String user_sms_yn			; // CHAR(1 BYTE)	No	'N' 	SMS수신여부
	private String user_email_yn		; // CHAR(1 BYTE)	No	'N' 	이메일수신여부
	private String user_provision_yn	; // CHAR(1 BYTE)	No	'N' 	회원약관동의여부
	private String user_privacy_yn		; // CHAR(1 BYTE)	No	'N' 	개인정보취급방침동의여부
	private String user_certi_yn		; // CHAR(1 BYTE)	No	'N' 	주민번호인증여부 - 삭제
	private String user_cert_type		; // VARCHAR2(20 BYTE)	Yes		실명인증방식 (CERTTYPE - MOBILE:휴대폰인증, IPIN: 아이핀)
	private String user_certi_no		; // VARCHAR2(255 BYTE)	Yes		주민번호인증번호 - 삭제
	private Integer user_mileage		; // NUMBER	Yes		마일리지
	private Integer user_point			; // NUMBER	Yes		포인트
	private String user_withdraw_yn		; // CHAR(1 BYTE)	No	'N' 	탈퇴여부
	private String user_withdraw_cd		; // VARCHAR2(20 BYTE)	Yes		탈퇴사유코드
	private String user_withdraw_desc	; // VARCHAR2(4000 BYTE)	Yes		탈퇴사유
	private Date user_last_login		; // DATE	Yes		최근로긴일시
	private String user_join_division	; // VARCHAR2(20 BYTE)	Yes		가입구분(USERJOINDIVISION - 10:직접가입, 20:초대장) - 미사용
	private String user_join_route		; // VARCHAR2(20 BYTE)	Yes		가입경로(USERJOINROUTE - 10:웹, 20:모바일웹, 30:IOS앱, 40:안드로이드앱)
	private Date user_withdraw_date		; // DATE	Yes		탈퇴일시
	private String user_dormant_yn		; // CHAR(1 BYTE)	No	'N' 	휴면여부
	private Date user_dormant_date		; // DATE	Yes		휴면여부변경일자(휴면여부컬럼 값이 변경되면 동시에 SYSDATE값이로 변경됨)
	private String recommender_user_id	; // VARCHAR2(20 BYTE)	Yes		추천인
	private String user_socialno		; // VARCHAR2(15 BYTE)	Yes		주민번호
	private String user_cert_yn			; // CHAR(1 BYTE)	No	'N' 	실명인증여부
	private String user_cert_no			; // VARCHAR2(255 BYTE)	Yes		실명인증번호
	private Date user_join_date			; // DATE	No	sysdate 	가입일자
	private Date user_pw_date			; // DATE	Yes	sysdate		비밀번호변경일
	private String user_break_yn		; // CHAR(1 BYTE)	No	'N' 	파기여부
	private String user_birthday		; // VARCHAR2(8 BYTE)	Yes		생년월일
	private String file_id				; // VARCHAR2(20 BYTE)	Yes		사용자사진-삭제
	private String user_city			; // VARCHAR2(50 BYTE)	Yes		주거지(시도)
	private String user_gu				; // VARCHAR2(100 BYTE)	Yes		주거지(구)
	private String user_up_yn			; // CHAR(1 BYTE)	Yes		유피지정유무 (Y:UP지정회원, N:일반회원)            
	private String up_idx				; // VARCHAR2(20 BYTE)	Yes		유피(설계사)일련번호
	private String agent_idx			; // VARCHAR2(20 BYTE)	Yes		대리점(거래처)번호  
	private String up_update_yn			; // CHAR(1 BYTE)	Yes		유피변경유무            
	private String agent_update_yn		; // CHAR(1 BYTE)	Yes		대리점변경유무          
	private String user_old_yn			; // CHAR(1 BYTE)	No	'N'		구회원여부

	private String order_count;			// 총 구매횟수
	private String order_amount;		// 총 구매금액
	private String refund_count;		// 교환환불 횟수
	private String heal_leaf_amount;	// 총 힐링잎수
	
	private Integer join_count;
	private Integer dormant_count;
	private Integer withdraw_count;
	
	private UsersGroup usersGroup; // 사용자 그룹
	
	private Integer recom; // 지정UP IDX 
	
	private Integer user_age_code;//연령대
	
	// 임시 도메인
	private String profile_img_url;

	private String group_name;
	// 임시 도메인
	
	//알립톡 강제 발송을 위해 셋팅
	private String admin_yn;	//Y:관리자 N:일반
	
	//유니베라페이를 사용하기 위한 유저키 추가 2018.07.05
	private String wpay_user_key;
	
	public String getWpay_user_key() {
		return wpay_user_key;
	}
	public void setWpay_user_key(String wpay_user_key) {
		this.wpay_user_key = wpay_user_key;
	}
	public String getAdmin_yn() {
		return admin_yn;
	}
	public void setAdmin_yn(String admin_yn) {
		this.admin_yn = admin_yn;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getProfile_img_url() {
		return profile_img_url;
	}
	public void setProfile_img_url(String profile_img_url) {
		this.profile_img_url = profile_img_url;
	}
	public boolean isLogin() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return !(authentication instanceof AnonymousAuthenticationToken);
	}
	public Integer getUser_age_code() {
		return user_age_code;
	}
	public void setUser_age_code(Integer user_age_code) {
		this.user_age_code = user_age_code;
	}

	/**
	 * <pre>
	 * 이메일 담기
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 3. 28.
	 * @return
	 */
	public void setEmailSplit(String user_email) {
		try {
			String[] arr = StringUtils.split(user_email, "@");
			this.emailFirst = arr[0];
			this.emailLast = arr[1];
		} catch (Exception e) {}
	}
	
	/**
	 * <pre>
	 * 이메일 조합
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 3. 29.
	 */
	public void setEmailJoin() {
		try {
			if(StringUtils.isNotEmpty(this.emailFirst) && StringUtils.isNotEmpty(this.emailLast)) {
				this.user_email = this.emailFirst + "@" + this.emailLast;
			}
		} catch (Exception e) {}
	}
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
			this.cellularFirst = arr[0];
			this.cellularSecond = arr[1];
			this.cellularLast = arr[2];
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
			if (StringUtils.isNotEmpty(this.cellularFirst) && StringUtils.isNotEmpty(this.cellularSecond)
					&& StringUtils.isNotEmpty(this.cellularLast)) {
				this.user_cellular = this.cellularFirst + "-" + this.cellularSecond + "-" + this.cellularLast;
			}
		} catch (Exception e) {}
	}
	/**
	 * <pre>
	 * 전화번호
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 3. 28.
	 * @param user_phone
	 */
	public void setPhoneSplit(String user_phone) {
		try {
			String[] arr = StringUtils.split(user_phone, "-");
			this.phoneFirst = arr[0];
			this.phoneSecond = arr[1];
			this.phoneLast = arr[2];
		} catch (Exception e) {}
	}
	
	/**
	 * <pre>
	 * 전화번호 조합
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 3. 29.
	 */
	public void setPhoneJoin() {
		try {
			if (StringUtils.isNotEmpty(this.phoneFirst) && StringUtils.isNotEmpty(this.phoneSecond)
					&& StringUtils.isNotEmpty(this.phoneLast)) {
				this.user_phone = this.phoneFirst + "-" + this.phoneSecond + "-" + this.phoneLast;
			}
		} catch (Exception e) {}
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_pw_confirm() {
		return user_pw_confirm;
	}
	public void setUser_pw_confirm(String user_pw_confirm) {
		this.user_pw_confirm = user_pw_confirm;
	}
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_cellular() {
		return user_cellular;
	}

	public void setUser_cellular(String user_cellular) {
		this.user_cellular = user_cellular;
		this.setCellularSplit(user_cellular);
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
		this.setPhoneSplit(user_phone);
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
		this.setEmailSplit(user_email);
	}

	public String getUser_zipcd() {
		return user_zipcd;
	}

	public void setUser_zipcd(String user_zipcd) {
		this.user_zipcd = user_zipcd;
	}

	public String getUser_base_addr() {
		return user_base_addr;
	}

	public void setUser_base_addr(String user_base_addr) {
		this.user_base_addr = user_base_addr;
	}

	public String getUser_detail_addr() {
		return user_detail_addr;
	}

	public void setUser_detail_addr(String user_detail_addr) {
		this.user_detail_addr = user_detail_addr;
	}

	public String getUser_sms_yn() {
		return user_sms_yn;
	}

	public void setUser_sms_yn(String user_sms_yn) {
		this.user_sms_yn = user_sms_yn;
	}

	public String getUser_email_yn() {
		return user_email_yn;
	}

	public void setUser_email_yn(String user_email_yn) {
		this.user_email_yn = user_email_yn;
	}

	public String getUser_provision_yn() {
		return user_provision_yn;
	}

	public void setUser_provision_yn(String user_provision_yn) {
		this.user_provision_yn = user_provision_yn;
	}

	public String getUser_privacy_yn() {
		return user_privacy_yn;
	}

	public void setUser_privacy_yn(String user_privacy_yn) {
		this.user_privacy_yn = user_privacy_yn;
	}

	public String getUser_certi_yn() {
		return user_certi_yn;
	}

	public void setUser_certi_yn(String user_certi_yn) {
		this.user_certi_yn = user_certi_yn;
	}

	public String getUser_cert_type() {
		return user_cert_type;
	}

	public void setUser_cert_type(String user_cert_type) {
		this.user_cert_type = user_cert_type;
	}

	public String getUser_certi_no() {
		return user_certi_no;
	}

	public void setUser_certi_no(String user_certi_no) {
		this.user_certi_no = user_certi_no;
	}

	public Integer getUser_mileage() {
		return user_mileage;
	}

	public void setUser_mileage(Integer user_mileage) {
		this.user_mileage = user_mileage;
	}

	public Integer getUser_point() {
		return user_point;
	}

	public void setUser_point(Integer user_point) {
		this.user_point = user_point;
	}

	public String getUser_withdraw_yn() {
		return user_withdraw_yn;
	}

	public void setUser_withdraw_yn(String user_withdraw_yn) {
		this.user_withdraw_yn = user_withdraw_yn;
	}

	public String getUser_withdraw_cd() {
		return user_withdraw_cd;
	}

	public void setUser_withdraw_cd(String user_withdraw_cd) {
		this.user_withdraw_cd = user_withdraw_cd;
	}

	public String getUser_withdraw_desc() {
		return user_withdraw_desc;
	}

	public void setUser_withdraw_desc(String user_withdraw_desc) {
		this.user_withdraw_desc = user_withdraw_desc;
	}

	public Date getUser_last_login() {
		return user_last_login;
	}

	public String getHeal_leaf_amount() {
		return heal_leaf_amount;
	}

	public void setHeal_leaf_amount(String heal_leaf_amount) {
		this.heal_leaf_amount = heal_leaf_amount;
	}

	public void setUser_last_login(Date user_last_login) {
		this.user_last_login = user_last_login;
	}

	public String getUser_join_division() {
		return user_join_division;
	}

	public void setUser_join_division(String user_join_division) {
		this.user_join_division = user_join_division;
	}

	public String getUser_join_route() {
		return user_join_route;
	}

	public void setUser_join_route(String user_join_route) {
		this.user_join_route = user_join_route;
	}

	public Date getUser_withdraw_date() {
		return user_withdraw_date;
	}

	public void setUser_withdraw_date(Date user_withdraw_date) {
		this.user_withdraw_date = user_withdraw_date;
	}

	public String getUser_dormant_yn() {
		return user_dormant_yn;
	}

	public void setUser_dormant_yn(String user_dormant_yn) {
		this.user_dormant_yn = user_dormant_yn;
	}

	public Date getUser_dormant_date() {
		return user_dormant_date;
	}

	public void setUser_dormant_date(Date user_dormant_date) {
		this.user_dormant_date = user_dormant_date;
	}

	public String getRecommender_user_id() {
		return recommender_user_id;
	}

	public void setRecommender_user_id(String recommender_user_id) {
		this.recommender_user_id = recommender_user_id;
	}

	public String getUser_socialno() {
		return user_socialno;
	}

	public void setUser_socialno(String user_socialno) {
		this.user_socialno = user_socialno;
	}

	public String getUser_cert_yn() {
		return user_cert_yn;
	}

	public void setUser_cert_yn(String user_cert_yn) {
		this.user_cert_yn = user_cert_yn;
	}

	public String getUser_cert_no() {
		return user_cert_no;
	}

	public void setUser_cert_no(String user_cert_no) {
		this.user_cert_no = user_cert_no;
	}

	public Date getUser_join_date() {
		return user_join_date;
	}

	public void setUser_join_date(Date user_join_date) {
		this.user_join_date = user_join_date;
	}

	public Date getUser_pw_date() {
		return user_pw_date;
	}

	public void setUser_pw_date(Date user_pw_date) {
		this.user_pw_date = user_pw_date;
	}

	public String getUser_break_yn() {
		return user_break_yn;
	}

	public void setUser_break_yn(String user_break_yn) {
		this.user_break_yn = user_break_yn;
	}

	public String getUser_birthday() {
		return user_birthday;
	}

	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}

	public String getFile_id() {
		return file_id;
	}

	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}

	public String getUser_city() {
		return user_city;
	}

	public void setUser_city(String user_city) {
		this.user_city = user_city;
	}

	public String getUser_gu() {
		return user_gu;
	}

	public void setUser_gu(String user_gu) {
		this.user_gu = user_gu;
	}

	public String getUser_old_yn() {
		return user_old_yn;
	}

	public void setUser_old_yn(String user_old_yn) {
		this.user_old_yn = user_old_yn;
	}

	public String getUser_up_yn() {
		return user_up_yn;
	}

	public void setUser_up_yn(String user_up_yn) {
		this.user_up_yn = user_up_yn;
	}

	public String getUp_idx() {
		return up_idx;
	}

	public void setUp_idx(String up_idx) {
		this.up_idx = up_idx;
	}

	public String getAgent_idx() {
		return agent_idx;
	}

	public void setAgent_idx(String agent_idx) {
		this.agent_idx = agent_idx;
	}

	public String getUp_update_yn() {
		return up_update_yn;
	}

	public void setUp_update_yn(String up_update_yn) {
		this.up_update_yn = up_update_yn;
	}

	public String getAgent_update_yn() {
		return agent_update_yn;
	}

	public void setAgent_update_yn(String agent_update_yn) {
		this.agent_update_yn = agent_update_yn;
	}

	public String getOrder_count() {
		return order_count;
	}

	public void setOrder_count(String order_count) {
		this.order_count = order_count;
	}

	public String getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(String order_amount) {
		this.order_amount = order_amount;
	}

	public UsersGroup getUsersGroup() {
		return usersGroup;
	}

	public void setUsersGroup(UsersGroup usersGroup) {
		this.usersGroup = usersGroup;
	}

	public String getPhoneFirst() {
		return phoneFirst;
	}

	public void setPhoneFirst(String phoneFirst) {
		this.phoneFirst = phoneFirst;
	}

	public String getPhoneSecond() {
		return phoneSecond;
	}

	public void setPhoneSecond(String phoneSecond) {
		this.phoneSecond = phoneSecond;
	}

	public String getPhoneLast() {
		return phoneLast;
	}

	public void setPhoneLast(String phoneLast) {
		this.phoneLast = phoneLast;
	}

	public String getEmailFirst() {
		return emailFirst;
	}

	public void setEmailFirst(String emailFirst) {
		this.emailFirst = emailFirst;
	}

	public String getEmailLast() {
		return emailLast;
	}

	public void setEmailLast(String emailLast) {
		this.emailLast = emailLast;
	}

	public String getEmailType() {
		return emailType;
	}

	public void setEmailType(String emailType) {
		this.emailType = emailType;
	}

	public String getCellularFirst() {
		return cellularFirst;
	}

	public void setCellularFirst(String cellularFirst) {
		this.cellularFirst = cellularFirst;
	}

	public String getCellularSecond() {
		return cellularSecond;
	}

	public void setCellularSecond(String cellularSecond) {
		this.cellularSecond = cellularSecond;
	}

	public String getCellularLast() {
		return cellularLast;
	}

	public void setCellularLast(String cellularLast) {
		this.cellularLast = cellularLast;
	}

	public String getCertNo() {
		return certNo;
	}

	public void setCertNo(String certNo) {
		this.certNo = certNo;
	}

	public String getCertYn() {
		return certYn;
	}

	public void setCertYn(String certYn) {
		this.certYn = certYn;
	}

	public String getDupPassYn() {
		return dupPassYn;
	}

	public void setDupPassYn(String dupPassYn) {
		this.dupPassYn = dupPassYn;
	}

	public Integer getRecom() {
		return recom;
	}

	public void setRecom(Integer recom) {
		this.recom = recom;
	}

	public String getRefund_count() {
		return refund_count;
	}

	public void setRefund_count(String refund_count) {
		this.refund_count = refund_count;
	}

	public Integer getJoin_count() {
		return join_count;
	}

	public void setJoin_count(Integer join_count) {
		this.join_count = join_count;
	}

	public Integer getDormant_count() {
		return dormant_count;
	}

	public void setDormant_count(Integer dormant_count) {
		this.dormant_count = dormant_count;
	}

	public Integer getWithdraw_count() {
		return withdraw_count;
	}

	public void setWithdraw_count(Integer withdraw_count) {
		this.withdraw_count = withdraw_count;
	}

}