<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<spring:message var="useMileage" code="use.mileage"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" var="nowYy" pattern="yyyy" />
<jsp:scriptlet>
	pageContext.setAttribute("bLine", "\n");
</jsp:scriptlet>
	
<script type="text/javascript">


$(function() {
	
	// 장바구니
	$(".doCart").on("click", doCart);
	// 찜하기
	$(".doWishlist").on("click", doWishlist);
    // 주문 (온라인배송)
    $(".doOrderOnline").on("click", {dlv_type: "DELIVERY"}, doOrder);
	
	// 팝업공지
	publicPopup("main_popup_cookie", '10');
	
	// 실시간 리뷰
	if( '${fn:length(gdReviewList)}' == '4'){
		$("#reviewMore").on("click", reviewMore);
	}
	// 메인 시즌 아이템
	$(".mainTab > li >  a").click(function(){
		var idx = $(this).parent().index();
		$(".season_wrap > div").hide();
		$(".season_wrap > div").eq(idx).show();
	});
	
	// 시즌아이템 이미지 swap
	$(".prev").on("click", function() {
		var $this = $(this).parent().parent();
		var $tmpSwp = $this.find(".first").children().clone();
		var $mainSwp = $this.find(".main_item_ban").children().clone();
		$this.find(".first").empty();
		$this.find(".main_item_ban").empty();
		$mainSwp.appendTo($this.find(".first"));
		$tmpSwp.appendTo($this.find(".main_item_ban"));
		
		$this.find(".first .elm").toggleClass("bnhide");
		$this.find(".main_item_ban .elm").toggleClass("bnhide");
		
	})
	$(".next").on("click", function() {
		var $this = $(this).parent().parent();
		var $tmpSwp = $this.find(".last").clone();
		var $mainSwp = $this.find(".main_item_ban").clone();
		$this.find(".last").empty();
		$this.find(".main_item_ban").empty();
		$mainSwp.children().appendTo($this.find(".last"));
		$tmpSwp.children().appendTo($this.find(".main_item_ban"));
		$this.find(".last .elm").toggleClass("bnhide");
		$this.find(".main_item_ban .elm").toggleClass("bnhide");
	})
	

	$('.bxslider').bxSlider({
		mode:'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
		speed:700, //default:500 이미지변환 속도
		auto: true, //default:false 자동 시작
		pause: 5000,
		useCSS: false
	});
	
	/* 2018 추가 */
	//실시간 리뷰
	$('.realTime .bxsdr').bxSlider({
		mode:'horizontal',
		speed:700,
		auto: true,
		pause: 5000,
		useCSS: false,
		controls: false
	});
	/* //2018 추가 */

	
	//main real review close
	$('.main .btnClose').click(function(){
		var target = $(this).parent().parent().find(".realTime");
		$(window).scrollTop(getPos);
		target.animate({
			height : "0px"
		}, 500, function(){
			$('.main .btnClose').hide();
			$('.main .btnClose').parent().find(".btnMore").show();
			$('.main .btnClose').parent().removeClass("on");
			realtimeFlg = 0
			$("#reviewArea").children().remove();
			$("#reviewPageNumber").val("1");
			$("#reviewMore").click();
		});
		
		
		
	});
	
	
	<sec:authorize access="isAuthenticated()">
		//쿠폰 팝업
		<c:if test="${useMileage eq 'Y'}">
		$.ajax({
			url : contextPath+"/common/coupon/getCpnIdxList.do",
			type :"post",
			dataType : "json",
			data : {}, 
			success : function(data){
				
					if( data && data.list ) {
						
						for(var i in data.list) {
							var cpnIdx = data.list[i];
							var cpnPopCookieName = "main_coupon_pop_"+cpnIdx;
							var cpnPopCookie = getMyCookie(cpnPopCookieName);
							if( cpnPopCookie == null ) {
								var left = (50 + (parseInt(i)*5) )+ 'px';
								var top = (50 + (parseInt(i)*5) )+'px';
								var width = '715px';
								var height = '655px' ;
								window.open(contextPath+"/common/coupon/popup.do?couponIdx="+cpnIdx+"&cookieName="+cpnPopCookieName, "_blank", "left="+left+", top="+top+", width="+width+", height="+height+", scrollbars=yes");
							}
						}
					}
				
			},
			error:function(request,status,error){
			}
		});
		</c:if>
	</sec:authorize>

});


