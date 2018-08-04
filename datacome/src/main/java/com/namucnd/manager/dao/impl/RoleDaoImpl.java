package com.namucnd.manager.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.namucnd.manager.dao.RoleDao;
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
public class RoleDaoImpl implements RoleDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	

	@Override
	public Integer add(Role role) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Integer edit(Role role) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



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
	public List<Role> readRoleList() throws Exception {
		return sqlSessionTemplate.selectList("role.readRoleList");
	}

}
