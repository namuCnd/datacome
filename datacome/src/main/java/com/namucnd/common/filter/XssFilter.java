package com.namucnd.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * @prjectName		: 삼성물산 gfom  
 * @Package		: com.samsungcnt.gfom.common.filter
 * @FileName		: XssFilter.java 
 * @Class			: XssFilter
 * @since			: 2012. 4. 2.
 * @author			: jungjinman
 * @Description	: 
 * @Modification Information
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *  2012. 4. 2.		jungjinman       신규개발
 * 
 * @Copyright (C) 삼성물산(주) All right reserved.
 * <pre>
 */
public class XssFilter implements Filter {
	
	
	@SuppressWarnings("unused")
	private FilterConfig filterConfig;
	
	/**
	 * @MethodName		: destroy
	 * @Date			: 2012. 4. 2. 
	 * @Author			: jungjinman
	 * @see javax.servlet.Filter#destroy()
	 * @Description	:
	 *
	 */
	@Override
	public void destroy() {
		filterConfig = null;
	}

	/**
	 * @MethodName		: doFilter
	 * @Date			: 2012. 4. 2. 
	 * @Author			: jungjinman
	 * @param arg0
	 * @param arg1
	 * @param arg2
	 * @throws IOException
	 * @throws ServletException
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 * @Description	:
	 *
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		chain.doFilter(new RequestWrapper((HttpServletRequest) request), response);
	}

	/**
	 * @MethodName		: init
	 * @Date			: 2012. 4. 2. 
	 * @Author			: jungjinman
	 * @param arg0
	 * @throws ServletException
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 * @Description	:
	 *
	 */
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

}
