package com.namucnd.common.formatter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.format.Formatter;

public class DateFormatter implements Formatter<Date> {

	@Autowired
	private MessageSource messageSource;
	
	@Override
	public String print(Date date, Locale locale) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(messageSource.getMessage("dateFormat",new Object[0] ,locale));

		return dateFormat.format(date);
	}

	@Override
	public Date parse(String date, Locale locale) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat(messageSource.getMessage("dateFormat",new Object[0] ,locale));
		dateFormat.setLenient(false);
		
		return dateFormat.parse(date);
	}
}
