package com.postGre.bsHive.Adto;

import lombok.Data;

@Data
public class Kh_PrdocList {			
	private int		aply_num;		//신청번호
	private long 	unq_num;		//강의번호
	private long 	lctr_num;		//고유번호
	private int 	prdoc_type;		//증명서타입
	private String 	aply_ymd;		//신청일
	private String 	issu_ymd;		//발급일
	private int 	issu_stts;		//발급상태	
	
	
	//LCTR_APLY
	private int 	atndc_scr;		// 출석점수
	private int 	asmt_scr;		// 과제점수
	private String 	fnsh_yn;		// 수료여부
	private int 	pace;			// 강의진도율
	
	
	
	//LCTR_EVL
	private int		evl_total; 		//총점
	private int 	evl_ox;			//강의평가유무

	
	private String	search;			//분류
	private String	keyword;		//Search Keyword
	private int		start;			//시작번호
	private int		end;			//끝번호
	
	private String	currentPage;	//현제 페이지
	
}
