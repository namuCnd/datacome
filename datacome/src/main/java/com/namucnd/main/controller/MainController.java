package com.namucnd.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.namucnd.monitor.domain.MonitorIp;
import com.namucnd.monitor.service.MonitorIpService;
import com.namucnd.user.domain.Users;

@Controller
public class MainController {

	// log사용을 위해 선언
	Logger logger = LoggerFactory.getLogger(this.getClass());

	/*@Autowired
	MonitorIpService monitorIpService;*/

	@RequestMapping(value = "/main/main.do")
	public String main(HttpServletRequest request, ModelMap model, HttpSession session, Users users) throws Exception {

		String ip = request.getHeader("X-FORWARDED-FOR");

		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("Proxy-Client-IP");
		}

		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("WL-Proxy-Client-IP"); // 웹로직
		}

		if (ip == null || ip.length() == 0) {
			ip = request.getRemoteAddr();
		}
		MonitorIp monitorIp = new MonitorIp();
		monitorIp.setReq_ip(ip);
		
		//monitorIpService.insertReqIp(monitorIp);

		return "/home.default";
	}

}