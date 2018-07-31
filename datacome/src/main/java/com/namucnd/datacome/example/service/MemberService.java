package com.namucnd.datacome.example.service;

import java.util.List;

import com.namucnd.datacome.example.dto.MemberVO;

public interface MemberService {
	
	public List<MemberVO> selectMember() throws Exception;
}
