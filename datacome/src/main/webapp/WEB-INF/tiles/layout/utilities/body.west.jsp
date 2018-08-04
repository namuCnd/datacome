<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:message var="useMileage" code="use.mileage"/>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
			<div class="lnb lnbBottom">
				<ul class="depth1">
					<li>
						<p class="on">기타 메뉴</p>
						<ul class="depth2 up">
							<li><a href="${pageContext.request.contextPath }/utilities/readCCM.do" class="menuIdCCM">소비자 중심경영</a></li>
							<li><a href="${pageContext.request.contextPath }/utilities/readHealing.do" class="menuIdHealing">힐링잎의 기적 캠페인</a></li>
							<li><a href="${pageContext.request.contextPath }/utilities/readMembership.do" class="menuIdMembership">멤버십 혜택</a></li>
							<c:if test="${useMileage eq 'Y'}">
							<li style="display: none;"><a href="${pageContext.request.contextPath }/utilities/readMileage.do" class="menuIdMileage" >마일리지샵 안내</a></li>
							</c:if>
						</ul>
						<ul class="depth2 dw">
							<li><a href="${pageContext.request.contextPath }/utilities/readSitemap.do" class="menuIdSitemap">사이트맵</a></li>
							<li><a href="${pageContext.request.contextPath }/utilities/readProvision.do" class="menuIdProvision">이용약관</a></li>
							<li><a href="${pageContext.request.contextPath }/utilities/readPrivateTreatment.do" class="menuIdPrivateTreatment">개인정보취급방침</a></li>
							<li><a href="${pageContext.request.contextPath }/utilities/readEmailAddr.do" class="menuIdEmailAddr">이메일주소 무단수집거부</a></li>
							<li><a href="${pageContext.request.contextPath }/utilities/readWebAccess.do" class="menuIdWebAccess">웹 접근성 안내</a></li>
							<li><a href="${pageContext.request.contextPath }/utilities/readInformation.do" class="menuIdInfomation">이용안내</a></li>
						</ul>
					</li>			
				</ul>
			</div><!-- //lnb -->
