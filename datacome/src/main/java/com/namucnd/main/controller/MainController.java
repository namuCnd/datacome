package com.namucnd.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.namucnd.user.domain.Users;
import com.namucnd.user.service.UsersService;

@Controller
public class MainController {
	
	// log사용을 위해 선언
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	UsersService usersService;
	
	@RequestMapping(value="/main/main.do")
	public String main(HttpServletRequest request, ModelMap model, HttpSession session,
			Users users) throws Exception {
		
		System.out.println("users:"+ users.toString());
		
		return "/home.default";
	}

}