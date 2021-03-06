package com.namucnd.security.service;

import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;

import com.namucnd.manager.dao.RoleDao;
import com.namucnd.manager.domain.Role;

/**
 * <pre>
 * Role hierarchy
 * 
 * </pre>
 * @FileName HierarchyStringFactoryBean.java
 * @Package com.univeramall.security.service
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2015. 9. 24.
 * 
 */
public class HierarchyStringFactoryBean implements FactoryBean<Object> {
	
	// log사용을 위해 선언
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private RoleDao roleDao;

	private String hierachy;
	
	private final static String EOL = System.getProperty("line.separator"); 
	
	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	@PostConstruct
	public void init() {
		getSecurityHierachyString();
	}
	
	/**
	 * <pre>
	 * Role 정보를 select하여 roleHierarchy에 등록
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 1. 9.
	 */
	public void getSecurityHierachyString() {
		StringBuffer sb = new StringBuffer();
		
		try {
			List<Role> roleList = roleDao.readRoleList();
			for(Role role : roleList) {
				sb.append("ROLE_"+role.getRole_parent_id()).append(">").append("ROLE_"+role.getRole_id());
				sb.append(EOL);
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		hierachy = sb.toString();
	}

	/**
	 * <pre>
	 * Object return
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2015. 9. 24.
	 * @return
	 * @throws Exception
	 */
	public Object getObject() throws Exception {
		if(StringUtils.isEmpty(hierachy)) getSecurityHierachyString();
		return hierachy;
	}

	/**
	 * <pre>
	 * String return
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2015. 9. 24.
	 * @return
	 */
	public Class<?> getObjectType() {
		return String.class;
	}

	/**
	 * <pre>
	 * 
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2015. 9. 24.
	 * @return
	 */
	public boolean isSingleton() {
		return true;
	}


}
