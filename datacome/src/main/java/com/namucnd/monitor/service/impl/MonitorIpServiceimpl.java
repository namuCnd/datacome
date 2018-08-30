package com.namucnd.monitor.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.namucnd.monitor.dao.MonitorIpDao;
import com.namucnd.monitor.domain.MonitorIp;
import com.namucnd.monitor.service.MonitorIpService;

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
@Service("monitorIpService")
public class MonitorIpServiceimpl implements MonitorIpService {

	@Autowired
	MonitorIpDao monitorIpDao;
	
	@Override
	public int insertReqIp(MonitorIp monitorIp) throws Exception {
		// TODO Auto-generated method stub
		return monitorIpDao.insertReqIp(monitorIp);
	}
	
	
}