package com.namucnd.manager.dao;

import com.namucnd.manager.domain.Manager;

/**
 * <pre>
 * Manager Dao
 * </pre>
 * 
 * @FileName ManagerDao.java
 * @Package com.univeramall.manager.dao
 * @Organization
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
public interface ManagerRoleDao {
	

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