/**
 * 찜 담기
 */
function doWishlist(event) {
	var $this = $(event.currentTarget);
	
	$.ajax({
		url:'${pageContext.request.contextPath}/mypage/wishlist/add.json',
		type:'post',
		dataType : "json",
		data:{"wishlist[0].option_idx" : $this.data("option_idx"), "wishlist[0].gds_quantity":1},
		success:function(data){
			

			if(data.status=="ok") {
				var str = "찜하였습니다.";
				layerAlert("#layerMsg", str);

			}else if(data.status=="loginUserErr"){
				var str = "찜하기는 회원만 이용하실 수 있습니다.";
				layerAlert("#layerMsg", str);
				return false;
			}else if(data.status=="alreadyWishlist"){
				var str = "이미 찜한 상품입니다.";
				layerAlert("#layerMsg", str)
				return false;
			} else{
				alert("<spring:message code="common.edit.fail" />");
				return false;
			}
		},
		error:function(e){
			location.href="${pageContext.request.contextPath}/security/signinForm.do";
		 	return false;
		}
	});
}

/**
 * 주문
 */
function doOrder(event) {
    var dlv_type = event.data.dlv_type;
    var $this = $(event.currentTarget);
    var $option = $this;
    //var $quantity = $this.parents(".goodsList").find("#odgds_quantity");

    var goods_price = parseInt($option.data("option_price_num"));
    var goods_amount = 1;
    var option_min_inventory = parseInt($option.data("option_min_inventory"));
    var option_now_inventory = parseInt($option.data("option_now_inventory"));
    var option_invent_set = $option.data("option_invent_set");

    var total = goods_price*goods_amount;

    // 관리자 설정 검사
    if(option_invent_set != "") {
        layerAlert("#layerMsg", "재고부족으로 현재 구매가 불가합니다.");
        return;
    }

    // 품절처리
    if(option_min_inventory >= (option_now_inventory - goods_amount)) {
        layerAlert("#layerMsg", "재고부족으로 현재 구매가 불가합니다.");
        return;
    }

    $("#orderFrm input[name='dlv_type']").val($option.data("goods_shop_code"));
    $("#orderFrm input[name='goods_idx']").val($option.data("goods_idx"));
    $("#orderFrm input[name='orderCart[0].option_idx']").val($option.data("option_idx"));
    $("#orderFrm input[name='orderCart[0].odgds_quantity']").val(goods_amount);
    $("#orderFrm input[name='orderCart[0].odgds_goods_price']").val(parseInt($option.data("option_price_num")));
    $("#orderFrm input[name='orderCart[0].odgds_mileage']").val(parseInt($option.data("option_paypoint"))*goods_amount);
    $("#orderFrm input[name='orderCart[0].odgds_order_price']").val(parseInt($option.data("option_price_num"))*goods_amount);
    $("#orderFrm input[name='orderCart[0].odgds_leaf_amount']").val($option.data("option_leaf_amount"));
    $("#orderFrm input[name='goods_shop_code']").val($option.data("goods_shop_code"));
    $("#orderFrm").attr("action","${pageContext.request.contextPath}/mypage/cart/readOrderList.do");
    $("#orderFrm").submit();
}

/**
 * 장바구니 담기
 */
function doCart(event) {
	
	var $this = $(event.currentTarget);
	
	$.ajax({
		url:'${pageContext.request.contextPath}/mypage/cart/add.json',
		type:'post',
		dataType : "json",
		data:{
			"cart\[0\].option_idx": $this.data("option_idx"),
			"cart\[0\].gds_quantity": 1,
		},
		success:function(data){

			if(data.status=="ok") {
				var str = "장바구니에 상품이 추가되었습니다.";
				layerCartConfirm("#layerMsg", "장바구니에 상품이 추가되었습니다.", 'location.href="${pageContext.request.contextPath}/mypage/cart/readList.do"');

			}else if(data.status=="loginUserErr"){
				var str = "장바구니는 회원만 이용하실 수 있습니다.";
				layerAlert("#layerMsg", str);
				return false;
			}else if(data.status=="alreadyCart"){
				var str = "이미 장바구니에 담겨있는 상품입니다.";
				layerAlert("#layerMsg", str);
				return false;
			} else{
				alert("<spring:message code="common.edit.fail" />");
				return false;
			}
		},
		error:function(e){
			location.href="${pageContext.request.contextPath}/security/signinForm.do";
		 	return false;
		}
	});
}

