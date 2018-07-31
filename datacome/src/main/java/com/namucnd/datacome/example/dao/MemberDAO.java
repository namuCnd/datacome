package com.namucnd.datacome.example.dao;

import java.util.List;

import com.namucnd.datacome.example.dto.MemberVO;

public interface MemberDAO {
	
	public List<MemberVO> selectMember() throws Exception;
}
