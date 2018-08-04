<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<spring:message var="useMileage" code="use.mileage"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="principal" property="principal" />
<!-- 2018 추가 -->
<div class="my_lnb">
	<h2 class="ml_tit"><span onclick="location.href='${pageContext.request.contextPath}/mypage/readList.do'" style="cursor:pointer;">마이페이지</span></h2>
	<div class="ml_box">
		<div class="ml_tit01"><span>쇼핑정보</span></div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/mypage/cart/readList.do"><span>장바구니</span></a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/order/readList.do" data-href-target="${pageContext.request.contextPath}/mypage/order/readOne.do"><span>주문/배송조회</span></a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/upOrder/readList.do" data-href-target="${pageContext.request.contextPath}/mypage/upOrder/readOne.do"><span>UP 주문 요청 조회</span></a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/cancel/readList.do" data-href-target="${pageContext.request.contextPath}/mypage/cancel/readOne.do"><span>취소/반품/환불</span></a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/wishlist/readList.do"><span>찜한 상품</span></a></li>
		</ul>
	</div>
	<div class="ml_box">
		<div class="ml_tit02"><span>회원정보</span></div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/mypage/mileage/readList.do"><span>마일리지내역</span></a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/point/readList.do"><span>포인트내역</span></a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/user/editUserForm.do" data-href-target="${pageContext.request.contextPath}/mypage/user/editUserInfoForm.do"><span>회원정보수정</span></a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/user/editPasswordForm.do"><span>비밀번호 변경</span></a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/user/editWithdrawForm.do" data-href-target="${pageContext.request.contextPath}/mypage/user/withdrawProc.do"><span>회원탈퇴</span></a></li>
		</ul>
	</div>
	<div class="ml_box">
		<div class="ml_tit03"><span>활동정보</span></div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/mypage/counsel/readList.do"><span>1:1문의</span></a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/qna/readList.do"><span>상품 Q&amp;A</span></a></li>
		</ul>
	</div>
</div>
<!-- //2018 추가 -->	