/**
 * 상품후기 리스트(24개만 노출)
 */
var realtimeFlg = 1;
var maxFlg = 6; 
var getPos = 0;
function reviewMore(event) {
	var obj = $(".main .btnMore");
	if( '${fn:length(gdReviewList)}' == '4'){
		var target = obj.parent().parent().find(".realTime");
		$.ajax({
			url: "${pageContext.request.contextPath}/main/gdReviewList.do",
			type:"get",
			data: {pageNumber: $("#reviewPageNumber").val()},
			success:function(data){
				var liLen = $(data).find("#pageContent").attr("data-length");
				$("#reviewPageNumber").val(parseInt($(data).find("#pageNumber").val())+1);
				if(liLen > 0){
					
					if(realtimeFlg == (maxFlg - 1)){
						realtimeFlg = 0;
						target.animate({
							height : "+=400px"
						}, 500);
						
						obj.parent().find(".btnClose").show();
						obj.parent().addClass("on");
						obj.hide();
						
					}
					else if(realtimeFlg < (maxFlg - 1) ){
						target.animate({
							height : "+=400px"
						}, 500);
					}
					if(realtimeFlg == 1){
						
						getPos = $(window).scrollTop();
					}
					realtimeFlg++;
					$(data).find("#pageContent").children().appendTo($("#reviewArea"));
					
					if(liLen < 4){
						obj.parent().find(".btnClose").show();
						obj.parent().addClass("on");
						obj.hide();
					}
				}
				
				
			},
			error:function(){
	
			}
		});
	}
}

