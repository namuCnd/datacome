package com.namucnd.user.dao;

import com.namucnd.user.domain.Users;

/**
 * <pre>
 * Users dao
 * </pre>
 * @FileName UsersDao.java
 * @Package com.univeramall.user.dao
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2018. 2. 26.
 * 
 */
public interface UsersDao {

	public Users readOne(Users users) throws Exception;
	
}