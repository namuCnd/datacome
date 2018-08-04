<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<meta content="IE=edge">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>유니베라몰</title>
	
	<script type="text/javascript">
		// default global variable
		var contextPath = "${pageContext.request.contextPath}";
		var locale = "${fn:substring(pageContext.response.locale, 0, 2)}";
	</script>
	<tiles:insertAttribute name="mypage.default.head.body"/>