<!-- <script>
	
	$(function(){
		
		Handlebars.registerHelper('chkPointType', function(condition1, condition2, option) {
			  if(condition1){
				  if(condition1.toString() === condition2.toString()) {
				  	  return option.fn(this);
				  } else {
					  return option.inverse(this);  
				  }
			  }else{
				  return option.inverse(this); 
			  }
		});
		
		Handlebars.registerHelper('chkDate', function(condition1, condition2, option) {
			var transObj = (condition1 != condition2) ;
			if(transObj){
					return option.fn(this);
			}else {
				  return option.inverse(this);  
			}
		});
		
		Handlebars.registerHelper('fmtPoint', function(conditional, option) {
			return setComma(conditional);
		});
		
		/**
		마이페이지 알림 추가
		*/
		Handlebars.registerHelper('strtDate', function(conditional, option) {
			
			var toDate = new Date;
			var condition = new Date(conditional);
			var timespan = (toDate.getTime() - condition.getTime())/1000;
			var textDate = conditional.substring(0,10).replace(/-/gi, ".");
			
			if(timespan < 60){
				return "1분전";
			}else if(timespan < 3600 ){
				return Math.floor(timespan/60) + "분전";
			}else if(timespan < (3600*24)){
				return Math.floor(timespan/3600) + "시간전";
			}else{
				return textDate;
			}
		});
		
		Handlebars.registerHelper('notiLink', function(conditional, option) {
			
			var returnLink = "javascript:void(0);";
			
			if(conditional){
				switch (conditional) {
				  case "이벤트 응모"    : returnLink = "${pageContext.request.contextPath}/event/readList.do";
				                       break;
				  case "1:1문의"    : returnLink = "${pageContext.request.contextPath}/mypage/counsel/readList.do";
				                     break;
				  case "상품QNA"   : returnLink = "${pageContext.request.contextPath}/mypage/qna/readList.do";
				                    break;
				  case "이벤트 당첨결과" :  returnLink = "${pageContext.request.contextPath}/event/readList.do?eventType=2"; 
				  					   break;
				  default    : break;
				}               
			}
			
			return returnLink;
		});
			
		inviteFriendInfo();
		
		/**
		 * 친구초대 이벤트
		 */
		$(".invite").on('click', function(e){
			
			//토큰 가져오기
			$.ajax({
				url: "${pageContext.request.contextPath}/event/friend/getToken.do",
				type:"post",
				dataType : "json",
				data: {},
				success:function(data){
					var inviteUrl = "http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/security/signon/authentication/" + data.token+".do";
					$('#memberUrl').attr("href", inviteUrl);
					$('#tokenUrl').text(inviteUrl);
					$('#token').val(data.token);
					$('#userName').text(data.user_name);
					$('#inviteUrl').val(inviteUrl);
				},
				error:function(){
					alert('페이지를 불러오는 도중 오류가 발생했습니다.');
				}
			});
			
			var divTop = (e.pageY / 2) - $(this).attr('height') / 2 + document.body.scrollTop;
			var divLeft = (e.pageX / 2) - $(this).attr('width') / 2 + document.body.scrollLeft;
			
			$('#friend_invite').css({
			     "top" : divTop,
			     "left" : divLeft,
			     "position" : "absolute",
			     "border" : "double",
			     "background" : "#fff",
			     "padding" :"10px"
			}).show();
		});
		
		
		/**
		 * 친구초대 이벤트 닫기
		 */
		$('.close').click(function(){
			$('#friend_invite').hide();
		});
		
		/**
		 * 친구초대 이벤트 메일 보내기
		 */
		$(".send").on('click', function(e){
			
			//메일주소 체크
			addrCheck();
			
			$.ajax({
				url: "${pageContext.request.contextPath}/event/friend/send.do",
				type:"post",
				dataType : "json",
				data: $('#inviteFrm').serialize(),
				success:function(data){
					
					if(data.status == "complete") {
						alert("친구초대 메일이 발송되었습니다.");	
						document.location.reload();
					} else {
						alert("친구초대 메일 발송중 에러가 발생되었습니다.");	
					}
				},
				error:function(){
					alert("페이지를 불러오는 도중 오류가 발생했습니다.");
				}
			});
		});
		
		/**
		 * 주소복사
		 */
		$('.btnAddCopy').on('click', function(){
			var url = $('#memberUrl').attr('href');
			var IE = (document.all) ? true : false; 
			if (IE) { 
				window.clipboardData.setData('Text', url); 
				alert('주소가 복사되었습니다.'); 
			} else { 
				temp = prompt("Ctrl+C를 눌러 클립보드로 복사하세요", url ); 
			} 
			
		});
		
		$('#files').on('change', function (event) {
		   
			event.preventDefault();

			(function() {
				var options = {
					beforeSubmit : applyBefore,
					success      : applyAfter,  // ajaxSubmit 후처리 함수
			        dataType     : 'json'
				};

				function applyBefore(formData, jqForm, options) {
					return true;
				}
				
				function applyAfter(objResponse, statusText, xhr, $form) {
					
					if (statusText == "success") {
				        if (objResponse.strResult == "SUCCESS" ) {
				        	////console.log(objResponse);
				        	$('#uploadForm').find("img").attr("src", objResponse.files.entity.file_url);
							layerAlert("#layerMsg", "사진이 정상적으로 등록되었습니다.");
				        } else {
				        	////console.log(objResponse);
				        	layerAlert("#layerMsg", objResponse.files.entity.error);
				        }
				    } else {
				    	layerAlert("#layerMsg", "사진 등록을 실패했습니다. 계속해서 동일한 오류가 발생한다면 고객센터로 문의해주세요.");
				    }
				}
				
				$('#uploadForm').attr("action", "${pageContext.request.contextPath}/mypage/user/photo/change.do");
				$('#uploadForm').attr("target", "uploadIframe");
				$("#uploadForm").ajaxSubmit(options);
			}());
		});
		
		$('#removePhoto').on('click', function (event) {
		    
			event.preventDefault();

			(function() {
				var options = {
					beforeSubmit : applyBefore,
					success      : applyAfter,  // ajaxSubmit 후처리 함수
			        dataType     : 'json'
				};

				function applyBefore(formData, jqForm, options) {
					if ($('#uploadForm').find("img").attr("src") == '${pageContext.request.contextPath}/static/images/no_img.gif') { 
						layerAlert("#layerMsg", "삭제할 파일이 없습니다.");
						return false;
					}
					return true;
				}
				
				function applyAfter(objResponse, statusText, xhr, $form) {
					////console.log(objResponse);
					if (statusText == "success") {
				        if (objResponse.strResult == "SUCCESS" ) {				        	
				        	$('#uploadForm').find("img").attr("src", '${pageContext.request.contextPath}/static/images/no_img.gif');
				        	layerAlert("#layerMsg", "사진을 정상적으로 삭제했습니다.");
				        	$("#files").replaceWith( $("#files").clone(true) );
				        } else {
				        	layerAlert("#layerMsg", "사진을 삭제하는 중에 오류가 발생했습니다. 계속해서 동일한 오류가 발생한다면 고객센터로 문의해주세요.");
				        }
				    } else {
				    	layerAlert("#layerMsg", "사진을 삭제하는 중에 오류가 발생했습니다. 계속해서 동일한 오류가 발생한다면 고객센터로 문의해주세요.");
				    }
				}
				
				$('#uploadForm').attr("action", "${pageContext.request.contextPath}/mypage/user/photo/remove.do");
				$('#uploadForm').attr("target", "");
				$("#uploadForm").ajaxSubmit(options);
			}());
		});
		
		$("#uploadIframe").on("ready", function() {
			
			if ($("#uploadIframe").contents().find("html > body > pre").length > 0) {
				var obj = JSON.parse($("#uploadIframe").contents().find("html > body > pre").text());
				if (obj.files.entity.error) {
					layerAlert("#layerMsg", obj.files.entity.error);
				} else { 
					$('#uploadForm').find("img").attr("src", obj.files.entity.file_url);
					layerAlert("#layerMsg", "사진이 정상적으로 등록되었습니다.");
				}
			} else {
				layerAlert("#layerMsg", "사진 등록을 실패했습니다. 계속해서 동일한 오류가 발생한다면 고객센터로 문의해주세요.");
			}
		});
		
		
		<c:if test="${useMileage eq 'Y'}">
		$.ajax({
			url:'${pageContext.request.contextPath}/mypage/couponNotice.do',
			type:'post',
			dataType : "json",
			success:function(data){ 
				////console.log(data.list);
				if(data.totCnt > 0){
					$("#couponOrg").html(data.totCnt);
					couponSetting(data.list);
				}
			},
			error:function(e){
			 	////console.log(e);
			 	alert("보유쿠폰 조회중 오류가 발생하였습니다.");
			 	return false;
			}
		});
		
		function couponSetting(objData){
			var source   = $("#couponInfo").html();
			try {
				var template = Handlebars.compile(source);
			} catch (e) {}
			var context	= {
					list : objData
			};
			$('#couponTempDl').append(template(context));
			
		}
		
		</c:if>
		
		$.ajax({
			url:'${pageContext.request.contextPath}/mypage/healingLeafCnt.do',
			type:'post',
			dataType : "json",
			success:function(data){ 
				////console.log(data.list);
				if(data.healingLeafCnt > 0){
					$("#healingLeafCnt").html(setComma(data.healingLeafCnt)+"개");
				}else{
					$("#healingLeafCnt").html(0+"개");
				}
			},
			error:function(e){
			 	////console.log(e);
			 	alert("누적 힐링잎수 조회중 오류가 발생하였습니다.");
			 	return false;
			}
		});
		
		/**
		마이페이지 알림 추가
		*/
		$.ajax({
			url:'${pageContext.request.contextPath}/mypage/mypageNotice.do',
			type:'post',
			dataType : "json",
			success:function(data){ 
				if(data.totCnt > 0){	
					$("#noticeOrg").html(data.totCnt);
					noticeSetting(data.list);
				}else{
					//$("#noticeOrg").html(0);
					$("#noticeTempDl").find("dt").html("알림");
				}
			},
			
			error:function(e){
			 	alert("알림 조회중 오류가 발생하였습니다.");
			 	return false;
			}
		});
		
	});
	
	
	
	/**
	마이페이지 알림 추가
	*/
	function noticeSetting(objData){
		var source = $("#noticeInfo").html();
		////console.log(source);
		if(objData != null){
			try{
				var template = Handlebars.compile(source);
			}catch(e){}
			var context = {
					list : objData
			};
				$('#noticeTempDl').append(template(context));
		}
	}
	
	/**
	 * 메일주소체크
	 */
	function addrCheck() {
		var res = true;
		//초대메일 여러개일때
		if($('#toMailAddrList').val().indexOf(",") > 0){
			var mailAddr = $('#toMailAddrList').val().split(",");
			if(mailAddr.length>5){
				alert('초대메일은 최대 5명까지만 보내실수 있습니다.');
				res = false;
				return false;
			} 
		} 
		
		$.ajax({
			url: "${pageContext.request.contextPath}/event/friend/addrCheck.do",
			type:"post",
			dataType : "json",
			data: {"toMailAddrList": $('#toMailAddrList').val()},
			success:function(data){
				
				if(data.memberCnt > 0 ) {
					alert("수신 대상에서 " + data.memberCnt + "명이 이미 회원입니다.\n회원을 제외하고 발송하시겠습니까?");
					$('#toMailAddrList').val(data.addrList);
				}
			},
			error:function(){
				alert("페이지를 불러오는 도중 오류가 발생했습니다.");
			}
		});
	}
	
	function inviteFriendInfo(){
		$.ajax({
			url: "${pageContext.request.contextPath}/event/friend/friendInfo.do",
			type:"post",
			dataType : "json",
			data: {},
			success:function(data){
				var inviteFriendCnt = data.invite_friend_count;
				var joinFriendCnt = data.join_friend_count;
				var orderFriendCnt = data.order_friend_count;
				
				if(inviteFriendCnt == null ) {
					inviteFriendCnt = 0;
				}
				$('#inviteFriendCnt').text(inviteFriendCnt);
				
				if(joinFriendCnt == null ) {
					joinFriendCnt = 0;
				}
				$('#joinFriendCnt').text(joinFriendCnt);
				
				if(orderFriendCnt == null ) {
					orderFriendCnt = 0;
				}
				$('#orderFriendCnt').text(orderFriendCnt);
			}
		});
	}
</script> -->

