<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script>
	$(document).ready(function(){
		$("#loginid").focus();
	});
</script>
<c:set var="loginFail" value="${'Bad credentials' ne exception and 'User is disabled' ne exception}" />
	<!-- Center -->	
	<form id="signinFrm" name="signinFrm" method="post" action="/j_spring_security_check">
			<h2 class="blind">컨텐츠 부분</h2>
			<div class="content">
				<div class="location">
					<span class="dot">HOME</span> &gt; <span>로그인</span>
				</div>
				<div class="section">
					<div class="loginWrap">
						<div class="loginForm">
							<div class="loginInput">
								<ul>
									<li><input type="text" id="loginid" name="loginid" placeholder="아이디를 입력해주세요." value="datacomeAdmin" /></li>
									<li><input type="password" id="loginpwd" name="loginpwd" placeholder="비밀번호를 입력해주세요." value="1234" /></li>
								</ul>
								<c:choose>
									<c:when test="${empty cookie.login_save or !loginFail}">
								<input type="checkbox" id="chk" name="check" />
									</c:when>
									<c:otherwise>
								<input type="checkbox" id="chk" name="check" checked/> 
									</c:otherwise>
								</c:choose>
								<label for="chk">아이디 저장</label>
								<button type="submit" class="btnLogin">로그인</button>
							</div>
						</div>
					</div>
				</div><!-- //section -->
			</div><!-- //content -->
			<input type="hidden" name="loginRedirect" value="${loginRedirect}" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>