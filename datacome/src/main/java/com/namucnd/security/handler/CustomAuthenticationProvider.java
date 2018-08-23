package com.namucnd.security.handler;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.namucnd.security.domain.UsersDetails;
import com.namucnd.security.service.CustomizedUserDetailsService;
import com.namucnd.utils.AES256Cipher;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	@Qualifier("userDetailsService")
	CustomizedUserDetailsService userService;

	@SuppressWarnings("static-access")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication; //유저가 입력한 정보를 이이디비번으으로만든다.(로그인한 유저아이디비번정보를담는다)
		AES256Cipher a256 = AES256Cipher.getInstance();
		
	    UsersDetails userInfo = userService.loadUserByUsername(authToken.getPrincipal().toString()); //UserDetailsService에서 유저정보를 불러온다.
	    
	    if (userInfo == null) {
	      throw new UsernameNotFoundException(authToken.getName());
	    }

	    if (!matchPassword(a256.AES_Decode(userInfo.getPassword()), authToken.getCredentials().toString())) {
	      throw new BadCredentialsException("not matching username or password");
	    }

	    List<GrantedAuthority> authorities = (List<GrantedAuthority>) userInfo.getAuthorities();
	    authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
	    return new UsernamePasswordAuthenticationToken(userInfo,null,authorities);
	  }

	  private boolean matchPassword(String password, Object credentials) {
	    return password.equals(credentials);
	  }

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return authentication.equals(UsernamePasswordAuthenticationToken.class);

	}
}
