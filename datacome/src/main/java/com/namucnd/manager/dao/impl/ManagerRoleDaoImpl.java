package com.namucnd.manager.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.namucnd.manager.dao.ManagerRoleDao;
import com.namucnd.manager.domain.Manager;

/**
 * <pre>
 * Manager Role Dao implementation
 * </pre>
 * @FileName ManagerRoleDaoImpl.java
 * @Package com.univeramall.manager.dao.impl
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
@Repository
public class ManagerRoleDaoImpl implements ManagerRoleDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

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
		return sqlSessionTemplate.insert("managerRole.addList", manager);
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
		return sqlSessionTemplate.delete("managerRole.removeList", manager);
	}

}
