package com.namucnd.utils;

import org.apache.commons.lang3.StringUtils;

/**
 * <pre>
 * Create Sequence ID
 * </pre>
 * @FileName Sequence.java
 * @Package com.univeramall.utils
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2013. 10. 12. 
 */
public class SequenceUtils {

	/**
	 * <pre>
	 * 
	 * </pre>
	 * @Constructor
	 * @author Sorcerer.Picoo
	 * @since 2013. 10. 12. 
	 */
	public SequenceUtils() {
	}

	/**
	 * <pre>
	 * Create ID
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2013. 10. 12. 
	 * @param prefix	: 앞에 붙일 기본문자
	 * @param idx		: 번호
	 * @return
	 */
	public static String zeroFill(String prefix, Object idx) {
		return prefix + StringUtils.leftPad(String.valueOf(idx), 10, "0");
	}

	/**
	 * <pre>
	 * Create ID
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2013. 10. 12. 
	 * @param prefix	: 앞에 붙일 기본문자
	 * @param idx		: 번호
	 * @param precision	: 자리수
	 * @return
	 */
	public static String zeroFill(String prefix, Object idx, Integer precision) {
		return prefix + StringUtils.leftPad(String.valueOf(idx), precision, "0");
	}
}
