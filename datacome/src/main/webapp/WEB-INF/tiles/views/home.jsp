<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="ko">
<!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>E-Commerce Front End Theme</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/pace.min.js"></script>
	<!-- ================== END BASE JS ================== -->
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
                                    <a href="#" >랜섬웨어 솔루션</a>
                                </li>
                                <li class="dropdown dropdown-hover">
                                    <a href="#" >데이터 복구</a>
                                </li>
                                <li class="dropdown dropdown-hover">
                                    <a href="#" >서버 복구</a>
                                </li>
                                <li class="dropdown dropdown-hover">
                                    <a href="#" >고객 지원</a>
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
                    서버복구 어쩌구저꺼구
                    <small>믿을맨 김갑동</small>
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
                                <div class="promotion-price"><small>from</small> $299.00</div>
                                <p class="promotion-desc">A big step for small.<br />A beloved design. Now with more to love.</p>
                                <a href="#" class="promotion-btn">카카오톡 연동</a>
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
                                <h4 class="promotion-title">Apple Watch</h4>
                                <div class="promotion-price"><small>from</small> $299.00</div>
                                <p class="promotion-desc">You. At a glance.</p>
                                <a href="#" class="promotion-btn">View More</a>
                            </div>
                        </div>
                        <!-- END promotion -->
                        <!-- BEGIN promotion -->
                        <div class="promotion bg-silver">
                            <div class="promotion-image text-center promotion-image-overflow-bottom">
                                <img src="assets/img/mac-mini.png" alt="" />
                            </div>
                            <div class="promotion-caption text-center">
                                <h4 class="promotion-title">Mac Mini</h4>
                                <div class="promotion-price"><small>from</small> $199.00</div>
                                <p class="promotion-desc">It’s mini in a massive way.</p>
                                <a href="#" class="promotion-btn">View More</a>
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
                            <div class="promotion-caption text-center">
                                <h4 class="promotion-title">Apple Accessories</h4>
                                <div class="promotion-price"><small>from</small> $99.00</div>
                                <p class="promotion-desc">Redesigned. Rechargeable. Remarkable.</p>
                                <a href="#" class="promotion-btn">View More</a>
                            </div>
                        </div>
                        <!-- END promotion -->
                        <!-- BEGIN promotion -->
                        <div class="promotion bg-black">
                            <div class="promotion-image text-right">
                                <img src="assets/img/mac-pro.png" alt="" />
                            </div>
                            <div class="promotion-caption promotion-caption-inverse">
                                <h4 class="promotion-title">Mac Pro</h4>
                                <div class="promotion-price"><small>from</small> $1,299.00</div>
                                <p class="promotion-desc">Built for creativity on an epic scale.</p>
                                <a href="#" class="promotion-btn">View More</a>
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
    
        <!-- BEGIN #trending-items -->
        <div id="trending-items" class="section-container bg-silver">
            <!-- BEGIN container -->
            <div class="container">
                <!-- BEGIN section-title -->
                <h4 class="section-title clearfix">
                    <a href="#" class="pull-right m-l-5"><i class="fa fa-angle-right f-s-18"></i></a>
                    <a href="#" class="pull-right"><i class="fa fa-angle-left f-s-18"></i></a>
                    Trending Items
                    <small>Shop and get your favourite items at amazing prices!</small>
                </h4>
                <!-- END section-title -->
            
                <!-- BEGIN row -->
                <div class="row row-space-10">
                    <!-- BEGIN col-2 -->
                    <div class="col-md-2 col-sm-4">
                        <!-- BEGIN item -->
                        <div class="item item-thumbnail">
                            <a href="product_detail.html" class="item-image">
                                <img src="assets/img/iphone.png" alt="" />
                                <div class="discount">15% OFF</div>
                            </a>
                            <div class="item-info">
                                <h4 class="item-title">
                                    <a href="product_detail.html">iPhone 6s Plus<br />16GB</a>
                                </h4>
                                <p class="item-desc">3D Touch. 12MP photos. 4K video.</p>
                                <div class="item-price">$649.00</div>
                                <div class="item-discount-price">$739.00</div>
                            </div>
                        </div>
                        <!-- END item -->
                    </div>
                    <!-- END col-2 -->
                    <!-- BEGIN col-2 -->
                    <div class="col-md-2 col-sm-4">
                        <!-- BEGIN item -->
                        <div class="item item-thumbnail">
                            <a href="product_detail.html" class="item-image">
                                <img src="assets/img/ipad-pro.png" alt=""  />
                                <div class="discount">32% OFF</div>
                            </a>
                            <div class="item-info">
                                <h4 class="item-title">
                                    <a href="product.html">9.7-inch iPad Pro<br />32GB</a>
                                </h4>
                                <p class="item-desc">Super. Computer. Now in two sizes.</p>
                                <div class="item-price">$599.00</div>
                                <div class="item-discount-price">$799.00</div>
                            </div>
                        </div>
                        <!-- END item -->
                    </div>
                    <!-- END col-2 -->
                    <!-- BEGIN col-2 -->
                    <div class="col-md-2 col-sm-4">
                        <!-- BEGIN item -->
                        <div class="item item-thumbnail">
                            <a href="product_detail.html" class="item-image">
                                <img src="assets/img/imac.png" alt="" />
                                <div class="discount">20% OFF</div>
                            </a>
                            <div class="item-info">
                                <h4 class="item-title">
                                    <a href="product.html">21.5-inch iMac<br />with Retina Display</a>
                                </h4>
                                <p class="item-desc">Retina. Now in colossal and ginormous.</p>
                                <div class="item-price">$1,099.00</div>
                                <div class="item-discount-price">$1,299.00</div>
                            </div>
                        </div>
                        <!-- END item -->
                    </div>
                    <!-- END col-2 -->
                    <!-- BEGIN col-2 -->
                    <div class="col-md-2 col-sm-4">
                        <!-- BEGIN item -->
                        <div class="item item-thumbnail">
                            <a href="product_detail.html" class="item-image">
                                <img src="assets/img/apple-watch.png" alt="" />
                                <div class="discount">13% OFF</div>
                            </a>
                            <div class="item-info">
                                <h4 class="item-title">
                                    <a href="product.html">Apple Watch<br />Stainless steel cases</a>
                                </h4>
                                <p class="item-desc">You. At a glance.</p>
                                <div class="item-price">$599.00</div>
                                <div class="item-discount-price">$799.00</div>
                            </div>
                        </div>
                        <!-- END item -->
                    </div>
                    <!-- END col-2 -->
                    <!-- BEGIN col-2 -->
                    <div class="col-md-2 col-sm-4">
                        <!-- BEGIN item -->
                        <div class="item item-thumbnail">
                            <a href="product_detail.html" class="item-image">
                                <img src="assets/img/macbook-pro.png" alt="" />
                                <div class="discount">30% OFF</div>
                            </a>
                            <div class="item-info">
                                <h4 class="item-title">
                                    <a href="product.html">MacBook Pro<br />with Retina Display</a>
                                </h4>
                                <p class="item-desc">Stunning Retina Display</p>
                                <div class="item-price">$1299.00</div>
                                <div class="item-discount-price">$1499.00</div>
                            </div>
                        </div>
                        <!-- END item -->
                    </div>
                    <!-- END col-2 -->
                    <!-- BEGIN col-2 -->
                    <div class="col-md-2 col-sm-4">
                        <!-- BEGIN item -->
                        <div class="item item-thumbnail">
                            <a href="product_detail.html" class="item-image">
                                <img src="assets/img/apple-tv.png" alt="" />
                                <div class="discount">40% OFF</div>
                            </a>
                            <div class="item-info">
                                <h4 class="item-title">
                                    <a href="product.html">Apple Tv<br />32GB</a>
                                </h4>
                                <p class="item-desc">The future of television is here.</p>
                                <div class="item-price">$149.00</div>
                                <div class="item-discount-price">$249.00</div>
                            </div>
                        </div>
                        <!-- END item -->
                    </div>
                    <!-- END col-2 -->
                </div>
                <!-- END row -->
            </div>
            <!-- END container -->
        </div>
        <!-- END #trending-items -->
    
        <!-- BEGIN #mobile-list -->
        <div id="mobile-list" class="section-container bg-silver p-t-0">
            <!-- BEGIN container -->
            <div class="container">
                <!-- BEGIN section-title -->
                <h4 class="section-title clearfix">
                    <a href="#" class="pull-right">SHOW ALL</a>
                    여기에 증상을 보여주기
                    <small>Shop and get your favourite phone at amazing prices!</small>
                </h4>
                <!-- END section-title -->
                <!-- BEGIN category-container -->
                <div class="category-container">
                    <!-- BEGIN category-sidebar -->
                    <div class="category-sidebar">
                        <ul class="category-list">
                            <li class="list-header">Top Categories</li>
                            <li><a href="#">랜섬웨어 증상</a></li>
                            <li><a href="#">메모리 메롱 증상</a></li>
                            <li><a href="#">어쩌구 증상</a></li>
                            <li><a href="#">램 증상</a></li>
                            <li><a href="#">Karbonn</a></li>
                            <li><a href="#">Intex</a></li>
                            <li><a href="#">Sony</a></li>
                            <li><a href="#">HTC</a></li>
                            <li><a href="#">Asus</a></li>
                            <li><a href="#">Nokia</a></li>
                            <li><a href="#">Blackberry</a></li>
                            <li><a href="#">All Brands</a></li>
                        </ul>
                    </div>
                    <!-- END category-sidebar -->
                    <!-- BEGIN category-detail -->
                    <div class="category-detail">
                        <!-- BEGIN category-item -->
                        <a href="#" class="category-item full">
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
                        <!-- BEGIN category-item -->
                        <div class="category-item list">
                            <!-- BEGIN item-row -->
                            <div class="item-row">
                                <!-- BEGIN item -->
                                <div class="item item-thumbnail">
                                    <a href="product_detail.html" class="item-image">
                                        <img src="assets/img/iphone.png" alt="" />
                                        <div class="discount">15% OFF</div>
                                    </a>
                                    <div class="item-info">
                                        <h4 class="item-title">
                                            <a href="product_detail.html">iPhone 6s Plus<br />16GB</a>
                                        </h4>
                                        <p class="item-desc">3D Touch. 12MP photos. 4K video.</p>
                                        <div class="item-price">$649.00</div>
                                        <div class="item-discount-price">$739.00</div>
                                    </div>
                                </div>
                                <!-- END item -->
                                <!-- BEGIN item -->
                                <div class="item item-thumbnail">
                                    <a href="product_detail.html" class="item-image">
                                        <img src="assets/img/samsung-note5.png" alt="" />
                                        <div class="discount">32% OFF</div>
                                    </a>
                                    <div class="item-info">
                                        <h4 class="item-title">
                                            <a href="product.html">Samsung Galaxy Note 5<br />Black</a>
                                        </h4>
                                        <p class="item-desc">Super. Computer. Now in two sizes.</p>
                                        <div class="item-price">$599.00</div>
                                        <div class="item-discount-price">$799.00</div>
                                    </div>
                                </div>
                                <!-- END item -->
                                <!-- BEGIN item -->
                                <div class="item item-thumbnail">
                                    <a href="product_detail.html" class="item-image">
                                        <img src="assets/img/iphone-se.png" alt="" />
                                        <div class="discount">20% OFF</div>
                                    </a>
                                    <div class="item-info">
                                        <h4 class="item-title">
                                            <a href="product.html">iPhone SE<br />32/64Gb</a>
                                        </h4>
                                        <p class="item-desc">A big step for small.</p>
                                        <div class="item-price">$499.00</div>
                                        <div class="item-discount-price">$599.00</div>
                                    </div>
                                </div>
                                <!-- END item -->
                            </div>
                            <!-- END item-row -->
                            <!-- BEGIN item-row -->
                            <div class="item-row">
                                <!-- BEGIN item -->
                                <div class="item item-thumbnail">
                                    <a href="product_detail.html" class="item-image">
                                        <img src="assets/img/zenfone2.png" alt="" />
                                        <div class="discount">15% OFF</div>
                                    </a>
                                    <div class="item-info">
                                        <h4 class="item-title">
                                            <a href="product_detail.html">Assus ZenFone 2<br />‏(ZE550ML)</a>
                                        </h4>
                                        <p class="item-desc">See What Others Can’t See</p>
                                        <div class="item-price">$399.00</div>
                                        <div class="item-discount-price">$453.00</div>
                                    </div>
                                </div>
                                <!-- END item -->
                                <!-- BEGIN item -->
                                <div class="item item-thumbnail">
                                    <a href="product_detail.html" class="item-image">
                                        <img src="assets/img/xperia-z.png" alt="" />
                                        <div class="discount">32% OFF</div>
                                    </a>
                                    <div class="item-info">
                                        <h4 class="item-title">
                                            <a href="product.html">Sony Xperia Z<br />Black Color</a>
                                        </h4>
                                        <p class="item-desc">For unexpectedly beautiful moments</p>
                                        <div class="item-price">$599.00</div>
                                        <div class="item-discount-price">$799.00</div>
                                    </div>
                                </div>
                                <!-- END item -->
                                <!-- BEGIN item -->
                                <div class="item item-thumbnail">
                                    <a href="product_detail.html" class="item-image">
                                        <img src="assets/img/lumia-532.png" alt="" />
                                        <div class="discount">20% OFF</div>
                                    </a>
                                    <div class="item-info">
                                        <h4 class="item-title">
                                            <a href="product.html">Microsoft Lumia 531<br />Smartphone Orange</a>
                                        </h4>
                                        <p class="item-desc">1 Year Local Manufacturer Warranty</p>
                                        <div class="item-price">$99.00</div>
                                        <div class="item-discount-price">$199.00</div>
                                    </div>
                                </div>
                                <!-- END item -->
                            </div>
                            <!-- END item-row -->
                        </div>
                        <!-- END category-item -->
                    </div>
                    <!-- END category-detail -->
                </div>
                <!-- END category-container -->
            </div>
            <!-- END container -->
        </div>
        <!-- END #mobile-list -->
    
        <!-- BEGIN #tablet-list -->
        <div id="tablet-list" class="section-container bg-silver p-t-0">
            <!-- BEGIN container -->
            <div class="container">
                <!-- BEGIN section-title -->
                <h4 class="section-title clearfix">
					여기에 지도 삽입
                    <small>Shop and get your favourite tablet at amazing prices!</small>
                </h4>
                <!-- END section-title -->
                <!-- BEGIN category-container -->
                <div class="category-container">
                	<div style="background: red; height: 400px;"></div>
                </div>
                <!-- END category-container -->
            </div>
            <!-- END container -->
        </div>
        <!-- END #tablet-list -->
    
        <!-- BEGIN #footer -->
        <div id="footer" class="footer">
            <!-- BEGIN container -->
            <div class="container">
                <!-- BEGIN row -->
                <div class="row">
                    <div class="col-md-6">
                        <h4 class="footer-header">(주)데이터컴</h4>
                        <p>서울시 송파구 어디길 24 무슨 건물 몇호</p>
                        <p>사업자 번호 111-22-33333, 대표전화 1588-1588</p>
                        <p>카카오뱅크 3222-22111-2222 (주)데이터컴</p>
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
                                <a href="#"><i class="fa fa-dribbble"></i></a>
                                <a href="#"><i class="fa fa-google-plus"></i></a>
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
                    Copyright &copy; 2016 SeanTheme. All rights reserved.
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
