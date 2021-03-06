package com.namucnd.common.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.security.core.context.SecurityContextHolder;

import com.namucnd.utils.PagerUtils;

/**
 * <pre>
 * 공통 Parameter
 * </pre>
 * 
 * @FileName CommonParam.java
 * @Package com.univeramall.common.domain
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2013. 10. 11.
 */
public class CommonParam {

	private Long totalRecords = 0L; // 총 게시물 개수

	private Integer pageNumber = 1; // 페이지 번호

	private Integer firstResult; // list 시작 rownum-1
	private Integer maxResult; // 한페이지당 표시될 row 개수
	private Integer lastResult; // list 마지막 rownum

	private Integer totalPages; // 총 페이지 수
	private String orderName; // 정렬 필드
	private String direction = "desc"; // 정렬 방향

	private String definitionName; // Tiles definition name
	private String siteId; // 사이트 아이디 (web/mobile)
	private String siteType; // 사이트 타입 (user/admin)

	private String loginId; // 로긴아이디

	private String locale; // 언어코드
	@DateTimeFormat(iso=ISO.DATE)
	private Date minDate; // 시작일자
	@DateTimeFormat(iso=ISO.DATE)
	private Date maxDate; // 종료일자
	@DateTimeFormat(iso=ISO.DATE)
	private Date createDate; // 생성일자
	private String createUser; // 생성자
	private Date updateDate; // 수정일자
	private String updateUser; // 수정자
	private String useYn; // 사용유무
	private String errorCode;
	
	@DateTimeFormat(iso=ISO.DATE)
	private Date withdrawMinDate; // 탈퇴검색 최소날짜 DATE
	@DateTimeFormat(iso=ISO.DATE)
	private Date withdrawMaxDate; // 탈퇴검색 최대날짜 DATE

	public Date getWithdrawMinDate() {
		return withdrawMinDate;
	}
	public void setWithdrawMinDate(Date withdrawMinDate) {
		this.withdrawMinDate = withdrawMinDate;
	}
	public Date getWithdrawMaxDate() {
		return withdrawMaxDate;
	}
	public void setWithdrawMaxDate(Date withdrawMaxDate) {
		this.withdrawMaxDate = withdrawMaxDate;
	}

	public CommonParam() {
	}

	/**
	 * <pre>
	 * 페이징 변수 계산/ 입력
	 * </pre>
	 * 
	 * @author Sorcerer.Picoo
	 * @since 2014. 4. 25.
	 * @param totalRecords
	 * @param pageNumber
	 * @param maxResult
	 */
	public void initPagination(Long totalRecords, Integer pageNumber, Integer maxResult) {
		this.setTotalPages(PagerUtils.getTotalPages(totalRecords, maxResult));
		this.setFirstResult(PagerUtils.getFirstResult(maxResult, pageNumber));
		this.setLastResult(PagerUtils.getLastResult(maxResult, pageNumber));
	}

	public Long getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(Long totalRecords) {
		this.totalRecords = totalRecords;
		// 페이지 개수 계산
		initPagination(this.getTotalRecords(), this.getPageNumber(), this.getMaxResult());
	}

	public Integer getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}

	public Integer getMaxResult() {
		// 빈 값일 경우 property 파일 리딩
		if (this.maxResult == null) {
			this.setMaxResult(PagerUtils.getMaxResult());
		}
		return maxResult;
	}

	public void setMaxResult(Integer maxResult) {
		this.maxResult = maxResult;
	}

	public Integer getFirstResult() {
		// 페이지 개수 계산
		if (this.firstResult == null) {
			initPagination(this.getTotalRecords(), this.getPageNumber(), this.getMaxResult());
		}
		return firstResult;
	}

	public void setFirstResult(Integer firstResult) {
		this.firstResult = firstResult;
	}

	public Integer getLastResult() {
		// 페이지 개수 계산
		if (this.lastResult == null) {
			initPagination(this.getTotalRecords(), this.getPageNumber(), this.getMaxResult());
		}
		return lastResult;
	}

	public void setLastResult(Integer lastResult) {
		this.lastResult = lastResult;
	}

	public Integer getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
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

	public String getLocale() {
		return locale;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

	public Date getMinDate() {
		return minDate;
	}

	public void setMinDate(Date minDate) {
		this.minDate = minDate;
	}

	public Date getMaxDate() {
		return maxDate;
	}

	public void setMaxDate(Date maxDate) {
		this.maxDate = maxDate;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getLoginId() {
		loginId = SecurityContextHolder.getContext().getAuthentication().getName();
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

}
