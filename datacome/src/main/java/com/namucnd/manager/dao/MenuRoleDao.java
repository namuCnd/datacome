package com.namucnd.manager.dao;

import java.util.List;

import com.namucnd.manager.domain.ManagerRole;
import com.namucnd.manager.domain.MenuRole;
import com.namucnd.manager.domain.Role;

/**
 * <pre>
 * Menu Role Dao
 * </pre>
 * @FileName MenuRoleDao.java
 * @Package com.univeramall.menu.dao
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
public interface MenuRoleDao {

	/**
	 * <pre>
	 * 메뉴기반 권한 정보
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 21.
	 * @param menuRoleParam
	 * @return
	 */
	public List<MenuRole> readRoleByMenuList (MenuRole menuRole);

	/**
	 * <pre>
	 * 메뉴별 권한 추가 (list input)
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 19.
	 * @param manager
	 * @return
	 */
	public Integer addList(Role role);
	
	/**
	 * <pre>
	 * 메뉴별 권한 삭제
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 19.
	 * @param manager
	 * @return
	 */
	public Integer removeList(Role role);
	
	public Integer add(MenuRole menuRole);
	
	public Integer remove(MenuRole menuRole);

	public Integer removeMngRole(MenuRole menuRole);

	public List<ManagerRole> roleIdCheck(ManagerRole managerRole);
	
	public Integer addMngRole(ManagerRole managerRole);
}