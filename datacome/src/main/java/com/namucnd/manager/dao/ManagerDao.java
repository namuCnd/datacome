package com.namucnd.manager.dao;

import com.namucnd.manager.domain.Manager;

/**
 * <pre>
 * Manager Dao
 * </pre>
 * 
 * @FileName ManagerDao.java
 * @Package com.univeramall.manager.dao
 * @Organization
 * @author Sorcerer.Picoo
 * @since 2015. 9. 23.
 * 
 */
public interface ManagerDao {
	
	public Integer add(Manager manager) throws Exception;
	
	public Integer edit(Manager manager) throws Exception;
	
	public Integer remove(Manager manager) throws Exception;
	
	
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
	
	/**
	 * <pre>
	 * Edit data
	 * </pre>
	 * 
	 * @author univera.JW
	 * @since 2017. 04. 20
	 * @param entity
	 *            : edit entity
	 * @return
	 * @throws Exception
	 */
	public Integer loginInfoEdit(Manager manager) throws Exception;
	
	/**
	 * <pre>
	 * Manager log data
	 * </pre>
	 * 
	 * @author univera.tsmin
	 * @since 2017. 09. 20 
	 * @return
	 * @throws Exception
	 */
	public Integer insertMngrLog(Manager manager) throws Exception;
	
	/**
	 * <pre>
	 * Manager 로그인 실패 등록
	 * </pre>
	 * 
	 * @author univera.tsmin
	 * @since 2017. 10. 20 
	 * @return
	 * @throws Exception	
	 */
	public Integer insertMngrFail(Manager manager);
	
	/**
	 * <pre>
	 * Manager 로그인 실패 횟수. 
	 * </pre>
	 * 
	 * @author univera.tsmin
	 * @since 2017. 10. 20 
	 * @return
	 * @throws Exception	
	 */
	public Integer readFailManager(Manager manager);
	
	//manager 로그인 5회 실패 시간 체크
	public String readFailTimeoverManager(Manager manager);
	
	//manager 로그인 실패 데이터 삭제
	public Integer deleteManagerFailLogin(Manager manager);
	
	//web, admin 로그인 실패 로그 삭제 처리
	public Integer deleteLoginFail();
	
}