<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" >
$(function(){

	$(".quick_del").on("click", removeRecentGoods);
});


function sessionTimer(){
	alert("시스템 미사용으로 인한 자동로그아웃되었습니다.");
	location.href='${pageContext.request.contextPath}/logout.do';
}
/**
 * 최근 상품 삭제
 */
function removeRecentGoods(event) {
	var idx = $(this).data("goods_idx");
	var url = $(this).data("goods_url");
	var $obj = $(this).parent();
	var $area = $obj.parent();
//	
	$.ajax({
		url: "${pageContext.request.contextPath}/goods/removeRecentGoods.do",
		type:"post",
		dataType : "json",
		data: {goods_idx: idx, goods_img_fileurl: url},
		success:function(data){
			$obj.remove();
			if($.trim($area.html())=="") {
				$(".quick_prev").remove();
				$(".quick_next").remove();
			}
			initQuickList();
		},
		error:function(){
			
		}
	});
}

/**
 * 이미지 바뀐 최근 상품 삭제
 */
function removeCC(obj){
	//$(obj).parent().parent().find(".quick_del").click();
}

function goSample(){
	location.href="${pageContext.request.contextPath}/event/sampleRequest.do";
}
</script>

	<!-- 2018 수정 -->
	<!-- quickbar -->
	<div class="quick_bar tp02">
		<ul>
			<li ><a href="#" onclick="goSample(); return false;">샘플신청</a></li>
			<sec:authorize access="isAuthenticated()">
				<li><a href="${pageContext.request.contextPath}/cs/counsel/readList.do">1:1문의</a></li>
			</sec:authorize>
			<li><a href="${pageContext.request.contextPath }/utilities/readInformation.do" class="menuIdInfomation">이용안내</a></li>
			<li ><a href="${pageContext.request.contextPath}/cs/agent/readMasterList.do">대리점찾기</a></li>

			<sec:authorize access="isAuthenticated()">
				<sec:authentication var="user" property="principal" />
				<c:if test="${user.users.user_up_yn eq 'Y'}">
					<li class="q_s_agentEvent"><a href="${pageContext.request.contextPath}/agentEvent/readList.do">대리점 이벤트</a></li>
				</c:if>
			</sec:authorize>

			<li class="q_s_late divi">
				<span class="tit">최근본상품</span>
				<ul>
					<c:set var="goods_idxs" value="${fn:split(cookie.goods_idxs.value, '|')}" />
					<c:set var="goods_urls" value="${fn:split(cookie.goods_urls.value, '|')}" />
					<c:set var="idxLength" value="${fn:length(goods_idxs)}" />
					<c:forEach var="idx" begin="0" end="${idxLength-1}" step="1" varStatus="status">
						<c:if test="${not empty goods_idxs[idxLength - idx -1] }">
							<c:if test="${goods_idxs[idxLength - idx -1] ne 'null'}">
								<c:if test="${status.index % 2 eq 0}">
									<li >
								</c:if>
									<div class="qb_link">
										<a href="${pageContext.request.contextPath}/goods/readOne.do?goods_idx=${goods_idxs[idxLength - idx -1]}">
											<img src="${goods_urls[idxLength - idx -1] }" alt="" onerror="removeCC(this)"/>
										</a>
										<a class="quick_del" href="#" title="삭제" data-goods_idx="${goods_idxs[idxLength - idx -1]}" data-goods_url="${goods_urls[idxLength - idx -1] }" >
											<img src="${pageContext.request.contextPath}/static/images/common/icn_btn_x.png" alt=""/>
										</a>
									</div>
								<c:if test="${status.index % 2 eq 1}">
									</li >
								</c:if>
								<c:if test="${status.index % 2 eq 0 and (status.index+1) eq idxLength}">
									</li >
								</c:if>
							</c:if>
						</c:if>
					</c:forEach>
				</ul>
				<div class="pg_num">
					<span class="now">0</span>
					<span>/</span>
					<span class="total">0</span>
				</div>
				<a href="#" class="quick_prev" title="이전"></a>
				<a href="#" class="quick_next" title="다음"></a>
			</li>
		</ul>
		<div class="go_top_wrap">
			<a href="#top" class="go_top">TOP</a>
		</div>
	</div>
	<!-- //quickbar -->
	<!-- //2018 수정 -->
