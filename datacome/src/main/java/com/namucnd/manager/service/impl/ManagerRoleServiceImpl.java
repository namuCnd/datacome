package com.namucnd.manager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.namucnd.manager.dao.ManagerRoleDao;
import com.namucnd.manager.domain.Manager;
import com.namucnd.manager.service.ManagerRoleService;

/**
 * <pre>
 * Manager Role Service implementation
 * </pre>
 * @FileName ManagerRoleServiceImpl.java
 * @Package com.univeramall.manager.service.impl
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
@Service
public class ManagerRoleServiceImpl implements ManagerRoleService {

	@Autowired
	ManagerRoleDao dao;

	/**
	 * <pre>
	 * 관리자 role 추가 (list input)
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 19.
	 * @param manager
	 * @return
	 */
	public Integer addList(Manager manager) {
		return dao.addList(manager);
	}
	
	/**
	 * <pre>
	 * 관리자 role 삭제
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 19.
	 * @param manager
	 * @return
	 */
	public Integer removeList(Manager manager) {
		return dao.removeList(manager);
	}
	
}
