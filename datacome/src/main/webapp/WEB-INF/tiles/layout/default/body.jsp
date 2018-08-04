<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
	<div id="top"></div>
	<!-- Top Menu -->
	<tiles:insertAttribute name="default.body.north"/>
	<!--// Top Menu -->
	<!-- container -->
	<div id="container" class="<tiles:insertAttribute name="default.body.container.class"/>">
	<!-- Sub Menu (서브메뉴가 있는 페이지에서 사용) -->
	<tiles:insertAttribute name="default.body.west"/>
	<!--// Sub Menu -->
	<div class="content">
	<!-- Center -->
	<tiles:insertAttribute name="default.body.center"/>
	<!--// Center -->
	<!-- East 퀵메뉴로 사용 - 퀵메뉴 위치이동 -->	
	<tiles:insertAttribute name="default.body.east"/>
	<!--// East -->
	</div>
	</div>
	<!-- //container -->
	<!-- Bottom -->
	<tiles:insertAttribute name="default.body.south"/>
	<!--// Bottom -->
