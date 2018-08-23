<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<script type="text/javascript">
	$(document).ready(function(){
		
		$("#saveBtn").on("click", function(){
			$.ajax({
				url : "/insertReservBoard.json",
				type :"POST",
				dataType : "json",
				data : $("#frm").serialize() , 
				success : function(data){
					if (data.result == 'complete') {
						alert("문의가 완료 되었습니다\n빠른시간내에 답변드리겠습니다.");			
					} else if (data.result == 'fail') {
						alert("문의하기 실패.");						
					}
				}, error:function(request,status,error){
					
				}
			});
			
		});
	});
</script>
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
                        <div class="header-logo">
                            <a href="javascript:void(0);">
                                <span class="logo"><img src="${pageContext.request.contextPath}/images/datacome.png" alt="DataCome"style="width: 50%;margin-left: 30px;"></span>
                                <span>Data</span>Come
                                <small>The Pride of Recover</small>
                            </a>
                        </div>
                    </div>
                    <!-- END navbar-header -->
                    <!-- BEGIN header-nav -->
                    <div class="header-nav">
                        <div>
                            <ul class="nav">
                                <li class="active">
                                    <a href="#promotions">복구 솔루션</a>
                                </li>
                                <li class="">
                                    <a href="#mobile-list">심각한 증상</a>
                                </li>
                                <li class="">
                                    <a href="#tablet-list">문의하기</a>
                                </li>
                                <li class="">
                                    <a href="#tablet-list2">회사 위치</a>
                                </li>
                                <li class="">
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
                                 <!--<img src="assets/img/user-1.jpg" class="user-img" alt="" /> 
                                   <span class="hidden-md hidden-sm hidden-xs">Login</span>-->
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
                        <img src="${pageContext.request.contextPath}/static/images/cover/cover1.jpg" class="bg-cover-img" alt="" />
                        <div class="container">
                            <img src="${pageContext.request.contextPath}/assets/img/slider-1-product.png" class="product-img right bottom fadeInRight animated" alt="" />
                        </div>
                        <div class="carousel-caption carousel-caption-left">
                            <div class="container">
                                <!-- <h3 class="title m-b-5 fadeInLeftBig animated">iMac</h3> -->
                                <h3 class="title m-b-5 fadeInDownBig animated">DataCome</h3>  
                                <!-- <p class="m-b-15 fadeInLeftBig animated">Retina. Now in colossal and ginormous.</p> -->
                                <p class="m-b-15 fadeInDownBig animated">컴퓨터 수리의 전문가들<br>전국 어디서나 연락시 즉시 출장</p>
                                <div class="price m-b-30 fadeInLeftBig animated"><small>tel.</small> <span>1588-1588</span></div>
                                <a href="#" class="btn btn-outline btn-lg fadeInLeftBig animated">전화 문의</a>
                                <a href="#" class="btn btn-outline btn-lg fadeInLeftBig animated" data-toggle="modal" data-target="#myModal"> 온라인 문의</a>
                            </div>
                        </div>
                    </div>

                    <!-- END item -->
                    <!-- BEGIN item -->
                    
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/static/images/cover/cover2.jpg" class="bg-cover-img" alt="" />
                        <div class="container">
                            <img src="${pageContext.request.contextPath}/assets/img/slider-1-product.png" class="product-img right bottom fadeInRight animated" alt="" />
                        </div>
                        <div class="carousel-caption carousel-caption-left">
                            <div class="container">
                                <h3 class="title m-b-5 fadeInDownBig animated">DataCome</h3> 
                                <p class="m-b-15 fadeInLeftBig animated">데이터 복구의 상위 1%</p>
                                <div class="price m-b-30 fadeInLeftBig animated"><small>tel.</small> <span>1588-1588</span></div>
                                <a href="#" class="btn btn-outline btn-lg fadeInLeftBig animated">전화 문의</a>
                                <a href="#" class="btn btn-outline btn-lg fadeInLeftBig animated" data-toggle="modal" data-target="#myModal">온라인 문의</a>
                            </div>
                        </div>                        
                    </div>
                    <!-- END item -->
                    <!-- BEGIN item -->
                     <div class="item">
                        <img src="${pageContext.request.contextPath}/static/images/cover/cover3.jpg" class="bg-cover-img" alt="" style="margin-top: -85px;" />
                        <div class="carousel-caption">
                            <div class="container">
                                <h3 class="title m-b-5 fadeInDownBig animated">DataCome</h3>  
                                <p class="m-b-15 fadeInDownBig animated">본사는 신뢰를 먹고 사는<br>최고의 전문가 들입니다.</p>
                                <div class="price fadeInDownBig animated"><small>tel.</small> <span>1588-1588</span></div>
                                <a href="#" class="btn btn-outline btn-lg fadeInLeftBig animated">전화 문의</a>
                                <a href="#" class="btn btn-outline btn-lg fadeInLeftBig animated" data-toggle="modal" data-target="#myModal">온라인 문의</a>
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
                        <div class="promotion promotion-lg bg-black-darker" style="background-color:#485158 !important;">
                            <div class="promotion-image text-right promotion-image-overflow-bottom">
                                <img src="${pageContext.request.contextPath}/static/images/back/bCom.jpg" alt="" style="max-width: 50%;margin-bottom: 60px;"/>
                            </div>
                            <div class="promotion-caption promotion-caption-inverse">
                                <h4 class="promotion-title">컴퓨터 수리</h4>
                                <div class="promotion-price"></div>
                                <p class="promotion-desc">본사의 노하우를 교육 받은 전문 수리기사와<br/>본사에서 직접 출고하는 교체제품에 대한 신뢰를 통해서<br/>누구보다 빠르고 정확하게 수리합니다.</p>
                                <div id="plusfriend-chat-button"></div>
                            </div>
                        </div>
                        <!-- END promotion -->
                    </div>
                    <!-- END col-6 -->
                    <!-- BEGIN col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <!-- BEGIN promotion -->
                        <div class="promotion bg-blue" style="background-color:#99D6D9 !important;">
                            <div class="promotion-image text-right promotion-image-overflow-bottom">
                                <%-- <img src="${pageContext.request.contextPath}/static/images/back/data3.jpg" alt="" style="max-width: 50%;margin-bottom: 60px;"/> --%>
                            </div>
                            <div class="promotion-caption promotion-caption-inverse text-right">
                                <h4 class="promotion-title">데이터 복구</h4>
                                <p class="promotion-desc">논리적 작업과 물리적 작업으로 복구작업이 이루어지며 상태에 따라
                                <br>복구율은 차이가 날 수 있습니다.</p>
                                <div id="plusfriend-chat-button"></div>
                            </div>
                        </div>
                        <!-- END promotion -->
                        <!-- BEGIN promotion -->
                        <div class="promotion bg-silver">
                            <div class="promotion-image text-right promotion-image-overflow-bottom">
                                <%-- <img src="${pageContext.request.contextPath}/static/images/back/ransome.jpg" alt=""  style="max-width: 50%;margin-bottom: 60px;"/> --%>
                            </div>
                            <div class="promotion-caption text-right">
                                <h4 class="promotion-title">랜섬웨어 복구</h4>
                                <p class="promotion-desc">현재 수십가지에 달하는 랜섬웨어<br>경험과 노하우로 복구성공률 100%<br>(복구실패시 청구하지 않습니다.)</p>
                                <div id="plusfriend-chat-button"></div>
                            </div>
                        </div>
                        <!-- END promotion -->
                    </div>
                    <!-- END col-3 -->
                    <!-- BEGIN col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <!-- BEGIN promotion -->
                        <div class="promotion bg-silver">    
							<div class="promotion-image text-right promotion-image-overflow-bottom">
                               	<%-- <img src="${pageContext.request.contextPath}/static/images/back/bcom2.jpg" alt="" style="max-width: 50%;margin-bottom: 60px;"/> --%>
                            </div>
                            <div class="promotion-caption text-right">
                            	<h4 class="promotion-title">컴퓨터 유지보수</h4>
                                <p class="promotion-desc">중요한 자료를 보관한 오래된 컴퓨터의 경우 유지보수가 필요하며 본사의 전문 인력이 전문적으로 관리해드립니다. </p>
                                <div id="plusfriend-chat-button"></div>
                            </div>
						</div>
                        <!-- END promotion -->
                        <!-- BEGIN promotion -->
                        <div class="promotion bg-black">
                            <div class="promotion-image text-right">
                                <%-- <img src="${pageContext.request.contextPath}/static/images/back/server.jpg" alt="" /> --%>
                            </div>
                            <div class="promotion-caption promotion-caption-inverse text-right">
                                <h4 class="promotion-title">서버 복구</h4>
                                <p class="promotion-desc">복구업계 최상의 난이도와 기술력을 필요로 합니다.레이드 구성을 파악하고 세심한 작업으로 인해 다소 시간이 소요 될 수 있습니다.바른데이터는 서버복구 전문업체 입니다.</p>
                                <div id="plusfriend-chat-button"></div>
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
                            <li><a onclick="javascript:fn_main_rem(0);">컴퓨터 고장 증상</a></li>
                            <li><a onclick="javascript:fn_main_rem(1);">랜섬웨어 증상</a></li>
                            <li><a onclick="javascript:fn_main_rem(2);">서버 고장 증상</a></li>
                        </ul>
                    </div>
                    <!-- END category-sidebar -->
                    <!-- BEGIN category-detail -->
                    	<div class="category-detail">
                    	 	<div class="category-detail">
	                        <!-- BEGIN category-item -->
								<div id="div_category_items" class="category-item full" ">
									<div class="item">
										<div class="item-info bottom">
	                                       	<h4 class="item-title">컴퓨터 고장 증상</h4>
	                                       	<p class="item-desc">1. 부팅시 엄청나게 컴퓨터가 느려집니다.</p>
		                             		<p class="item-desc">2. 블루스크린이 뜨며 알수 없는 문자로 모니터에 표출됩니다.</p>
		                                    <p class="item-desc">4. 부팅시 이상한 소리를 내며 컴퓨터가 켜지지 않습니다.</p>
		                              		<a href="javascript:void(0);" class="promotion-btn setMobile" data-toggle="modal" data-target="#myModal"><b>문의하기</b></a>    
	                                   	</div>
										<div class="item-cover" style="text-align: center;">
		                            		<img src="${pageContext.request.contextPath}/static/images/back/pc_error.jpg" alt="" /> 
		                                </div>
		                            </div>
								</div>
	                        <!-- END category-item -->
		                    </div>
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
        
        <!-- 문의하기 스타트 -->
        <!-- <div id="tablet-list" class="section-container bg-silver p-t-0">
        	<div class="container">
                BEGIN section-title
                <h4 class="section-title clearfix">
					문의하기
                    <small>언제든지 문의 주시면 빠른시일 안에 답변 드리겠습니다.</small>
                </h4>
                
         		<a href="#" class="promotion-btn setMobile" data-toggle="modal" data-target="#myModal"><b>문의하기</b></a>    
         		
   		-->
   			<form id="frm" name="frm">
				<div class="modal fade setMobile" id="myModal">
					<div class="modal-dialog">
				    	<div class="modal-content">
				     		<div class="modal-header"></div>
				      		<div class="modal-body">
				        		<div>
			                		<div class="col-md-2 col-sm-2">
			                			<label class="control-label" style="font-weight: 600 !important;">성함</label>
			                		</div>
			                		
			                		<div class="col-md-10 col-sm-10">
			                			<input type="text" id="title" name="title" class="form-control" maxlength="10">
			                		</div>
		                		</div>
		                		<div class="m-t-10">
			                		<div class="col-md-2 col-sm-2">
			                			<label class="control-label" style="font-weight: 600 !important;">연락처</label>
			                		</div>
			                		
			                		<div class="col-md-10 col-sm-10">
			                			<input type="text" id="phone" name="phone" class="form-control">
			                		</div>
		                		</div>
		                		<div class="p-t-10">
			                		<div class="col-md-2 col-sm-2">
			                			<label class="control-label" style="font-weight: 600 !important;">증상 </label>
			                		</div>
			                		
			                		<div class="col-md-10 col-sm-10">
			                			<textarea id="content" name="content" class="textarea form-control"  rows="12" placeholder="증상을 간략히 적어주세요 ..."></textarea>
			                		</div>
			                		
			                		<a href="javascript:void(0);" id="saveBtn" class="promotion-btn" style="background-color: #FFF;color: #3C1E1E"><b>문의하기</b></a>              
		                		</div> 
				      		</div>
				      	<div class="modal-footer"></div>
				    	</div>
				  	</div>
				</div>   
			</form>
           <!-- 
            </div>
        </div> -->
        <!-- 문의 하기 끝 -->
    
        <!-- BEGIN #tablet-list -->
        <div id="tablet-list2" class="section-container bg-silver p-t-20">
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
                    <img src="${pageContext.request.contextPath}/assets/img/payment_method.png" alt="" />
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
	<script>
		//<![CDATA[
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('d06113b4d57b06468d6c56908535bb6b');
	    // 플러스친구 1:1채팅 버튼을 생성합니다.
	    Kakao.PlusFriend.createChatButton({
	      container: '#plusfriend-chat-button',
	      plusFriendId: '_zpDhj' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
	    });
	 	 //]]>
	</script>
</body>
</html>