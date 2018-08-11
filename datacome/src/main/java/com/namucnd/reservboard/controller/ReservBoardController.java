package com.namucnd.reservboard.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.namucnd.reservboard.domain.ReservBoard;
import com.namucnd.reservboard.service.ReservBoardService;
import com.namucnd.utils.PageMaker;

@Controller
public class ReservBoardController {
	
	// log사용을 위해 선언
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ReservBoardService reservBoardService;
	
	@RequestMapping(value="/reservBordList.do", method=RequestMethod.GET)
	public String reservBordList(PageMaker pageMaker, Model model) throws Exception{
	     
	    logger.info(pageMaker.toString());
	     
	    List<ReservBoard> reservBordList = new ArrayList<ReservBoard>();
	    reservBordList = reservBoardService.reservBordList(pageMaker);
	    model.addAttribute("list", reservBordList);
	    //전체 페이지 개수 구한후 하단 페이징 처리 하기
	    pageMaker.setTotalCount(reservBoardService.reservBordListCnt());
	 
	    //페이지 메이커 attribute 로 저장  
	    model.addAttribute("pageMaker", pageMaker);
	     
	    return "/reservBoard/reservBoardList.default";
	}

}