<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
	<!-- Top Menu -->
	<tiles:insertAttribute name="mypage.default.body.north"/>
	<!--// Top Menu -->
	
	<!-- container -->
	<div id="container" class="<tiles:insertAttribute name="mypage.default.body.container.class"/>">
	
	<div class="content">
		<div id = "menuNav" class="location">
			<span class="dot">HOME</span> &gt; <span>마이페이지</span>
		</div>
		<div class="section mypage tp03">
			<!-- Center -->
			<tiles:insertAttribute name="mypage.default.body.center.left"/>
			<div class="mypageWrap">
				<%--	2018.04.11 삭제 
				<tiles:insertAttribute name="mypage.default.body.center.head"/> 
				--%>
				<!-- 마이페이지 컨텐츠부분 -->
				<tiles:insertAttribute name="mypage.default.body.center.body"/>
				<!-- //마이페이지 컨텐츠부분 -->
			</div>
<!--// Center -->

		</div><!-- //section mypage -->
	<!-- East 퀵메뉴로 사용 - 퀵메뉴 위치이동 -->
	<tiles:insertAttribute name="mypage.default.body.east"/>
	</div><!-- //content -->
			
	<!-- East 퀵메뉴로 사용 - 퀵메뉴 위치이동 -->	
	<%-- <tiles:insertAttribute name="default.body.east"/> --%>		
	<!--// East -->
	</div>
	<!-- //container -->
	<!-- Bottom -->
	<tiles:insertAttribute name="mypage.default.body.south"/>
	<!--// Bottom -->
