<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<script>
	$(document).ready(function(){
		$("#loginid").focus();
	});
</script>
	<!-- Center -->	
	<form id="signinFrm" name="signinFrm" method="post" action="/j_spring_security_check">
		
		<div class="container">
		    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		        <div class="panel panel-success">
		            <div class="panel-heading">
		                <div class="panel-title">환영합니다!</div>
		            </div>
		            <div class="panel-body">
	                    <div>
	                        <input type="text" class="form-control" name="loginid" placeholder="Username" autofocus>
	                    </div>
	                    <div>
	                        <input type="password" class="form-control" name="loginpwd" placeholder="Password">
	                    </div>
	                    <div>
	                        <button type="submit" class="form-control btn btn-primary">로그인</button>
	                    </div>
		            </div>
		        </div>
		    </div>
		</div>
		<input type="hidden" name="loginRedirect" value="${loginRedirect}" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>