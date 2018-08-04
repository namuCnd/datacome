package com.namucnd.manager.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.namucnd.manager.dao.MenuRoleDao;
import com.namucnd.manager.domain.ManagerRole;
import com.namucnd.manager.domain.MenuRole;
import com.namucnd.manager.domain.Role;

/**
 * <pre>
 * Manager Dao Impl
 * </pre>
 * @FileName ManagerDaoImpl.java
 * @Package com.univeramall.manager.dao.impl
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
@Repository
public class MenuRoleDaoImpl implements MenuRoleDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

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
		return sqlSessionTemplate.selectList("menuRole.readRoleByMenuList", menuRole);
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
		return sqlSessionTemplate.insert("menuRole.addList", role);
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
		return sqlSessionTemplate.delete("menuRole.removeList", role);
	}
	
	@Override
	public Integer add(MenuRole menuRole) {
		return sqlSessionTemplate.insert("menuRole.add", menuRole);
	}

	@Override
	public Integer remove(MenuRole menuRole) {
		return sqlSessionTemplate.delete("menuRole.remove", menuRole);
	}

	@Override
	public Integer removeMngRole(MenuRole menuRole) {
		return sqlSessionTemplate.delete("menuRole.removeMngRole", menuRole);
	}

	@Override
	public List<ManagerRole> roleIdCheck(ManagerRole managerRole) {
		return sqlSessionTemplate.selectList("menuRole.roleIdCheck", managerRole);
	}
	
	@Override
	public Integer addMngRole(ManagerRole managerRole) {
		return sqlSessionTemplate.insert("menuRole.addMngRole", managerRole);
	}
}
