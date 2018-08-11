package com.namucnd.reservboard.dao;

import java.util.List;

import com.namucnd.reservboard.domain.ReservBoard;
import com.namucnd.utils.PageMaker;

/**
 * <pre>
 * ReservBoardDao dao
 * </pre>
 * @FileName ReservBoardDao.java
 * @Package com.namucnd.reservboard.dao
 * @Organization 
 * @author jinu
 * @since 2018. 2. 26.
 * 
 */
public interface ReservBoardDao {

	public List<ReservBoard> reservBordList(PageMaker pageMaker) throws Exception;
	
	public Integer reservBordListCnt() throws Exception;
	
}