package com.namucnd.monitor.dao;

import com.namucnd.monitor.domain.MonitorIp;

/**
 * <pre>
 * ReservBoardDao dao
 * </pre>
 * @FileName ReservBoardDao.java
 * @Package com.namucnd.reservboard.dao
 * @Organization 
 * @author jinu
 * @since 2018. 2. 26.
 * 
 */
public interface MonitorIpDao {

	public int insertReqIp(MonitorIp monitorIp) throws Exception;
}