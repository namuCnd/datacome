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
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/default.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
	<!-- 2018 추가 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style_2018.css" />
	<!-- //2018 추가 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style_pop.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/jquery-ui.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/popModal.css">

	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.bxslider.js"></script>
	<!-- 2018 수정 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/script.js"></script>
	<!-- //2018 수정 -->
	<!-- 2018 추가 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/script_2018.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/script.js"></script>
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/popModal.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/content.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/public_common.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js"></script>
	<!-- 2018 추가 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common_2018.js"></script>
	<!-- //2018 추가 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/handlebars-v1.3.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/iscroll.js"></script>
