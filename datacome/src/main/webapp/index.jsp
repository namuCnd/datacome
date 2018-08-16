<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>datacome</title>
<script>
//location.href="./main/main.do";
</script>
</head>
<body>
<%
		//웹표준 301 redirect. 네이버 meta tag 삽입을 위해 변경 처리. 2017.01.20
        response.setStatus(301);
        response.setHeader("Location", "./main/main.do");
        response.setHeader("Connection", "close");
    %>
</body>
</html>