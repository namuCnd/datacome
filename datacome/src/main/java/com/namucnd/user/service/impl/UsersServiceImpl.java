package com.namucnd.user.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.namucnd.user.dao.UsersDao;
import com.namucnd.user.domain.Users;
import com.namucnd.user.service.UsersService;

/**
 * <pre>
 * Users service
 * </pre>
 * @FileName UsersServiceImpl.java
 * @Package com.univeramall.user.service.impl
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2018. 2. 26.
 * 
 */
@Service
public class UsersServiceImpl implements UsersService { 
	
	// log사용을 위해 선언
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	UsersDao dao;

	public Users readOne(Users users) throws Exception {
		
		System.out.println("service");
		return dao.readOne(users);
	}
	
}