package com.namucnd.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.namucnd.security.domain.UsersDetails;
import com.namucnd.user.dao.UsersDao;
import com.namucnd.user.domain.Users;

/**
 * <pre>
 * 로그인 성공후 실행
 * </pre>
 * @FileName CustomizedAuthenticationSuccessHandler.java
 * @Package com.univeramall.security.handler
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2018. 4. 12.
 * 
 */
public class CustomizedAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	private RequestCache requestCache = new HttpSessionRequestCache();

	private String defaultUrl;

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	private UsersDao usersDao;
	
	private MessageSource messageSource;
	
	public CustomizedAuthenticationSuccessHandler(){
		defaultUrl = "/";
	}
	
	public String getDefaultUrl() {
		return defaultUrl;
	}
	
	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}
	
	/**
	 * <pre>
	 * 
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 5. 29.
	 * @param request
	 * @param response
	 * @param authentication
	 * @throws IOException
	 * @throws ServletException
	 */
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		
		/**
		 * 1. redirect url 확인
		 */
		String redirectResult = decideRedirectStrategy(request, response);
		
		UsersDetails usersDetails = (UsersDetails) authentication.getPrincipal();
		Users users = usersDetails.getUsers();

		redirectStrategy.sendRedirect(request, response, redirectResult);
	}

	/**
	 * <pre>
	 * 
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 5. 29.
	 * @param request
	 * @param response
	 * @return
	 */
	private String decideRedirectStrategy(HttpServletRequest request, HttpServletResponse response) {
		SavedRequest savedRequest = requestCache.getRequest(request, response);

		String savedRedirectUrl = "";
		String redirectUrl = "";
		String referer = "";
		String signinUrl="/security/signin";

		// spring redirecturl
		try {
			savedRedirectUrl = savedRequest.getRedirectUrl();
		} catch (Exception e) {}
		// 수동 redirecturl
		try {
			redirectUrl = request.getSession().getAttribute("redirectUrl").toString();
		} catch (Exception e) {}
		// referer .json파일일 경우 처리
		try {
			referer = request.getSession().getAttribute("referer").toString();
		} catch (Exception e) {}
		/**
		 * Session clear
		 */
		request.getSession().setAttribute("redirectUrl", null);
		request.getSession().setAttribute("referer", null);

		/**
		 * 1. redirectUrl이 존재할 경우
		 */
		if(StringUtils.isNotEmpty(redirectUrl)) {
			return redirectUrl;
		}
		
		/**
		 * 2. 확장자가 .json일 경우 login페이지의 referer로 보냄
		 */
		if(StringUtils.contains(savedRedirectUrl, ".json")&&!StringUtils.contains(savedRedirectUrl, signinUrl)) {
			return referer;
		}
		
		/**
		 * 3. 보통의 경우 : savedRequest.getRedirectUrl() 
		 */
		if(StringUtils.isNotEmpty(savedRedirectUrl)&&!StringUtils.contains(savedRedirectUrl, signinUrl)) {
			return savedRedirectUrl;
		}
		
		/**
		 * 4. 현재페이지가 없으면 이전페이지로 이동시킴
		 */
		if(StringUtils.isNotEmpty(referer)&&!StringUtils.contains(referer, signinUrl)) {
			return referer;
		}
		
		/**
		 * 5. 이도저도 없을 때 defaultUrl
		 */
		return this.getDefaultUrl();
	}
	
	public UsersDao getUsersDao() {
		return usersDao;
	}

	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	public MessageSource getMessageSource() {
		return messageSource;
	}

	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
	}
}