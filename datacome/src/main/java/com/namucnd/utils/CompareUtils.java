package com.namucnd.utils;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringEscapeUtils;

/**
 * <pre>
 * 비교 utility
 * </pre>
 * @FileName ConversionUtils.java
 * @Package com.univeramall.utils
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2014. 1. 12. 
 */
public class CompareUtils extends StringEscapeUtils {

	/**
	 * <pre>
	 * 코드 변환 
	 * </pre>
	 * @Constructor
	 * @author Sorcerer.Picoo
	 * @since 2013. 10. 12. 
	 */
	public CompareUtils() {

	}

	public static boolean contains(String[] array, String valueToFind) {
		return ArrayUtils.contains(array, valueToFind);
	}

	public static boolean contains(Integer[] array, Integer valueToFind) {
		return ArrayUtils.contains(array, valueToFind);
	}

}