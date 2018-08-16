package com.namucnd.reservboard.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.namucnd.reservboard.dao.ReservBoardDao;
import com.namucnd.reservboard.domain.ReservBoard;
import com.namucnd.utils.PageMaker;

/**
 * <pre>
 * Users dao
 * </pre>
 * @FileName UsersDaoImpl.java
 * @Package com.univeramall.user.dao.impl
 * @Organization 
 * @author Sorcerer.Picoo
 * @since 2018. 2. 26.
 * 
 */
@Repository
public class ReservBoardDaoImpl implements ReservBoardDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ReservBoard> reservBordList(PageMaker pageMaker) throws Exception {
		return sqlSessionTemplate.selectList("reserv.reservBordList", pageMaker);
	}

	@Override
	public Integer reservBordListCnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("reserv.reservBordListCnt");
	}

	@Override
	public int insertReservBoard(ReservBoard beservBoard) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("reserv.insertReservBoard");
	}
	
	
}