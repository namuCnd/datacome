package com.namucnd.user.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.namucnd.user.dao.UsersDao;
import com.namucnd.user.domain.Users;

/**
 * <pre>
 * Users dao
 * </pre>
 * @FileName UsersDaoImpl.java
 * @Package com.univeramall.user.dao.impl
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2018. 2. 26.
 * 
 */
@Repository
public class UsersDaoImpl implements UsersDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Users readOne(Users users) throws Exception {
		System.out.println("dao");
		return sqlSessionTemplate.selectOne("users.readOne", users);
	}
}