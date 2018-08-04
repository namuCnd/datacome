package com.namucnd.manager.service;

import com.namucnd.manager.domain.Manager;

/**
 * <pre>
 * Manager Role Service
 * </pre>
 * @FileName ManagerRoleService.java
 * @Package com.univeramall.manager.service
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
public interface ManagerRoleService {

	/**
	 * <pre>
	 * 관리자 role 추가 (list input)
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 19.
	 * @param manager
	 * @return
	 */
	public Integer addList(Manager manager);
	
	/**
	 * <pre>
	 * 관리자 role 삭제
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 19.
	 * @param manager
	 * @return
	 */
	public Integer removeList(Manager manager);
}
