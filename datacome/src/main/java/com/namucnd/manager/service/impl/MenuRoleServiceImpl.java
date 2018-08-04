package com.namucnd.manager.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.namucnd.manager.dao.MenuRoleDao;
import com.namucnd.manager.domain.ManagerRole;
import com.namucnd.manager.domain.MenuRole;
import com.namucnd.manager.domain.Role;
import com.namucnd.manager.service.MenuRoleService;

/**
 * <pre>
 * Menu Role Service implementation
 * </pre>
 * @FileName MenuRoleServiceImpl.java
 * @Package com.univeramall.menu.service.impl
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
@Service
public class MenuRoleServiceImpl implements MenuRoleService {
	
	@Autowired
	MenuRoleDao dao;
	
	/**
	 * <pre>
	 * 메뉴기반 권한 정보
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 21.
	 * @param menuRoleParam
	 * @return
	 */
	public List<MenuRole> readRoleByMenuList (MenuRole menuRole) {
		return dao.readRoleByMenuList(menuRole);
	}
	
	/**
	 * <pre>
	 * 메뉴별 권한 추가 (list input)
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 19.
	 * @param manager
	 * @return
	 */
	public Integer addList(Role role) {
		return dao.addList(role);
	}
	
	/**
	 * <pre>
	 * 메뉴별 권한 삭제
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 19.
	 * @param manager
	 * @return
	 */
	public Integer removeList(Role role) {
		return dao.removeList(role);
	}
	
	@Override
	public String adminAdd(MenuRole menuRole) {
		
		String status = "false";
		
		if(menuRole.getMenu_id() == null || StringUtils.isEmpty(menuRole.getMenu_id()) || menuRole.getRole_id() == null || StringUtils.isEmpty(menuRole.getRole_id())) {
			return status;
		}
		
		menuRole.setRole_id(menuRole.getRole_id().toUpperCase());
		menuRole.setSite_id("web");
		menuRole.setUse_yn("Y");
		
		ManagerRole managerRole = new ManagerRole();
		managerRole.setRole_id(menuRole.getRole_id());
		managerRole.setMngr_id(menuRole.getLoginId());
		managerRole.setSite_id("web");
		managerRole.setUse_yn("Y");
		
		if(dao.addMngRole(managerRole) < 1) {
			return status;
		}
	
		String munu_id[] = menuRole.getMenu_id().split(",");
		for (int i = 0, iLen = munu_id.length; i < iLen; i++) {
			menuRole.setMenu_id(munu_id[i]);
			if(dao.add(menuRole) < 0){
				status = "false";
				break;
			} else {
				status = "complete";
			}
		}
		return status;
	}
	
	@Override
	public String adminEdit(MenuRole menuRole) {
		
		String status = "false";
		
		if(menuRole.getMenu_id() == null || StringUtils.isEmpty(menuRole.getMenu_id()) || menuRole.getRole_id() == null || StringUtils.isEmpty(menuRole.getRole_id())) {
			return status;
		}
		
		MenuRole mr = new MenuRole();
		mr.setRole_id(menuRole.getRole_id());
		dao.remove(mr);
		
		String munu_id[] = menuRole.getMenu_id().split(",");
		for (int i = 0, iLen = munu_id.length; i < iLen; i++) {
			menuRole.setMenu_id(munu_id[i]);
			menuRole.setSite_id("web");
			menuRole.setUse_yn("Y");
			if(dao.add(menuRole) < 0){
				status = "false";
				break;
			} else {
				status = "complete";
			}
		}
		return status;
	}

	@Override
	public ModelMap adminRemove(MenuRole menuRole) {
		
		ModelMap model = new ModelMap();
		
		String status = "false";
		
		if(menuRole.getRole_id() != null && !StringUtils.isEmpty(menuRole.getRole_id())) {
			
			ManagerRole managerRole = new ManagerRole();
			managerRole.setRole_id(menuRole.getRole_id());
			
			if(status.equals(roleIdCheck(managerRole))) {
				model.addAttribute("message", "부운영자 관리에서 권한을 사용중인 아이디가 있습니다.");
				
			} else {
				int result = 0;
				MenuRole mr = new MenuRole();
				mr.setRole_id(menuRole.getRole_id());
				result = dao.removeMngRole(mr);
				
				if(result > 0) {
					dao.remove(mr);
					status = "complete";
				}
			}
		}
		
		model.addAttribute("status", status);
		
		return model;
	}

	@Override
	public String roleIdCheck(ManagerRole managerRole) {
		
		String status = "false";
		
		if(managerRole.getRole_id() == null || StringUtils.isEmpty(managerRole.getRole_id())) {
			return status;
		}
		
		managerRole.setRole_id(managerRole.getRole_id().toUpperCase());
		if(dao.roleIdCheck(managerRole).size() > 0) {
			return status;
			
		} else {
			status = "ok";
		}
		
		return status;
	}
}
