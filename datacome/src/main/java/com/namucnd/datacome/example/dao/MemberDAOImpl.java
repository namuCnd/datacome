package com.namucnd.datacome.example.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.namucnd.datacome.example.dto.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.example.mapper.memberMapper";
	
	@Override
	public List<MemberVO> selectMember() throws Exception {

		return sqlSession.selectList(Namespace+".selectMember");
	}

}