</script>
<style>
.bnhide {display:none;}
</style>
			<h2 class="blind">컨텐츠 부분</h2>
			<div class="content">
				<form id="orderFrm" name="orderFrm" method="post">
					<input type="hidden" id="goods_idx" name="goods_idx" value=""/>
					<input type="hidden" id="option_paypoint" name="option_paypoint" value=""/>
					<input type="hidden" id="option_price_num" name="option_price_num" value=""/>
					<input type="hidden" name="order_gubun" value="2"/>
					<input type="hidden" name="order_shop_type" value="ONLINE"/>
					<input type="hidden" name="dlv_type" value=""/>
					<input type="hidden" name="order_step" value="order"/>
					<input type="hidden" name="goods_shop_code" value=""/>
					<input type="hidden" name="orderCart[0].odgds_goods_price" value=""/>
					<input type="hidden" name="orderCart[0].odgds_mileage" value=""/>
					<input type="hidden" name="orderCart[0].odgds_order_price" value=""/>
					<input type="hidden" name="orderCart[0].odgds_leaf_amount" value=""/>
					<input type="hidden" name="orderCart[0].option_idx" value=""/>
					<input type="hidden" name="orderCart[0].odgds_quantity" value=""/>

				</form>
				<div class="section">
					<div class="visual">
						<ul class="bxslider">
							<c:choose>
							<c:when test="${not empty bannerList}">
								<c:forEach items="${bannerList}" var="list" varStatus="status">
									<c:if test="${list.entity.banner_type eq 'CENTER' }">
										<li><a href="${list.entity.banner_url }"><img src="${list.entity.banner_img_url }" alt=""  class="curvedImg" /></a></li>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
							<li>등록된 배너가 없습니다.</li>
							</c:otherwise>
							</c:choose>
						</ul>
					</div><!-- //visual -->
				</div><!-- //section -->

				<!-- 2018 추가 -->
				<div class="upMbr">
					<sec:authorize access="isAnonymous()">
						<!-- 전체 회원 로그인, 로그아웃 -->
						<div class="upMbr_area01">
							<span class="tit">UNIVERA PLANNER와의 행복한 만남</span>
							<span class="txt">UP 지정회원으로 가입하면 마일리지 적립 혜택을 드립니다.</span>
							<a href="${pageContext.request.contextPath}/security/signon/readCert.do" class="upMbr_btn"><span>회원가입</span></a>
						</div>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<sec:authentication var="user" property="principal" />
						<c:choose>
							<c:when test="${user.users.user_up_yn ne 'Y'}">
								<!-- 전체 회원 로그인, 로그아웃 -->
								<div class="upMbr_area01">
									<span class="tit">UNIVERA PLANNER와의 행복한 만남</span>
									<span class="txt">UP 지정회원으로 가입하면 마일리지 적립 혜택을 드립니다.</span>
									<a href="${pageContext.request.contextPath}/utilities/readMembership.do" class="upMbr_btn"><span>UP지정회원으로 전환하기</span></a>
								</div>
							</c:when>
							<c:otherwise>
								<!-- up 회원 로그인 -->
								<div class="upMbr_area02">
									<div class="tit_box">
										<ul class="txt_list">
											<li><strong>담당 대리점</strong> : ${user.users.agent.agent_name} (${user.users.agent.agent_phone})</li>
											<li class="up_adr"><strong>대리점 주소</strong> : ${user.users.agent.agent_base_addr} ${user.users.agent.agent_detail_addr}</li>
											<li><strong>담당 UP</strong> : ${user.users.up.up_name}</li>
											<li><strong>연락처</strong> : ${user.users.up.up_phone} </li>
										</ul>
										<div class="link_img">
											<c:choose>
												<c:when test="${not empty eventList}">
													<c:forEach items="${eventList}" var="list" varStatus="status">
														<c:if test="${status.index eq 0}">
															<a href="${pageContext.request.contextPath}/agentEvent/readOne.do?eventIdx=${list.event_idx}&agentIdx=${list.agent_idx}" ><img src="${list.event_img_fileid_web_url}" alt="대리점 프로모션" /></a>
														</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<a href="#"><img src="${pageContext.request.contextPath}/static/images/common/w_no_event.png" alt="현재 진행 중인 대리점 이벤트가 없습니다." /></a>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<button type="button" class="umAcd_btn"><span></span></button>
									<div class="con_box">
										<div class="tit">
											<span class="txt01">대리점 이벤트</span>
											<span class="txt02">UP 지정 회원님께 드리는 대리점의 특별한 혜택</span>
										</div>
										<div class="link_img">
											<c:choose>
												<c:when test="${not empty eventList}">
													<c:forEach items="${eventList}" var="list" varStatus="status">
														<c:choose>
															<c:when test="${status.index eq 0}">
																<a href="${pageContext.request.contextPath}/agentEvent/readOne.do?eventIdx=${list.event_idx}&agentIdx=${list.agent_idx}" class="left"><img src="${list.event_img_fileid_web_url}" alt="대리점 프로모션" /></a>
															</c:when>
															<c:otherwise>
																<a href="${pageContext.request.contextPath}/agentEvent/readOne.do?eventIdx=${list.event_idx}&agentIdx=${list.agent_idx}" class="right"><img src="${list.event_img_fileid_web_url}" alt="대리점 프로모션" /></a>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<a href="#" class="one"><img src="${pageContext.request.contextPath}/static/images/common/w_no_event02.png" alt="현재 진행 중인 대리점 이벤트가 없습니다." /></a>
												</c:otherwise>
											</c:choose>

											<!-- <a href="#" class="one"><img src="${pageContext.request.contextPath}/static/images/common/w_no_event02.png"" alt="현재 진행 중인 대리점 이벤트가 없습니다." /></a> -->
										</div>
										<a href="${pageContext.request.contextPath}/agentEvent/readList.do" class="upMbr_more"><span>더보기</span></a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</sec:authorize>
				</div>
				<!-- //2018 추가 -->

				<div class="tab_wrap rec_item">
					<div class="mh_box">
						<div class="left">
							<h3 class="m_h3">추천 아이템</h3>
							<div class="item_tit">
								<span class="tab_tit on"><button type="button" class="tab_btn">화장품</button></span>
								<span class="tab_tit"><button type="button" class="tab_btn">건강기능식품</button></span>
							</div>
						</div>
					</div>
					<div class="tab_con on">
						<ul>
						<c:choose>
							<c:when test="${not empty bannerList}">
								<c:forEach items="${bannerList}" var="list" varStatus="status">
									<c:if test="${list.entity.banner_type eq 'SEASONCOSMETICS' }">
										<li><a href="${list.entity.banner_url}"><img src="${list.entity.banner_img_url }" alt="" class="curvedImg" /></a></li>
									</c:if>
								</c:forEach>
							</c:when>
						</c:choose>
						</ul>
					</div>
					<div class="tab_con">
						<ul>
							<c:choose>
								<c:when test="${not empty bannerList}">
									<c:forEach items="${bannerList}" var="list" varStatus="status">
										<c:if test="${list.entity.banner_type eq 'SEASONHEALTH' }">
											<li><a href="${list.entity.banner_url}"><img src="${list.entity.banner_img_url }" alt=""  class="curvedImg" /></a></li>
										</c:if>
									</c:forEach>
								</c:when>
							</c:choose>
						</ul>
					</div>
				</div>

				<!-- 인기 아이템 -->
				<div class="int_item">
					<h3 class="m_h3">인기 화장품</h3>
					<ul class="prdList main">
						<c:choose>
						<c:when test="${not empty bannerList}">
						<c:forEach items="${bannerList}" var="list" varStatus="status">
						<c:if test="${list.entity.banner_type eq 'FASHIONCOSMETICS' }">
						<li>
							<span class="icon">
								<c:forEach items="${list.entity.goods.goodsIconList}" var="goodsIconList" varStatus="status">
									<c:if test="${not empty goodsIconList.icon.icon_fileUrl }">
										<img src="${goodsIconList.icon.icon_fileUrl }" alt="${goodsIconList.icon.icon_name } " title="${goodsIconList.icon.icon_name } ">
									</c:if>
								</c:forEach>
								<c:if test="${list.entity.goods.goods_shop_code eq 'COMMUNITY' }">
									<c:choose>
										<c:when test="${userInfo != null && (userInfo.user_up_yn eq 'N' || userInfo.user_up_yn eq null) }">
										</c:when>
										<c:when test="${userInfo == null }">
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</c:if>
							</span>
							<img src="${list.entity.goods.goods_img_fileurl}" alt="" />
							<p class="prdCon mainConcon">
								<strong>${fn:replace(list.entity.goods.goods_ko_name, bLine, '<br/>')}</strong>
								${list.entity.goods.goods_desc1}
							</p>
							<div class="over review"><!-- 더블클래스 reivew가 있을때 제품후기 아이콘 나옴 -->
								<a href="${pageContext.request.contextPath }/goods/readOne.do?goods_idx=${list.entity.goods.goods_idx}" class="img_link"><span class="blind">상품상세</span></a>
								<div>
									<a href="#" data-option_idx="${list.entity.goods.goodsOptionList[0].option_idx }" class="bgyel doWishlist">찜하기</a>
									<a href="#" data-option_idx="${list.entity.goods.goodsOptionList[0].option_idx }" class="bgwhite doCart">장바구니</a>
									<c:choose>
										<c:when test="${fn:length(list.entity.goods.goodsOptionList) <= 1}">
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath }/goods/readOne.do?goods_idx=${list.entity.goods.goods_idx}"  class="bgwhite">구매하기</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</li>
						</c:if>
						</c:forEach>
						</c:when>
						<c:otherwise>
						<li>
							<p class="prdCon">
								등록된 배너가 없습니다.
							</p>
						</li>
						</c:otherwise>
						</c:choose>
					</ul>
				</div><!-- //section -->

				<div class="int_item">
					<h3 class="m_h3">인기 건강기능식품</h3>
					<ul class="prdList main">
						<c:choose>
						<c:when test="${not empty bannerList}">
						<c:forEach items="${bannerList}" var="list" varStatus="status">
						<c:if test="${list.entity.banner_type eq 'FASHIONHEALTH' }">
						<li>
							<span class="icon">
								<c:forEach items="${list.entity.goods.goodsIconList}" var="goodsIconList" varStatus="status">
									<c:if test="${not empty goodsIconList.icon.icon_fileUrl }">
										<img src="${goodsIconList.icon.icon_fileUrl }" alt="${goodsIconList.icon.icon_name }" title="${goodsIconList.icon.icon_name }">
									</c:if>
								</c:forEach>
								<c:if test="${list.entity.goods.goods_shop_code eq 'COMMUNITY' }">
									<c:choose>
										<c:when test="${userInfo != null && (userInfo.user_up_yn eq 'N' || userInfo.user_up_yn eq null) }">
										</c:when>
										<c:when test="${userInfo == null }">
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</c:if>
							</span>
							<img src="${list.entity.goods.goods_img_fileurl}" alt="" />
							<p class="prdCon mainConcon">
								<strong>${fn:replace(list.entity.goods.goods_ko_name, bLine, '<br/>')}</strong>
								${list.entity.goods.goods_desc1}
							</p>
							<div class="over review"><!-- 더블클래스 reivew가 있을때 제품후기 아이콘 나옴 -->
								<a href="${pageContext.request.contextPath }/goods/readOne.do?goods_idx=${list.entity.goods.goods_idx}" class="img_link"><span class="blind">상품상세</span></a>
								<div>
									<a href="#" data-option_idx="${list.entity.goods.goodsOptionList[0].option_idx }" class="bgyel doWishlist">찜하기</a>
									<a href="#" data-option_idx="${list.entity.goods.goodsOptionList[0].option_idx }" class="bgwhite doCart">장바구니</a>
									<c:choose>
										<c:when test="${fn:length(list.entity.goods.goodsOptionList) <= 1}">
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath }/goods/readOne.do?goods_idx=${list.entity.goods.goods_idx}"  class="bgwhite">구매하기</a>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
						</li>
						</c:if>
						</c:forEach>
						</c:when>
						<c:otherwise>
						<li>
							<p class="prdCon">
								등록된 배너가 없습니다.
							</p>
						</li>
						</c:otherwise>
						</c:choose>
					</ul>
				</div><!-- //section -->

				<div class="sr_area">
					<!-- 유니베라 SNS 바로가기 -->
					<div class="sns_box">
						<h3 class="m_h3">유니베라 SNS 바로가기</h3>
						<ul>
							<li><a href="https://www.facebook.com/univerakorea" target="_blank"><img src="${pageContext.request.contextPath}/static/images/common/w_ico_facebook03.png" alt="페이스북" /></a></li>
							<li><a href="http://blog.naver.com/univera_kr" target="_blank"><img src="${pageContext.request.contextPath}/static/images/common/w_ico_naverblog03.png" alt="네이버 블로그" /></a></li>
							<li><a href="https://story.kakao.com/ch/univerakorea" target="_blank"><img src="${pageContext.request.contextPath}/static/images/common/w_ico_kakaostory03.png" alt="카카오스토리" /></a></li>
							<li><a href="https://www.instagram.com/univera_korea/" target="_blank"><img src="${pageContext.request.contextPath}/static/images/common/w_ico_instagram03.png" alt="인스타그램" /></a></li>
						</ul>
					</div>

					<!-- 실시간 리뷰 -->
					<div class="review_box">
						<h3 class="m_h3">실시간 리뷰</h3>
						<div class="realTime">
							<ul id="reviewArea" class="bxsdr">

							<c:choose>
								<c:when test="${not empty gdReviewList}">
									<c:forEach items="${gdReviewList}" var="list" varStatus="status">
										<li>
											<div class="user_pres_area">
												<c:choose>
													<c:when test="${not empty list.entity.rvw_img_url}">
														<a href="${pageContext.request.contextPath }/goods/readOne.do?goods_idx=${list.entity.goods_idx}#reviewT">
															<img src="${list.entity.rvw_img_url}" alt="" />
														</a>
													</c:when>
													<c:otherwise>
														<a href="${pageContext.request.contextPath }/goods/readOne.do?goods_idx=${list.entity.goods_idx}#reviewT">
															<img src="${pageContext.request.contextPath }/static/images/temp/img_blog1.jpg" alt="" />
														</a>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="user">
												<div class="user_phot_inf">
													<div class="user_phot">
														<c:choose>
															<c:when test="${not empty list.entity.user_img_url}">
																<img src="${list.entity.user_img_url}" alt="회원사진" />
															</c:when>
															<c:otherwise>
																<img src="${pageContext.request.contextPath }/static/images/common/profile_no image.jpg" alt="회원사진" />
															</c:otherwise>
														</c:choose>

													</div>
													<div class="user_inf_t">
														<span class="userId"><c:out value="${fn:substring(list.entity.create_user, 0, 3)}****"/></span>
														<div class="healingLeap">
															<ul>
																<c:forEach begin="1" end="${list.entity.rvw_grade}" step="1" var="cnt" varStatus="status">
																	<li class="on">힐링잎</li>
																</c:forEach>
																<c:forEach begin="${list.entity.rvw_grade}" end="4" step="1" var="cnt" varStatus="status">
																	<li>힐링잎</li>
																</c:forEach>
															</ul>
														</div>
													</div>
												</div>
												<p class="prdName"><a href="${pageContext.request.contextPath }/goods/readOne.do?goods_idx=${list.entity.goods_idx}"><c:out value="${list.entity.goods_ko_name }"/></a></p>
											</div>
										</li>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<li>
											<p class="prdCon">
												등록된 리뷰가 없습니다.
											</p>
										</li>
									</c:otherwise>
								</c:choose>

							</ul>
						</div>
						<c:if test="${not empty gdReviewList}">
							<a href="${pageContext.request.contextPath }/review/readList.do" class="review_more"><span>더보기</span></a>
						</c:if>
					</div>
				</div>
				<!-- //2018 추가 -->


				<div class="section mainFooter">
					<div class="mainNotice">
						<p class="tit">공지사항</p>
						<ul>
							<c:choose>
							<c:when test="${not empty noticeList}">
							<c:forEach items="${noticeList}" var="list" varStatus="status">
							<fmt:parseNumber value="${(now.time - list.entity.create_date.time) / (1000*60*60*24) }" integerOnly="true" var='dataDiff'/>
							<li><b>·</b>  
								<a href="${pageContext.request.contextPath }/cs/notice/readOne.do?ntc_idx=${list.entity.ntc_idx}" class="${(dataDiff<=30) ? 'new':''}" style="${list.entity.ntc_notice_yn eq 'Y' ? 'font-weight:bold':''}">
									${list.entity.ntc_subject}
								</a>
							</li>
							</c:forEach>
							</c:when>
							<c:otherwise>
							<li><a href="#" class="new">데이터가 존재하지 않습니다.</a></li>
							</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<div class="mainHealleaf">
						<p class="tit">힐링잎의 기적 현황</p>
						<c:set value="0" var="child_cnt"></c:set>
						<c:set value="0" var="heal_cnt"></c:set>
						<c:forEach items="${healHistoryList }" var="list">
								<c:set var="child_cnt" value="${list.entity.child_cnt}"/>
								<c:set var="heal_cnt" value="${list.entity.heal_cnt}"/>
						</c:forEach>
						<div class="vitaminDelivery">
							${nowYy }년 현재<br />비타민이 전달된 아동수<br />
							<strong><fmt:formatNumber value="${child_cnt }" /></strong>명
						</div>
						<div class="totalSum">
							총 누적수<br />
							<strong><fmt:formatNumber value="${heal_cnt }" /></strong>명
						</div>
					</div>
					<div class="mainServeFirst">
						<p class="tit">서브퍼스트 팔찌</p>
						<ul class="bxslider">
							<c:choose>
							<c:when test="${not empty bannerList}">
							<c:forEach items="${bannerList}" var="list" varStatus="status">
							<c:if test="${list.entity.banner_type eq 'CSRROLL' }">
							<li><a href="${list.entity.banner_url }"><img src="${list.entity.banner_img_url }" alt="" /></a></li>
							</c:if>
							</c:forEach>
							</c:when>
							<c:otherwise>
							<li><a href="#">데이터가 존재하지 않습니다.</a></li>
							</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div><!-- //section -->
			</div><!-- //content -->
			<button class="btn btn-toggle" data-toggle="modal" data-target="#myModal">Show / Hide<button>

			<div class="modal fade" id="myModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header"></div>
			      <div class="modal-body">
			        Hello! Webisfree.com
			      </div>
			      <div class="modal-footer"></div>
			    </div>
			  </div>
			</div>
			<c:if test="${not empty error}">
			<script>
			$(function () {
				alert("${error}");
			});
			</script>
			</c:if>
			<c:if test="${not empty removeSuccess}">
			<script>
			$(function () {
				alert("탈퇴하였습니다.");
			});
			</script>
			</c:if>