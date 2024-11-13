package com.postGre.bsHive.Amodel;

import com.postGre.bsHive.Adto.User_Table;

import lombok.Data;

@Data
//게시판
public class Pst extends User_Table {
	private int 	pst_num;			// 게시판번호
	private int 	unq_num;			// 고유번호
	private String 	pst_clsf;			// 게시판분류
	private String 	pst_ttl;			// 제목
	private String 	pst_cn;				// 내용
	private String 	wrt_ymd;			// 작성일
	private String 	ans;				// 답변
	private String 	answr;				// 답변자
	private String 	answr_ymd;			// 답변일자
	private String 	ans_yn;				// 답변처리여부
	private int 	del_yn;				// 삭제여부
	private int  file_group;    		// 파일그룹
	private String currentPage;
	private int		start;
	private int		end;
}
