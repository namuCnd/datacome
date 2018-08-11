<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="ko">
<!--<![endif]-->
<head>
	<meta charset="utf-8"/>
	<title>E-Commerce Front End Theme</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/pace.min.js"></script>
	<!-- ================== END BASE JS ================== -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c35a103954fbcf2deaa6e2721ede1c17"></script>
</head>
<body>
    <!-- BEGIN #page-container -->
    <div id="page-container" class="fade">
    	<!-- BEGIN #header -->
        <div id="header" class="header">
            <!-- BEGIN container -->
            <div class="container">
                <!-- BEGIN header-container -->
                <div class="header-container">
                    <!-- BEGIN navbar-header -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <div class="header-logo">
                            <a href="index.html">
                                <span class="brand"></span>
                                <span>Data</span>Come
                                <small>The Pride of Recover</small>
                            </a>
                        </div>
                    </div>
                    <!-- END navbar-header -->
                    <!-- BEGIN header-nav -->
                    <div class="header-nav">
                        <div class=" collapse navbar-collapse" id="navbar-collapse">
                            <ul class="nav">
                                <li class="active">
                                    <a href="#" ><b>회사소개</b> </a>
                                </li>
                                <li class="dropdown dropdown-hover">
                                    <a href="#" >복구 솔루션</a>
                                </li>
                                <li class="dropdown dropdown-hover">
                                    <a href="#" >심각한 증상</a>
                                </li>
                                <li class="dropdown dropdown-hover">
                                    <a href="#" >문의하기</a>
                                </li>
                                <li class="dropdown dropdown-hover">
                                    <a href="#" >회사 위치</a>
                                </li>
                                <li class="dropdown dropdown-hover">
                                    <a href="#" >게시판(관리자)</a>
                                </li>                                
                            </ul>
                        </div>
                    </div>
                    <!-- END header-nav -->
                    <!-- BEGIN header-nav -->
                    <div class="header-nav">
                        <ul class="nav pull-right">
                            <li>
                                <a href="my_account.html">
                                    <img src="assets/img/user-1.jpg" class="user-img" alt="" /> 
                                    <span class="hidden-md hidden-sm hidden-xs">Login</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- END header-nav -->
                </div>
                <!-- END header-container -->
            </div>
            <!-- END container -->
        </div>
        <!-- END #header -->
    
        <!-- BEGIN #slider -->
        <div id="slider" class="section-container p-0 bg-black-darker">
            <!-- BEGIN carousel -->
            <div id="main-carousel" class="carousel slide" data-ride="carousel">
                <!-- BEGIN carousel-inner -->
                <div class="carousel-inner"> 
                    <!-- BEGIN item -->
                    <div class="item active">
                        <img src="${pageContext.request.contextPath}/static/images/cover/cloud2.jpg" class="bg-cover-img" alt="" />
                        <div class="container">
                            <img src="assets/img/slider-1-product.png" class="product-img right bottom fadeInRight animated" alt="" />
                        </div>
                        <div class="carousel-caption carousel-caption-left">
                            <div class="container">
                                <h3 class="title m-b-5 fadeInLeftBig animated">iMac</h3> 
                                <p class="m-b-15 fadeInLeftBig animated">Retina. Now in colossal and ginormous.</p>
                                <div class="price m-b-30 fadeInLeftBig animated"><small>from</small> <span>$649.00</span></div>
                                <a href="#" class="btn btn-outline btn-lg fadeInLeftBig animated">전화 문의</a>
                                <a href="#" class="btn btn-outline btn-lg fadeInLeftBig animated">온라인 문의</a>
                                <a href="#" class="btn btn-outline btn-lg fadeInLeftBig animated">카카오톡</a>
                            </div>
                        </div>
                    </div>
                    <!-- END item -->
                    <!-- BEGIN item -->
                    
                    <div class="item">
                        <img src="assets/img/slider-2-cover.jpg" class="bg-cover-img" alt="" />
                        <div class="container">
                            <img src="${pageContext.request.contextPath}/static/images/cover/cloud3.jpg" class="product-img left bottom fadeInLeft animated" alt="" />
                        </div>
                        <div class="carousel-caption carousel-caption-right">
                            <div class="container">
                                <h3 class="title m-b-5 fadeInRightBig animated">iPhone 6s</h3> 
                                <p class="m-b-15 fadeInRightBig animated">The only thing that’s changed is everything</p>
                                <div class="price m-b-30 fadeInRightBig animated"><small>from</small> <span>$1,299.00</span></div>
                                <a href="#" class="btn btn-outline btn-lg fadeInRightBig animated">Buy Now</a>
                            </div>
                        </div>
                    </div>
                    <!-- END item -->
                    <!-- BEGIN item -->
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/static/images/cover/cover.jpg" class="bg-cover-img" alt="" />
                        <div class="carousel-caption">
                            <div class="container">
                                <h3 class="title m-b-5 fadeInDownBig animated">Macbook Air</h3> 
                                <p class="m-b-15 fadeInDownBig animated">Thin.Light.Powerful.<br />And ready for anything</p>
                                <div class="price fadeInDownBig animated"><small>from</small> <span>$999.00</span></div>
                                <a href="#" class="btn btn-outline btn-lg fadeInUpBig animated">Buy Now</a>
                            </div>
                        </div>
                    </div>
                    <!-- END item -->
                </div>
                <!-- END carousel-inner -->
                <!-- 1920 * 1080 width 40 height 60 top 50% -->
                <a class="left carousel-control" style="width:40px; height: 50px; top: 50%;" href="#main-carousel" data-slide="prev"> 
                    <i class="fa fa-angle-left" style="margin-top: -5px;"></i> 
                </a>
                <a class="right carousel-control" style="width:40px; height: 50px; top: 50%;"href="#main-carousel" data-slide="next"> 
                    <i class="fa fa-angle-right" style="margin-top: -5px;"></i> 
                </a>
            </div>
            <!-- END carousel -->
        </div>
        <!-- END #slider -->
    
        <!-- BEGIN #promotions -->
        <div id="promotions" class="section-container bg-white">
            <!-- BEGIN container -->
            <div class="container">
                <!-- BEGIN section-title -->
                <h4 class="section-title clearfix">
                    <!--  <a href="#" class="pull-right">SHOW ALL</a>-->
				복구 솔루션
                    <small>데이터컴은 고객의 신뢰를 위해 최선을 다하는 복구업체입니다.</small>
                </h4>
                <!-- END section-title -->
                <!-- BEGIN row -->
                <div class="row row-space-10">
                    <!-- BEGIN col-6 -->
                    <div class="col-md-6">
                        <!-- BEGIN promotion -->
                        <div class="promotion promotion-lg bg-black-darker">
                            <div class="promotion-image text-right promotion-image-overflow-bottom">
                                <img src="assets/img/iphone-se.png" alt="" />
                            </div>
                            <div class="promotion-caption promotion-caption-inverse">
                                <h4 class="promotion-title">랜섬웨어 복구</h4>
                                <div class="promotion-price"></div>
                                <p class="promotion-desc">현재 수십가지에 달하는 랜섬웨어<br />경험과 노하우로 복구성공률 100%<br />(복구실패시 청구하지 않습니다.)</p>
                                <a href="#" class="promotion-btn" style="background-color: #FFEB00;color: #3C1E1E"><b>카카오톡 연동</b></a>
                            </div>
                        </div>
                        <!-- END promotion -->
                    </div>
                    <!-- END col-6 -->
                    <!-- BEGIN col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <!-- BEGIN promotion -->
                        <div class="promotion bg-blue">
                            <div class="promotion-image promotion-image-overflow-bottom promotion-image-overflow-top">
                                <img src="assets/img/apple-watch-sm.png" alt="" />
                            </div>
                            <div class="promotion-caption promotion-caption-inverse text-right">
                                <h4 class="promotion-title">하드디스크 복구</h4>
                                <p class="promotion-desc">논리적 작업과 물리적 작업으로 복구작업이 이루어지며 상태에 따라
                                <br>복구율은 차이가 날 수 있습니다.</p>
                                <a href="#" class="promotion-btn" style="background-color: #FFEB00;color: #3C1E1E"><b>카카오톡 연동</b></a>
                            </div>
                        </div>
                        <!-- END promotion -->
                        <!-- BEGIN promotion -->
                        <div class="promotion bg-silver">
                            <div class="promotion-image text-center promotion-image-overflow-bottom">
                                <img src="assets/img/mac-mini.png" alt="" />
                            </div>
                            <div class="promotion-caption text-right">
                                <h4 class="promotion-title">메모리 복구</h4>
                                <p class="promotion-desc">USB,SD카드,CF카드,MICRO SD카드,SSD카드 등<br>복구율이 낮기 때문에 고사양의 장비를 동원하여 작업해야 합니다.</p>
                                <a href="#" class="promotion-btn" style="background-color: #FFEB00;color: #3C1E1E"><b>카카오톡 연동</b></a>
                            </div>
                        </div>
                        <!-- END promotion -->
                    </div>
                    <!-- END col-3 -->
                    <!-- BEGIN col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <!-- BEGIN promotion -->
                        <div class="promotion bg-silver">
                            <div class="promotion-image promotion-image-overflow-right promotion-image-overflow-bottom text-right">
                                <img src="assets/img/mac-accessories.png" alt="" />
                            </div>
                            <div class="promotion-caption text-right">
                                <h4 class="promotion-title">스마트폰 복구</h4>
                                <p class="promotion-desc">초기화 삭제실수,고장,침수,화재 등의 원인으로 메세지, 전화번호부,사진,동영상 등의 데이터가 손실 되었을 때 데이터를 찾아드립니다.</p>
                                <a href="#" class="promotion-btn" style="background-color: #FFEB00;color: #3C1E1E"><b>카카오톡 연동</b></a>
                            </div>
                        </div>
                        <!-- END promotion -->
                        <!-- BEGIN promotion -->
                        <div class="promotion bg-black">
                            <div class="promotion-image text-right">
                                <img src="assets/img/mac-pro.png" alt="" />
                            </div>
                            <div class="promotion-caption promotion-caption-inverse text-right">
                                <h4 class="promotion-title">서버 복구</h4>
                                <p class="promotion-desc">복구업계 최상의 난이도와 기술력을 필요로 합니다.레이드 구성을 파악하고 세심한 작업으로 인해 다소 시간이 소요 될 수 있습니다.바른데이터는 서버복구 전문업체 입니다.</p>
                                <a href="#" class="promotion-btn"  style="background-color: #FFEB00;color: #3C1E1E"><b>카카오톡 연동</b></a>
                            </div>
                        </div>
                        <!-- END promotion -->
                    </div>
                    <!-- END col-3 -->
                </div>
                <!-- END row -->
            </div>
            <!-- END container -->
        </div>
        <!-- END #promotions -->
    
        <!-- BEGIN #mobile-list -->
        <div id="mobile-list" class="section-container bg-silver p-t-20">
            <!-- BEGIN container -->
            <div class="container">
                <!-- BEGIN section-title -->
                <h4 class="section-title clearfix">
                    	심각한 증상
                    <small>현재와 같은 증상이 보일시 저희에게 믿고 맡겨 주세요.</small>
                </h4>
                <!-- END section-title -->
                <!-- BEGIN category-container -->
                <div class="category-container">
                    <!-- BEGIN category-sidebar -->
                    <div class="category-sidebar">
                        <ul class="category-list">
                            <li class="list-header">Top Categories</li>
                            <li><a href="#">랜섬웨어 증상</a></li>
                            <li><a href="#">하드디스크 증상</a></li>
                            <li><a href="#">메모리 증상</a></li>
                            <li><a href="#">서버 증상</a></li>
                        </ul>
                    </div>
                    <!-- END category-sidebar -->
                    <!-- BEGIN category-detail -->
                    <div class="category-detail">
                        <!-- BEGIN category-item -->
                        <a href="#" class="category-item full" style="width: 100%">
                            <div class="item">
                                <div class="item-cover">
                                    <img src="assets/img/samsung-s7-edge.jpg" alt="" />
                                </div>
                                <div class="item-info bottom">
                                    <h4 class="item-title">Samsung Galaxy s7 Edge + Geat 360 + Gear VR</h4>
                                    <p class="item-desc">Redefine what a phone can do</p>
                                    <div class="item-price">$799.00</div>
                                </div>
                            </div>
                        </a>
                        <!-- END category-item -->
                    </div>
                    <!-- END category-detail -->
                </div>
                <!-- END category-container -->
            </div>
            <!-- END container -->
        </div>
        <!-- END #mobile-list -->
        
        <!-- 문의하기 스타트 -->
        <div id="tablet-list" class="section-container bg-silver p-t-0">
        	<div class="container">
                <!-- BEGIN section-title -->
                <h4 class="section-title clearfix">
					문의하기
                    <small>언제든지 문의 주시면 빠른시일 안에 답변 드리겠습니다.</small>
                </h4>
                <div class="category-container  bg-silver p-t-20" style="border: 0px;">
                	<div style="height: 400px;">
                		<div>
	                		<div class="col-md-2 col-sm-2">
	                			<label class="control-label" style="font-weight: 600 !important;">성함</label>
	                		</div>
	                		
	                		<div class="col-md-10 col-sm-10">
	                			<input type="text" class="form-control">
	                		</div>
                		</div>
                		<div class="m-t-10">
	                		<div class="col-md-2 col-sm-2">
	                			<label class="control-label" style="font-weight: 600 !important;">연락처</label>
	                		</div>
	                		
	                		<div class="col-md-10 col-sm-10">
	                			<input type="text" class="form-control">
	                		</div>
                		</div>
                		<div class="p-t-10">
	                		<div class="col-md-2 col-sm-2">
	                			<label class="control-label" style="font-weight: 600 !important;">증상 </label>
	                		</div>
	                		
	                		<div class="col-md-10 col-sm-10">
	                			<textarea class="textarea form-control"  rows="12" placeholder="Enter text ..."></textarea>
	                		</div>
	                		
	                		<a href="#" class="promotion-btn" style="background-color: #FFF;color: #3C1E1E"><b>문의하기</b></a>              
                		</div>  		
                	</div>
               	</div>
            </div>
        </div>
        <!-- 문의 하기 끝 -->
    
        <!-- BEGIN #tablet-list -->
        <div id="tablet-list" class="section-container bg-silver p-t-20">
            <!-- BEGIN container -->
            <div class="container">
                <!-- BEGIN section-title -->
                <h4 class="section-title clearfix">
					회사 위치
                    <small>서울시 송파구 충민로66 가든파이브 7층 엘-7043호</small>
                </h4>
                <!-- END section-title -->
                <!-- BEGIN category-container -->
                <div class="category-container">
                	<div id="map" style="height: 400px;"></div>
                	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c35a103954fbcf2deaa6e2721ede1c17"></script>
                	<script>
						var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
						var options = { //지도를 생성할 때 필요한 기본 옵션
							center: new daum.maps.LatLng(37.4775778, 127.12499830000002), //지도의 중심좌표.
							level: 3 //지도의 레벨(확대, 축소 정도)
						};
						var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
						var marker = new daum.maps.Marker({ 
						    // 지도 중심좌표에 마커를 생성합니다 
						    position: map.getCenter() 
						}); 
						// 지도에 마커를 표시합니다
						marker.setMap(map);
					</script>
                </div>
                <!-- END category-container -->
            </div>
            <!-- END container -->
        </div>
        <!-- END #tablet-list -->
		<div id="policy" class="section-container p-t-30 p-b-30">
            <!-- BEGIN container -->
            <div class="container">
                <!-- BEGIN row -->
                <div class="row">
                    <!-- BEGIN col-4 -->
                    <div class="col-md-6 col-sm-6">
                        <!-- BEGIN policy -->
                        <div class="policy">
                            <div class="policy-icon"><i class="fa fa-cogs"></i></div>
                            <div class="policy-info">
                                <h4>24시간 문의</h4>
                                <p>언제든지 증상이 있을시 연락 주세요.</p>
                                <p><font color="red" style="font-size: 31px;font-family: unset;font-weight:bold;">1588-1588</font></p>
                            </div>
                        </div>
                        <!-- END policy -->
                    </div>
                    <!-- END col-4 -->
                    <!-- BEGIN col-4 -->
                    <div class="col-md-6 col-sm-6">
                        <!-- BEGIN policy -->
                        <div class="policy">
                            <div class="policy-icon"><i class="fa fa-shield"></i></div>
                            <div class="policy-info">
                                <h4>긴급 문의</h4>
                                <p>증상이 있을시 연락 주세요.</p>
                                <p><font color="red" style="font-size: 31px;font-family: unset;font-weight:bold;">010-1111-2222</font></p>
                            </div>
                        </div>
                        <!-- END policy -->
                    </div>
                    <!-- END col-4 -->
                </div>
                <!-- END row -->
            </div>
            <!-- END container -->
        </div>    
        <!-- BEGIN #footer -->
        <div id="footer" class="footer">
            <!-- BEGIN container -->
            <div class="container">
                <!-- BEGIN row -->
                <div class="row">
                    <div class="col-md-6">
                        <h4 class="footer-header">데이터컴</h4>
                        <p>서울시 송파구 충민로 66 가든파이브 7층 엘-7043호</p>
                        <p>사업자 번호 546-22-00717, 대표전화 1588-1588</p>
                        <p>카카오뱅크 3222-22111-2222 (주)데이터컴</p>
                        <p><a href="#"><i class="fa fa-file-text"> 이용약관</i></a> <a href="#">&nbsp;&nbsp;<i class="fa fa-list"> 개인정보처리방침</i></a></p>
                    </div>
                    
					<div class="col-md-6">
                        <!-- BEGIN social -->
                        <div class="social">
                            <div class="social-intro">
                            </div>
                            <div class="social-list">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                        <!-- END social -->
                    </div>
                    
                    <!-- END col-3 -->
                </div>
                <!-- END row -->
            </div>
            <!-- END container -->
        </div>
        <!-- END #footer -->
    
        <!-- BEGIN #footer-copyright -->
        <div id="footer-copyright" class="footer-copyright">
            <!-- BEGIN container -->
            <div class="container">
                <div class="payment-method">
                    <img src="assets/img/payment_method.png" alt="" />
                </div>
                <div class="copyright">
                    Copyright &copy; 2018 DataCome. All rights reserved.
                </div>
            </div>
            <!-- END container -->
        </div>
        <!-- END #footer-copyright -->
    </div>
    <!-- END #page-container -->

	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${pageContext.request.contextPath}/static/js/jquery-1.9.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/jquery-migrate-1.1.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
		<script src="assets/crossbrowserjs/html5shiv.js"></script>
		<script src="assets/crossbrowserjs/respond.min.js"></script>
		<script src="assets/crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
	<script src="${pageContext.request.contextPath}/static/js/jquery.cookie.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/apps.min.js"></script>
	<!-- ================== END BASE JS ================== -->
	
	<script>
	    $(document).ready(function() {
	        App.init();
	    });
	</script>
</body>
</html>
