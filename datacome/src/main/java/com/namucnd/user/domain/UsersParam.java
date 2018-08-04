package com.namucnd.user.domain;

import java.io.Serializable;
import java.util.Date;

import com.namucnd.common.domain.CommonParam;

/**
 * <pre>
 * Files parameter
 * </pre>
 * @FileName FilesParam.java
 * @Package com.univeramall.files.domain
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2015. 8. 23.
 * 
 */
public class UsersParam extends CommonParam implements Serializable {

	
	private static final long serialVersionUID = -1935736675215031254L;
	
	private String groupId; //등급아이디
	private String[] ids;
	
	private String[] groupIdx;
	private String[] userJoinRoute;

	private Date minUserJoinDate; // 가입일
	private Date maxUserJoinDate; // 가입일
	
	private Date minUserLastLogin; // 최근접속일자
	private Date maxUserLastLogin; // 최근접속일자
	
	private String searchName; // 검색조건
	private String searchValue; // 검색어

	private String userUpYn; // UP지정유무
	private String userEmailYn; // 메일수신
	private String userSmsYn; // SMS수신
	private Integer minUserMileage; //최소 마일리지
	private Integer maxUserMileage; //최대 마일리지
	private Integer minUserPoint; //최소 포인트
	private Integer maxUserPoint; //최대 포인트
	private Integer minUserAge; //최소 나이
	private Integer maxUserAge; //최대 나이
	private String userGender; // 성별
	
	private Integer minOrderCount; // 최소주문수량
	private Integer maxOrderCount; // 최대주문수량
	private Integer minOrderAmount; // 최소주문금액
	private Integer maxOrderAmount; // 최대주문금액

	private Integer notLoginDay; // 장기 미 로그인 - 왜 이런검색이 필요하지?
	private Integer preDormantDay; // 휴면전환예정회원 - 왜 이런검색이 필요하지?
	
	private String[] cartGoodsIdxs; // 장바구니 상품
	private String[] cartGoodsNames; // 장바구니 상품
	private String[] cartGroupIdxs; // 장바구니 상품카테고리
	private String[] cartGroupNames; // 장바구니 상품카테고리
	
	private String[] wishGoodsIdxs; // 찜 상품
	private String[] wishGoodsNames; // 찜 상품
	private String[] wishGroupIdxs; // 찜 상품카테고리
	private String[] wishGroupNames; // 찜 상품카테고리

	private Date minOrderDate; // 최소주문수량
	private Date maxOrderDate; // 최대주문수량
	
	private String upName; // up 명

	private String userDormantYn; // 휴면회원 여부
	private String userWithdrawYn; // 탈퇴회원 여부
	
	private String userId; // 사용자 아이디
	private String userEmail; // 사용자 이메일
	
	private String excelDown;
	
	public String[] getCartGoodsIdxs() {
		return cartGoodsIdxs;
	}

	public void setCartGoodsIdxs(String[] cartGoodsIdxs) {
		this.cartGoodsIdxs = cartGoodsIdxs;
	}

	public String[] getCartGoodsNames() {
		return cartGoodsNames;
	}

	public void setCartGoodsNames(String[] cartGoodsNames) {
		this.cartGoodsNames = cartGoodsNames;
	}

	public String[] getCartGroupIdxs() {
		return cartGroupIdxs;
	}

	public void setCartGroupIdxs(String[] cartGroupIdxs) {
		this.cartGroupIdxs = cartGroupIdxs;
	}

	public String[] getCartGroupNames() {
		return cartGroupNames;
	}

	public void setCartGroupNames(String[] cartGroupNames) {
		this.cartGroupNames = cartGroupNames;
	}

	public String[] getWishGoodsIdxs() {
		return wishGoodsIdxs;
	}

	public void setWishGoodsIdxs(String[] wishGoodsIdxs) {
		this.wishGoodsIdxs = wishGoodsIdxs;
	}

	public String[] getWishGoodsNames() {
		return wishGoodsNames;
	}

	public void setWishGoodsNames(String[] wishGoodsNames) {
		this.wishGoodsNames = wishGoodsNames;
	}

	public String[] getWishGroupIdxs() {
		return wishGroupIdxs;
	}

	public void setWishGroupIdxs(String[] wishGroupIdxs) {
		this.wishGroupIdxs = wishGroupIdxs;
	}

	public String[] getWishGroupNames() {
		return wishGroupNames;
	}

	public void setWishGroupNames(String[] wishGroupNames) {
		this.wishGroupNames = wishGroupNames;
	}

	public String[] getIds() {
		return ids;
	}

