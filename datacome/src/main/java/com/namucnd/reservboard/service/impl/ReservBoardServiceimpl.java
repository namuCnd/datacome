package com.namucnd.reservboard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.namucnd.reservboard.dao.ReservBoardDao;
import com.namucnd.reservboard.domain.ReservBoard;
import com.namucnd.reservboard.service.ReservBoardService;
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
@Service("ReservBoardService")
public class ReservBoardServiceimpl implements ReservBoardService {

	@Autowired
	ReservBoardDao reservBoardDao;
	
	@Override
	public List<ReservBoard> reservBordList(PageMaker pageMaker) throws Exception {
		return reservBoardDao.reservBordList(pageMaker);
	}

	@Override
	public Integer reservBordListCnt() throws Exception {
		// TODO Auto-generated method stub
		return reservBoardDao.reservBordListCnt();
	}
	
	
}