package com.namucnd.manager.dao;

import java.util.List;

import com.namucnd.manager.domain.Role;

/**
 * <pre>
 * Role Dao
 * </pre>
 * 
 * @FileName RoleDao.java
 * @Package com.univeramall.manager.dao
 * @Organization
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
public interface RoleDao {
	
	public Integer add(Role role) throws Exception;
	
	public Integer edit(Role role) throws Exception;
	
	/**
	 * <pre>
	 * Role 기본 hierarchy 구조
	 * Spring security roleHierarchy에서 사용
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2015. 9. 24.
	 * @return
	 * @throws Exception
	 */
	public List<Role> readRoleList() throws Exception;

}