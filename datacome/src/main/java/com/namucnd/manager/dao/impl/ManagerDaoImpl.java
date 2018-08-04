package com.namucnd.manager.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.namucnd.manager.dao.ManagerDao;
import com.namucnd.manager.domain.Manager;

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
public class ManagerDaoImpl implements ManagerDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Integer add(Manager manager) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer edit(Manager manager) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer remove(Manager manager) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * <pre>
	 * 로그인 정보 select
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 2. 14.
	 * @param manager
	 * @return
	 * @throws Exception
	 */
	public Manager readSignin(Manager manager) throws Exception {
		return sqlSessionTemplate.selectOne("manager.readSignin", manager);
	}

	public Integer loginInfoEdit(Manager manager){
		return sqlSessionTemplate.update("manager.logininfoedit", manager);
	}
	
	public Integer insertMngrLog(Manager manager){
		return sqlSessionTemplate.insert("manager.insertMngrLog", manager);
	}
	
	public Integer insertMngrFail(Manager manager){
		return sqlSessionTemplate.insert("manager.insertMngrFail", manager);
	}
	
	public Integer readFailManager(Manager manager){
		return sqlSessionTemplate.selectOne("manager.readFailManager", manager);
	}
	
	public String readFailTimeoverManager(Manager manager){
		return sqlSessionTemplate.selectOne("manager.readFailTimeoverManager", manager);
	}
	
	public Integer deleteManagerFailLogin(Manager manager){
		return sqlSessionTemplate.selectOne("manager.deleteManagerFailLogin", manager);
	}
	
	public Integer deleteLoginFail(){
		return sqlSessionTemplate.selectOne("manager.deleteLoginFail");
	}
	
}
