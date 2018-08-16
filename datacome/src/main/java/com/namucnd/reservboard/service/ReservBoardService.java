package com.namucnd.reservboard.service;

import java.util.List;

import com.namucnd.reservboard.domain.ReservBoard;
import com.namucnd.utils.PageMaker;

public interface ReservBoardService {
	
	public List<ReservBoard> reservBordList(PageMaker pageMaker) throws Exception;
	
	public Integer reservBordListCnt() throws Exception;
	
	public int insertReservBoard(ReservBoard beservBoard) throws Exception;
}
