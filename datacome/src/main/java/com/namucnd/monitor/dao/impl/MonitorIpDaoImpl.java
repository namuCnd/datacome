package com.namucnd.monitor.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.namucnd.monitor.dao.MonitorIpDao;
import com.namucnd.monitor.domain.MonitorIp;

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
public class MonitorIpDaoImpl implements MonitorIpDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertReqIp(MonitorIp monitorIp) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("monitor.insertReservBoard");
	}
	
	
}