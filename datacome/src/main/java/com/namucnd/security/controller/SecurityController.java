package com.namucnd.security.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.namucnd.user.service.UsersService;

@Controller
public class SecurityController {
	
	// log사용을 위해 선언
	Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Autowired
	UsersService usersService;
	
	/**
	 * <pre>
	 * 로그인
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 3. 21.
	 * @param request
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/security/signinForm")
	public String signinForm(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
		/**
		 * 1. login후 이동페이지 정보 저장
		 */
		String referer = request.getHeader("Referer");
		//String oldReferer = request.getSession().getAttribute("referer").toString();
		if(request.getSession().getAttribute("redirectUrl")==null)
			request.getSession().setAttribute("redirectUrl", request.getParameter("redirectUrl"));
		if(request.getSession().getAttribute("referer")==null)
			request.getSession().setAttribute("referer", referer);
		
		return "/security/signin/signinForm.default";
	}


	/**
	 * <pre>
	 * 
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 4. 12.
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/security/accessDenied")
	public String accessDined(ModelMap model) throws Exception {
		System.out.println("여기냐??");
		return "redirect:/main/main.do";
	}
	
}