	public void setIds(String[] ids) {
		this.ids = ids;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String[] getGroupIdx() {
		return groupIdx;
	}

	public void setGroupIdx(String[] groupIdx) {
		this.groupIdx = groupIdx;
	}

	public String[] getUserJoinRoute() {
		return userJoinRoute;
	}

	public void setUserJoinRoute(String[] userJoinRoute) {
		this.userJoinRoute = userJoinRoute;
	}

	public Date getMinUserJoinDate() {
		return minUserJoinDate;
	}

	public void setMinUserJoinDate(Date minUserJoinDate) {
		this.minUserJoinDate = minUserJoinDate;
	}

	public Date getMaxUserJoinDate() {
		return maxUserJoinDate;
	}

	public void setMaxUserJoinDate(Date maxUserJoinDate) {
		this.maxUserJoinDate = maxUserJoinDate;
	}

	public Date getMinUserLastLogin() {
		return minUserLastLogin;
	}

	public void setMinUserLastLogin(Date minUserLastLogin) {
		this.minUserLastLogin = minUserLastLogin;
	}

	public Date getMaxUserLastLogin() {
		return maxUserLastLogin;
	}

	public void setMaxUserLastLogin(Date maxUserLastLogin) {
		this.maxUserLastLogin = maxUserLastLogin;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getUserUpYn() {
		return userUpYn;
	}

	public void setUserUpYn(String userUpYn) {
		this.userUpYn = userUpYn;
	}

	public String getUserEmailYn() {
		return userEmailYn;
	}

	public void setUserEmailYn(String userEmailYn) {
		this.userEmailYn = userEmailYn;
	}

	public String getUserSmsYn() {
		return userSmsYn;
	}

	public void setUserSmsYn(String userSmsYn) {
		this.userSmsYn = userSmsYn;
	}

	public Integer getMinUserMileage() {
		return minUserMileage;
	}

	public void setMinUserMileage(Integer minUserMileage) {
		this.minUserMileage = minUserMileage;
	}

	public Integer getMaxUserMileage() {
		return maxUserMileage;
	}

	public void setMaxUserMileage(Integer maxUserMileage) {
		this.maxUserMileage = maxUserMileage;
	}

	public Integer getMinUserPoint() {
		return minUserPoint;
	}

	public void setMinUserPoint(Integer minUserPoint) {
		this.minUserPoint = minUserPoint;
	}

	public Integer getMaxUserPoint() {
		return maxUserPoint;
	}

	public void setMaxUserPoint(Integer maxUserPoint) {
		this.maxUserPoint = maxUserPoint;
	}

	public Integer getMinUserAge() {
		return minUserAge;
	}

	public void setMinUserAge(Integer minUserAge) {
		this.minUserAge = minUserAge;
	}

	public Integer getMaxUserAge() {
		return maxUserAge;
	}

	public void setMaxUserAge(Integer maxUserAge) {
		this.maxUserAge = maxUserAge;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public Integer getMinOrderCount() {
		return minOrderCount;
	}

	public void setMinOrderCount(Integer minOrderCount) {
		this.minOrderCount = minOrderCount;
	}

	public Integer getMaxOrderCount() {
		return maxOrderCount;
	}

	public void setMaxOrderCount(Integer maxOrderCount) {
		this.maxOrderCount = maxOrderCount;
	}

	public Integer getMinOrderAmount() {
		return minOrderAmount;
	}

	public void setMinOrderAmount(Integer minOrderAmount) {
		this.minOrderAmount = minOrderAmount;
	}

	public Integer getMaxOrderAmount() {
		return maxOrderAmount;
	}

	public void setMaxOrderAmount(Integer maxOrderAmount) {
		this.maxOrderAmount = maxOrderAmount;
	}

	public Integer getNotLoginDay() {
		return notLoginDay;
	}

	public void setNotLoginDay(Integer notLoginDay) {
		this.notLoginDay = notLoginDay;
	}

	public Integer getPreDormantDay() {
		return preDormantDay;
	}

	public void setPreDormantDay(Integer preDormantDay) {
		this.preDormantDay = preDormantDay;
	}

	public Date getMinOrderDate() {
		return minOrderDate;
	}

	public void setMinOrderDate(Date minOrderDate) {
		this.minOrderDate = minOrderDate;
	}

	public Date getMaxOrderDate() {
		return maxOrderDate;
	}

	public void setMaxOrderDate(Date maxOrderDate) {
		this.maxOrderDate = maxOrderDate;
	}

	public String getUpName() {
		return upName;
	}

	public void setUpName(String upName) {
		this.upName = upName;
	}

	public String getUserDormantYn() {
		return userDormantYn;
	}

	public void setUserDormantYn(String userDormantYn) {
		this.userDormantYn = userDormantYn;
	}

	public String getUserWithdrawYn() {
		return userWithdrawYn;
	}

	public void setUserWithdrawYn(String userWithdrawYn) {
		this.userWithdrawYn = userWithdrawYn;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getExcelDown() {
		return excelDown;
	}

	public void setExcelDown(String excelDown) {
		this.excelDown = excelDown;
	}

}
