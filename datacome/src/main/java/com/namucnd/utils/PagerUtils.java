package com.namucnd.utils;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;

/**
 * <pre>
 * 페이징 Utility
 * </pre>
 * @FileName Pager.java
 * @Package com.univeramall.utils
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2013. 10. 12. 
 */
public class PagerUtils {

	final static Long dftTotalRecords = 0L;
	static String dftSiteId = "dft";
	static String dftSiteType = "admin";
	static String dftTemplate = "default";
	static Integer dftMaxResult = 10;
	final static String globalProperty = "/config/globals.properties";

	/**
	 * <pre>
	 * 
	 * </pre>
	 * @Constructor
	 * @author Sorcerer.Picoo
	 * @since 2013. 10. 12. 
	 */
	static {
		try {
			Properties p = new Properties();
			Reader reader = new InputStreamReader(PagerUtils.class.getResourceAsStream(globalProperty));
			p.load(reader);
			reader.close();

			dftSiteId = p.getProperty("site.id");
			dftSiteType = p.getProperty("site.type");
			dftTemplate = p.getProperty("template");
			dftMaxResult = Integer.parseInt(p.getProperty("paginate.maxResult"));

		} catch (FileNotFoundException fileNotFount) {
			fileNotFount.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}
	
	/**
	 * <pre>
	 * 총 페이지 개수 리턴
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2013. 10. 12. 
	 * @param totalRecords_	: 전체 게시물 개수
	 * @param maxResult_	: 페이지당 게시물 수
	 * @return
	 */
	public static Integer getTotalPages(Object _totalRecords, Object _maxResult) {
		Long total = 0L;
		Long totalRecords = Long.valueOf(StringUtils.defaultIfEmpty(_totalRecords.toString(), dftTotalRecords.toString()));
		Long maxResult = Long.valueOf((_maxResult == null) ? dftMaxResult.toString() : _maxResult.toString());
		
		// 전체 페이지 네비게이션 개수 구하기
		try {
			if (totalRecords % maxResult != 0) {
				total = ( totalRecords / maxResult ) + 1;
			} else {
				total = ( totalRecords / maxResult );
			}
		} catch(Exception e) {
			total = 0L;
		}
		return total.intValue();
	}

	/**
	 * <pre>
	 * 현재 페이지 시작 rownum-1
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2013. 10. 12. 
	 * @param maxResult		: 페이지당 게시물 수
	 * @param pageNumber	: 현재 페이지 번호
	 * @return
	 */
	public static Integer getFirstResult(Integer maxResult, Integer pageNumber) {
		Integer firstResult = 0;

		maxResult = (maxResult==null) ? dftMaxResult : maxResult;
		pageNumber = (pageNumber==null) ? dftMaxResult : pageNumber;
		
		try {
			firstResult = (pageNumber-1) * maxResult;
		} catch(Exception e) {
			firstResult = 0;
		}
		
		return firstResult;
	}

	/**
	 * <pre>
	 * 현재 페이지 마지막 rownum 번호
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2013. 10. 12. 
	 * @param maxResult		: 페이지당 게시물 수
	 * @param pageNumber	: 현재 페이지 번호
	 * @return
	 */
	public static Integer getLastResult(Integer maxResult, Integer pageNumber) {
		Integer lastResult = 0;
		maxResult = (maxResult==null) ? dftMaxResult : maxResult;
		pageNumber = (pageNumber==null) ? dftMaxResult : pageNumber;

		try {
			lastResult = pageNumber * maxResult;
		} catch(Exception e) {
			lastResult = 0;
		}
		
		return lastResult;
	}
	
	public static Integer getMaxResult() {
		return dftMaxResult;
	}
	
	public static String getSiteId() {
		return dftSiteId;
	}
	
	public static String getTemplate() {
		return dftTemplate;
	}

	public static String getSiteType() {
		return dftSiteType;
	}
	
}