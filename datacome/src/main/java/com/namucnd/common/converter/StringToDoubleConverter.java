package com.namucnd.common.converter;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.convert.converter.Converter;

/**
 * <pre>
 * 테스트용 샘플
 * </pre>
 * @FileName StringToIntegerConverter.java
 * @Package com.univeramall.common.converter
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2013. 10. 12. 
 */
public class StringToDoubleConverter  implements Converter<String, Double>{
	
	public Double convert(String val){
		return (StringUtils.isEmpty(val)) ? null : Double.parseDouble(val);
	}
}
