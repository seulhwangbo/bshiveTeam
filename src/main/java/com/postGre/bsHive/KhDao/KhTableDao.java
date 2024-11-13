package com.postGre.bsHive.KhDao;

import java.util.List;

import com.postGre.bsHive.Adto.Kh_EmpList;
import com.postGre.bsHive.Adto.Kh_LctrList;
import com.postGre.bsHive.Adto.Kh_PrdocList;
import com.postGre.bsHive.Adto.Kh_ScholarshipList;
import com.postGre.bsHive.Adto.Kh_StdntList;
import com.postGre.bsHive.Adto.Kh_pstList;
import com.postGre.bsHive.Amodel.Lgn;


public interface KhTableDao {

	List<Kh_PrdocList>		getTestTableList();
	
	// 삭제여부 변경
	int 					updateLgnDelYn(Lgn lgn);
	
	// Student List
	int 					getTotStdntList(Kh_StdntList stList);
	List<Kh_StdntList> 		getStdntList(Kh_StdntList stList);
	
	// EMP List
	int 					getTotEmpList(Kh_EmpList eList);
	List<Kh_EmpList> 		getEmpList(Kh_EmpList eList);	
	
	// Lecture List
	int						getTotLctrList(Kh_LctrList lcList);
	List<Kh_LctrList> 		getLctrList(Kh_LctrList lcList);
	Kh_LctrList 			getLctrDetail(Kh_LctrList lcList);
	void 					updateAplyType(Kh_LctrList lcList);
	void 					openLecture(Kh_LctrList lcList);
	void 					insertAtdncType(Kh_LctrList lcList);
	void 					updateOflLctr(Kh_LctrList lcList);

	
	// PRDOC
	List<Kh_PrdocList> 		getPrdocList(Kh_PrdocList prList);
	int 					getTotPrdocList(Kh_PrdocList prList);
	
	
	//Scholarship
	int 					getTotSchList(Kh_ScholarshipList sList);

	
	// Board
	int 					getTotBoardList(Kh_pstList pList);
	List<Kh_pstList> 		getBoardList(Kh_pstList pList);
	void 					updateDelYnPst(Kh_pstList pList);

	

	
}	
