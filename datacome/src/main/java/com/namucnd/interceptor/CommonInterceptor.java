package com.namucnd.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mobile.device.Device;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * CommonInterceptor
 * 공통상수, app 구별, Locale 설정
 * @author Paul Lee
 */
public class CommonInterceptor extends HandlerInterceptorAdapter {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Value("#{globals['svr.id']}")
	private String svrId;

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object obj) throws Exception {

		/*
		 * 모바일 접속 시 강제 리다이렉트
		 * 단, 모바일에서 PC보기로 접근한 경우 예외처리(쿠키로 구분)
		 */
		Device device = (Device) request.getAttribute("currentDevice");
		String pcview = (String) request.getParameter("pcview");
		HttpSession session = request.getSession();
		
		String sessionPcView = (String)session.getAttribute("pcview");
		
		if ("on".equals(pcview)) {
			session.setAttribute("pcview", "on");
			sessionPcView = (String)session.getAttribute("pcview");
		}
		
		/*if ("live".equals(svrId) && (device.isMobile() || device.isTablet())) {
			if (!"on".equals(sessionPcView)) {
				response.sendRedirect("http://m.univeramall.com/main/main.do");
				return false;
			}
		}*/

		//request.getHeader("REFERER");
		return true;
	}
	
	public static String getCookie(String cName, HttpServletRequest request){
 		
 		String str = "";
 		
 		Cookie[] cookies = request.getCookies();		// 요청정보로부터 쿠키를 가져온다.
 		
 		 int cookieFind = -1;
 		 
 		 for(int i=0;i<cookies.length;i++){
 			 if(cookies[i].getName().equals(cName)){
 				 cookieFind = i;
 				 break;
 			 }
 		 }
 		 if(cookieFind != -1){
 			 str = cookies[cookieFind].getValue();
 		 }
 		
 		return str;
	}
	
}
