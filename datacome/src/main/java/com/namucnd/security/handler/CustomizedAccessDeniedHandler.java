package com.namucnd.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

/**
 * <pre>
 * 로그인 실패시 실행
 * </pre>
 * 
 * @FileName CustomizedAccessDeniedHandler.java
 * @Package com.namucnd.security.handler
 * @Organization
 * @author jinu
 * @since 2018. 4. 12.
 * 
 */
public class CustomizedAccessDeniedHandler implements AccessDeniedHandler {

	private static final Logger logger = LoggerFactory.getLogger(CustomizedAccessDeniedHandler.class);
	private String errorPage;
	
	@Override
	public void handle(HttpServletRequest req, HttpServletResponse res, AccessDeniedException ade) throws IOException, ServletException {
		// TODO Auto-generated method stub
		logger.info("Exceiption : {}", ade);
		logger.info("LocalizedMessage : {}", ade.getLocalizedMessage());
		logger.info("Message : {}", ade.getMessage());
		logger.info("StackTrace : {}", ade.getStackTrace());

		req.setAttribute("errMsg", ade.getMessage());
		req.getRequestDispatcher("/WEB-INF/views/user/denied.jsp").forward(req, res);
	}
	
	public void setErrorPage(String errorPage) {
		this.errorPage = errorPage;
	}

}
