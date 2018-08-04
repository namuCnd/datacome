package com.namucnd.manager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.namucnd.manager.dao.ManagerDao;
import com.namucnd.manager.domain.Manager;
import com.namucnd.manager.service.ManagerRoleService;
import com.namucnd.manager.service.ManagerService;

/**
 * <pre>
 * 관리자 Service implementation
 * </pre>
 * @FileName ManagerServiceImpl.java
 * @Package com.univeramall.manager.service.impl
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	ManagerDao dao;

	@Autowired
	ManagerRoleService managerRoleService;
	/**
	 * <pre>
	 * 관리자 추가
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 19.
	 * @param manager
	 * @return
	 */
	@Transactional
	public Integer add(Manager manager) throws Exception {
		Integer result = 0;
		
		/**
		 * 1. 관리자 정보 추가
		 */
		dao.add(manager);
		
		/**
		 * 2. 권한정보 추가
		 */
		result = managerRoleService.addList(manager);
		return result;
	}
	
	/**
	 * <pre>
	 * 관리자 정보수정
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 19.
	 * @param manager
	 * @return
	 */
	@Transactional
	public Integer edit(Manager manager) throws Exception {
		Integer result = 0;
		
		/**
		 * 1. 관리자 정보 추가
		 */
		dao.edit(manager);
		
		/**
		 * 2. 권한정보 수정
		 */
		// 2.1. 기존 정보 삭제
		managerRoleService.removeList(manager);
		// 2.2. 권한 insert
		result = managerRoleService.addList(manager);
		return result;
	}
	
	/**
	 * <pre>
	 * 관리자 삭제
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 19.
	 * @param manager
	 * @return
	 */
	@Transactional
	public Integer remove(Manager manager) throws Exception {
		/**
		 * 1. 관리자 정보 삭제
		 */
		return dao.remove(manager);
	}
	
	/**
	 * <pre>
	 * 로그인 정보 select
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 14.
	 * @param manager
	 * @return
	 * @throws Exception
	 */
	public Manager readSignin(Manager manager) throws Exception {
		return dao.readSignin(manager);
	}

}
