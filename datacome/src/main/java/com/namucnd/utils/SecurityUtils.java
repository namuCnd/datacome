package com.namucnd.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.security.crypto.bcrypt.BCrypt;

/**
 * <pre>
 * 암호화 관련 Util
 * - web/mobile쪽에 따로 들어있던 것을 공통으로 위치 옮김
 * </pre>
 * @FileName SecurityUtils.java
 * @Package com.univeramall.utils
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2018. 3. 27.
 * 
 */
public class SecurityUtils {

	SecurityUtils() {}
	
	final static int MIN_PASSWORD_LENGTH = 8;
	final static int MAX_PASSWORD_LENGTH = 16;
	final static int SMALL_LETTER_CONSTANT = 55;
	final static int CAPITAL_LETTER_CONSTANT = 61;

	/**
	 * <pre>
	 * Bcrypt 암호화
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 3. 27.
	 * @param password
	 * @param salt
	 * @return
	 */
	public static String encodeBCrypt(String password, Integer salt) {
		return BCrypt.hashpw(password, (salt == null)? BCrypt.gensalt(11) : BCrypt.gensalt(salt));
	}

	/**
	 * <pre>
	 * 비밀버호 비교 모듈
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 3. 27.
	 * @param password
	 * @param encodePassword
	 * @return
	 */
	public static boolean validateBCrypt(String password, String encodePassword) {
		return BCrypt.checkpw(password, encodePassword);
	}
	
	/**
	 * <pre>
	 * 회원초대에 사용되는 토큰
	 * </pre>
	 * @author Sorcerer.Picoo
	 * @since 2018. 3. 27.
	 * @param userName
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	public static String getInviteToken(String userName) throws NoSuchAlgorithmException {

		long time = System.currentTimeMillis();
		String source = encodeBCrypt(userName+time, null);
		 
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(source.getBytes());
		 
		byte[] hashValue = md.digest();
		return hashValue.toString();
	}
}