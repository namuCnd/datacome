package com.namucnd.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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

		String ajaxHeader = req.getHeader("X-Ajax-call");
    	String result = "";
    	if (ajaxHeader == null) {
    		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    		Object principal = auth.getPrincipal();
    		if(principal instanceof UserDetails){
    			String username = ((UserDetails) principal).getUsername();
    			req.setAttribute("username", username);
    		}
    		req.setAttribute("errormsg", ade);
    		req.getRequestDispatcher(errorPage).forward(req, res);
    	} else {
    		if ("true".equals(ajaxHeader)) {
    			result = ade.getMessage();
    		} else {
    			result = "Access Denied";
    		}
    		res.getWriter().print(result);
    		res.getWriter().flush();
    	}
        res.sendRedirect(errorPage);
	}
	
	public void setErrorPage(String errorPage) {
		this.errorPage = errorPage;
	}

}
