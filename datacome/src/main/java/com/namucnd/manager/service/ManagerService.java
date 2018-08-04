package com.namucnd.manager.service;

import com.namucnd.manager.domain.Manager;

/**
 * <pre>
 * 관리자 Service
 * </pre>
 * 
 * @FileName ManagerService.java
 * @Package com.univeramall.manager.service
 * @Organization
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
public interface ManagerService  {

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
	public Manager readSignin(Manager manager) throws Exception;

}
