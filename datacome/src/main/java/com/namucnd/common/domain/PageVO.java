package com.namucnd.common.domain;

public class PageVO {

	private int rownumPerPage; // 페이지당 몇줄씩 나오는지
	private int page = 1; // 페이지 넘버. 기본값 1페이지
	private String search_gubun; // 구분(사용은 안함, 제목 이름 처럼 구분하려면 사용)
	private String search_word; // 검색어

	public PageVO() {
	}

	public PageVO(int rownumPerPage, int page) {
		this.rownumPerPage = rownumPerPage;
		this.page = page;
	}

	public int getRownumPerPage() {
		return rownumPerPage;
	}

	public void setRownumPerPage(int rownumPerPage) {
		this.rownumPerPage = rownumPerPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getSearch_gubun() {
		return search_gubun;
	}

	public String getSearch_word() {
		return search_word;
	}

	public void setSearch_gubun(String search_gubun) {
		this.search_gubun = search_gubun;
	}

	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}

}
