package com.namucnd.security.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.namucnd.security.domain.UsersDetails;
import com.namucnd.user.dao.UsersDao;
import com.namucnd.user.domain.Users;

/**
 * <pre>
 * spring security 커스터마이징 소스
 * </pre>
 * 
 * @FileName CustomizedUserDetailsService.java
 * @Package com.univeramall.security.service
 * @Organization
 * @author Sorcerer.Picoo
 * @since 2015. 9. 22.
 * 
 */
@Service("customizedUserDetailsService")
public class CustomizedUserDetailsService implements UserDetailsService {

	// log사용을 위해 선언
	Logger logger = LoggerFactory.getLogger(this.getClass());

	private UsersDao usersDao;

	/**
	 * <pre>
	 * 로긴 처리부분
	 * </pre>
	 * 
	 * @author jinu
	 * @since 2015. 9. 22.
	 * @param username
	 * @return
	 * @throws UsernameNotFoundException
	 */
	@Override
	public UsersDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("11111111111111111111");
		System.out.println("11111111111111111111");
		System.out.println("11111111111111111111");
		System.out.println("11111111111111111111");
		System.out.println("11111111111111111111");
		System.out.println("11111111111111111111");
		System.out.println("11111111111111111111");
		System.out.println("11111111111111111111");
		System.out.println("11111111111111111111");
		System.out.println("11111111111111111111");
		System.out.println("11111111111111111111");
		System.out.println("11111111111111111111");
		// 세션에 담을 객체
		UsersDetails usersDetails = new UsersDetails();
		// Select 결과를 담을 객체
		Users users = new Users();
		
		users.setUser_id(username);

		/**
		 * 1. 로그인 대상자 조회
		 */
		try {
			users = usersDao.readOne(users);
		} catch (Exception e) {
			e.printStackTrace();
		}

		/**
		 * 2. 대상자가 없을 경우 로긴 중지
		 */
		if (users == null)
			throw new UsernameNotFoundException(username);
		/**
		 * 4. 권한 반영
		 */
		// 권한 (Role list 생성)
		List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
		list.add(new SimpleGrantedAuthority("ROLE_USER")); // 로그인 성공 시 security.xml   값  ROLE_USER   넘겨준다

		usersDetails.setUsername(users.getUser_id());
		usersDetails.setPassword(users.getUser_pw());
		usersDetails.setAuthorities(list);

		// 세션에 담을 user 정보
		usersDetails.setUsers(users);
		
		return usersDetails;
	}

	public UsersDao getUsersDao() {
		return usersDao;
	}

	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

}