<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:message var="useMileage" code="use.mileage"/>
	<ul class="mypageTop${useMileage eq 'Y' ? '_mil':''} menuHighlight">
							<li class="li01">
								<dl>
									<dt>쇼핑정보</dt>
									<dd>
										<ul>
											<li><a href="${pageContext.request.contextPath}/mypage/order/readList.do" data-href-target="${pageContext.request.contextPath}/mypage/order/readOne.do">주문/배송조회</a></li>
											<li><a href="${pageContext.request.contextPath}/mypage/upOrder/readList.do" data-href-target="${pageContext.request.contextPath}/mypage/upOrder/readOne.do">UP 주문 요청 조회</a></li>
											<li><a href="${pageContext.request.contextPath}/mypage/cart/readList.do">장바구니</a></li>
											<li><a href="${pageContext.request.contextPath}/mypage/wishlist/readList.do">찜한 상품</a></li>
										</ul>
									</dd>
								</dl>
							</li>
							<li class="li02">
								<dl>
									<dt>문의내역</dt>
									<dd>
										<ul>
											<li><a href="${pageContext.request.contextPath}/mypage/qna/readList.do">상품 Q&amp;A</a></li>
											<li><a href="${pageContext.request.contextPath}/mypage/counsel/readList.do">1:1문의</a></li>
										</ul>
									</dd>
								</dl>
							</li>
							<li class="li03">
								<dl>
									<dt>회원정보</dt>
									<dd>
										<ul>
											<li><a href="${pageContext.request.contextPath}/mypage/user/editUserForm.do" data-href-target="${pageContext.request.contextPath}/mypage/user/editUserInfoForm.do">개인정보 변경</a></li>
											<li><a href="${pageContext.request.contextPath}/mypage/user/editPasswordForm.do">비밀번호 변경</a></li>
											<li><a href="${pageContext.request.contextPath}/mypage/user/editWithdrawForm.do" data-href-target="${pageContext.request.contextPath}/mypage/user/withdrawProc.do">회원탈퇴</a></li>
										</ul>
									</dd>
								</dl>
							</li>
							<c:if test="${useMileage eq 'Y'}">
							<li class="li04">
								<dl>
									<dt>마일리지</dt>
									<dd>
										<ul>
											<li><a href="${pageContext.request.contextPath}/mypage/mileage/readList.do" data-href-target="${pageContext.request.contextPath}/mypage/coupon/readList.do">마일리지/쿠폰 현황</a></li>
											<li><a href="${pageContext.request.contextPath}/mypage/point/readList.do">마일리지샵 구매내역</a></li>
										</ul>
									</dd>
								</dl>
							</li>
							</c:if>
						</ul>
<script>
$(function() {
	if ($(".menuHighlight").length > 0) {
		var currentPath = "${requestScope['javax.servlet.forward.servlet_path']}".substr(0, "${requestScope['javax.servlet.forward.servlet_path']}".lastIndexOf("/"));
		if( currentPath != "/mypage/cart" ) {
			currentPath = "${requestScope['javax.servlet.forward.context_path']}${requestScope['javax.servlet.forward.servlet_path']}";
		} else {
			var url = "${requestScope['javax.servlet.forward.servlet_path']}";
			//장바구니 리스트 외 주문관련 파일일때 예외처리
			if(url != "/mypage/cart/readList.do") {
				currentPath = "${requestScope['javax.servlet.forward.context_path']}${requestScope['javax.servlet.forward.servlet_path']}";
				$("#menuNav").html("<span class='dot'>HOME</span> &gt; <span>마이페이지</span> &gt; <span>주문</span>");
			}
		}
		var $link = $(".menuHighlight").find("a");
		$link.each(function(idx, item) {
			$item = $(item);
			var hrefs = [$item.attr("href")];
			if ($item.attr("data-href-target")) hrefs.push($item.attr("data-href-target")); 
			$(hrefs).each(function(index, hrefsItem) {
				if (hrefsItem.indexOf(currentPath) > -1) {
					$item.parent().attr("class", "liOn");
					$item.parents(".menuHighlight > li").addClass("on");
					$("#menuNav").html("<span class='dot'>HOME</span> &gt; <span>마이페이지</span> &gt; <span>" + $item.text() + "</span>");
					return;
				}
			});
		});
	}
});
</script>