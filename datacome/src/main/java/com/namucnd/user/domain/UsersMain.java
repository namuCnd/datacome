package com.namucnd.user.domain;

import java.io.Serializable;

import com.namucnd.common.domain.CommonEntity;

/**
 * <pre>
 * OrderMain Domain
 * </pre>
 * @FileName OrderMain.java
 * @Package com.univeramall.order.domain
 * @Organization 
 * @author Paul
 * @since 2016. 1. 23.
 * 
 */
public class UsersMain extends CommonEntity implements Serializable {

	private static final long serialVersionUID = -484623819659169638L;

	private Integer td_join_cnt; // 회원가입건수 - 오늘
	private Integer yd_join_cnt; // 회원가입건수 - 어제
	private Integer tw_join_cnt; // 회원가입건수 - 그제
	private Integer wk_join_cnt; // 회원가입건수 - 최근1주
	private Integer mo_join_cnt; // 회원가입건수 - 최근1주
	
	public Integer getTd_join_cnt() {
		return td_join_cnt;
	}
	public void setTd_join_cnt(Integer td_join_cnt) {
		this.td_join_cnt = td_join_cnt;
	}
	public Integer getYd_join_cnt() {
		return yd_join_cnt;
	}
	public void setYd_join_cnt(Integer yd_join_cnt) {
		this.yd_join_cnt = yd_join_cnt;
	}
	public Integer getTw_join_cnt() {
		return tw_join_cnt;
	}
	public void setTw_join_cnt(Integer tw_join_cnt) {
		this.tw_join_cnt = tw_join_cnt;
	}
	public Integer getWk_join_cnt() {
		return wk_join_cnt;
	}
	public void setWk_join_cnt(Integer wk_join_cnt) {
		this.wk_join_cnt = wk_join_cnt;
	}
	public Integer getMo_join_cnt() {
		return mo_join_cnt;
	}
	public void setMo_join_cnt(Integer mo_join_cnt) {
		this.mo_join_cnt = mo_join_cnt;
	}
}
