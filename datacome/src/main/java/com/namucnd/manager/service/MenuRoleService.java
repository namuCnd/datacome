package com.namucnd.manager.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import com.namucnd.manager.domain.ManagerRole;
import com.namucnd.manager.domain.MenuRole;
import com.namucnd.manager.domain.Role;

/**
 * <pre>
 * Menu Role Service
 * </pre>
 * @FileName MenuRoleService.java
 * @Package com.univeramall.menu.service
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
public interface MenuRoleService {

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
	
	public String adminAdd(MenuRole menuRole);
	
	public String adminEdit(MenuRole menuRole);

	public String roleIdCheck(ManagerRole managerRole);

	public ModelMap adminRemove(MenuRole menuRole);
}
