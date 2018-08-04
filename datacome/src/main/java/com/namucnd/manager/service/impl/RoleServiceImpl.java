package com.namucnd.manager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.namucnd.manager.dao.RoleDao;
import com.namucnd.manager.domain.Role;
import com.namucnd.manager.service.MenuRoleService;
import com.namucnd.manager.service.RoleService;

/**
 * <pre>
 * Role Service implementation
 * </pre>
 * @FileName RoleServiceImpl.java
 * @Package com.univeramall.manager.service.impl
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	RoleDao dao;

	@Autowired
	private MenuRoleService menuRoleService;
	
	/**
	 * <pre>
	 * 권한 추가 
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 23.
	 * @param role
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public Integer add(Role role) throws Exception {
		Integer result = 0;
		
		/**
		 * 1. role 추가
		 */
		dao.add(role);
		
		/**
		 * 2. 메뉴별 권한 추가
		 */
		result = menuRoleService.addList(role);
		
		return result;
	}
	
	/**
	 * <pre>
	 * 권한 수정
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 23.
	 * @param role
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public Integer edit(Role role) throws Exception {
		Integer result = 0;
		
		/**
		 * 1. role 수정
		 */
		dao.edit(role);
		
		/**
		 * 2. 메뉴별 권한 추가
		 */
		// 2.1. 기존권한 삭제
		menuRoleService.removeList(role);
		// 2.2. 추가
		result = menuRoleService.addList(role);
		
		return result;
	}
	
}
