package com.namucnd.bcrypt;

import com.namucnd.utils.AES256Cipher;

public class Bcrypt {

	@SuppressWarnings("static-access")
	public static void main(String[] args) throws Exception {

		String passwd = "1234";
		AES256Cipher a256 = AES256Cipher.getInstance();
		
		String encodeStr = a256.AES_Encode(passwd);
		
		System.out.println("encodeStr:"+ encodeStr);
		
		String decodeStr = a256.AES_Decode(encodeStr);
		System.out.println("decodeStr:"+ decodeStr);
	}

}
