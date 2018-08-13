<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

   <meta content="IE=edge">
   <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
   <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
   <title>datacome</title>
   <script type="text/javascript">
      // default global variable
      var contextPath = "${pageContext.request.contextPath}";
      var locale = "${fn:substring(pageContext.response.locale, 0, 2)}";
   </script>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/nm-fonts.css">   <!-- 링크되어있음 -->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/animate.min.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.min.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/default.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style-responsive.min.css">
   
   <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/pace.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.9.1.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-migrate-1.1.0.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.cookie.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/iscroll.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/iscroll.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/iscroll.js"></script>
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   
	<style>
	
	.category-item.full{width: 100% !important;      } 
	.category-item.full .item{background:#79c7d4}
    .header-logo .logo{float: left; margin-right: 5px; width: 64px;}
    .header-logo .logo img{width: 100%;}
	@media screen and (max-width:640px){
      body .category-item.full .item .item-cover img{display: none;}
	}
	
    .header-logo .logo{float: left; margin-right: 5px; width: 64px;}
    .header-logo .logo img{width: 100%;}
    @media screen and (max-width:640px){
        .setMobile{display: block; position: relative; opacity: 1; overflow: visible;} 
            .setMobile.modal{display: block; position: relative; opacity: 1; overflow: visible;} 
            .promotion-btn.setMobile{display: none;}
            .setMobile.modal .modal-dialog{position: absolute; top: 0px;}
            .setMobile .modal-dialog{margin:0px;}
            .setMobile .modal-content{border: 0px;  box-shadow: inherit; border-radius: 0;}
            .setMobile .promotion-btn{margin: 10px 0px 0px 10px; }
            .carousel-caption .btn{padding: 10px;margin-top: 10px; font-size: 14px;}
            .setMobile .modal-header, .setMobile .modal-footer{display: none}
        }


        #media-768{display: none}
    </style>
    <script type="text/javascript">
    
		
		$(function(){
		
		
		
		    var windowWidth = $( window ).width();
		    if(windowWidth < 800) {
		        $('.setMobile').addClass( "aaa" )
		        $('.setMobile').removeClass( "modal fade" )
		
		        } else {
		        $('.setMobile').addClass( "bbb" )
		    }
		});
		
		function  fn_main_rem(_flg){
			var html = "";
			if(_flg == 0 ){
				$("#div_category_items").css("background-colr", "#79C7D4");
				
				html 	+= '<div class="item">';
				html	+= '<div class="item-cover">';
				html	+= '<img src="${pageContext.request.contextPath}/static/images/back/pc_error.jpg" alt="" />';
				html	+= '</div>';
				html	+= '<div class="item-info bottom">';
				html	+= '<h4 class="item-title">컴퓨터 고장 증상</h4>';
				html	+= '<p class="item-desc">1. 부팅시 엄청나게 컴퓨터가 느려집니다.</p>';
				html	+= '<p class="item-desc">2. 블루스크린이 뜨며 알수 없는 문자로 모니터에 표출됩니다.</p>';
				html	+= '<p class="item-desc">3. 부팅시 이상한 소리를 내며 컴퓨터가 켜지지 않습니다.</p>';
				html	+= '<a href="#" class="promotion-btn setMobile" data-toggle="modal" data-target="#myModal"><b>문의하기</b></a>  ';
				html	+= '</div>';
				html	+= '</div>';	
			}
			else if(_flg == 1){
				$("#div_category_items").css("background-colr", "#9BABBA");
				
				html 	+= '<div class="item">';
				html	+= '<div class="item-cover">';
				html	+= '<img src="${pageContext.request.contextPath}/static/images/back/rasome.jpg" alt="" />';
				html	+= '</div>';
				html	+= '<div class="item-info bottom">';
				html	+= '<h4 class="item-title">랜섬웨어 증상</h4>';
				html	+= '<p class="item-desc">1. 모든 키가 잠깁니다.</p>';
				html	+= '<p class="item-desc">2. 가상계좌에 입금을 요구합니다.</p>';
				html	+= '<p class="item-desc">3. 파일이 한개식 지워집니다..</p>';
				html	+= '<a href="#" class="promotion-btn setMobile" data-toggle="modal" data-target="#myModal"><b>문의하기</b></a>  ';
				html	+= '</div>';
				html	+= '</div>';	
			}
			else{
				$("#div_category_items").css("background-colr", "#F8F8F8");
			
				html 	+= '<div class="item">';
				html	+= '<div class="item-cover">';
				html	+= '<img src="${pageContext.request.contextPath}/static/images/back/server_erorr.jpg" alt="" />';
				html	+= '</div>';
				html	+= '<div class="item-info bottom">';
				html	+= '<h4 class="item-title">서버 고장 증상</h4>';
				html	+= '<p class="item-desc">1. 외부에서 해당 서버로 접속이 되지 않습니다.</p>';
				html	+= '<p class="item-desc">2. 외부에서 접속시 400~ 500 error를 나타냅니다.</p>';
				html	+= '<p class="item-desc">a3. 서버 자체의 부팅이 되지 않습니다.</p>';
				html	+= '<a href="#" class="promotion-btn setMobile" data-toggle="modal" data-target="#myModal"><b>문의하기</b></a>  ';
				html	+= '</div>';
				html	+= '</div>';		
			}
			
			$("#div_category_items").html(html);
		}
	
	    </script>