package com.namucnd.utils;

import java.io.FileNotFoundException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.util.Log4jConfigurer;

/**
 * <pre>
 * Log4j 경로 설정
 * </pre>
 * @FileName CustomLog4jConfig.java
 * @Package com.univeramall.utils
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2016. 8. 31.
 * 
 */
public class CustomLog4jConfig implements InitializingBean {
	
	private static final Log logger = LogFactory.getLog( CustomLog4jConfig.class );

	private String location;
	private long refreshInterval;
	
	private String logdirKey = "webapp.logDir";
	
	public void setLocation( String location ) {
		this.location = location;
	}

	public void setRefreshInterval( long refreshInterval ) {
		this.refreshInterval = refreshInterval;
	}
	
	public void setLogdirKey( String logdirKey ) {
		this.logdirKey = logdirKey;
	}
	public void setLogdirValue( String logdir ) {
		String value = System.getProperty(logdirKey);
		if( value != null && !value.equals( logdir )) {
			throw new IllegalStateException("Logdir system property already set to different value: '" + logdirKey + "' = \"" + value + "\" instead of \"" + logdir + "\" - " + "Choose unique values for 'logdirKey' for every webapp!");
		}
		System.setProperty(logdirKey, logdir);
	}
	
	public void afterPropertiesSet() {
		if( location == null )
			return;
		
		try {
			if( refreshInterval == 0 )
				Log4jConfigurer.initLogging(location);
			else
				Log4jConfigurer.initLogging(location, refreshInterval);
			
		} 
		catch (FileNotFoundException e) {
			logger.error(e);
		}
		
		
	}
	
}
