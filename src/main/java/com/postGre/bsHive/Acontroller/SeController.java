package com.postGre.bsHive.Acontroller;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import java.io.IOException;
import java.nio.file.Files;
import java.util.UUID;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;

import com.postGre.bsHive.Adto.Onln_Lctr_List;
import com.postGre.bsHive.Adto.User_Table;
import com.postGre.bsHive.SeService.Paging;
import com.postGre.bsHive.SeService.SeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/se")
public class SeController {
	
	private final SeService ss;
	
	// LMS 리스트
	@GetMapping(value = "/onlnList") 
	public String onlnList(Onln_Lctr_List onln_Lctr_List, Model model) {
		// 글갯수
		int onlnTotal  = ss.onlnTotal();
		// 글리스트
		List<Onln_Lctr_List> onlnList = ss.onlnList(onln_Lctr_List);
		// 페이지
		Paging page = new Paging(onlnTotal, onln_Lctr_List.getCurrentPage());
		onln_Lctr_List.setStart(page.getStart());
		onln_Lctr_List.setEnd(page.getEnd());
		
		model.addAttribute("onlnTotal", onlnTotal);
		model.addAttribute("onlnList", onlnList);
	    model.addAttribute("page",page);
	    
	return "se/onlnList"; 
	}
	
	@GetMapping(value = "/onlnDtl") 
	public String onlnDtl(@RequestParam(value = "Lctr_Num") Integer Lctr_Num, Model model) {
		System.out.println("onlnDtl 작동");
		Onln_Lctr_List onlnDtl = ss.onlnDtl(Lctr_Num);
		
		model.addAttribute("onlnDtl", onlnDtl);
		
	return "se/onlnDtl"; 
	}
	
	@GetMapping(value = "lctrViewList")
	public String lctrViewList(
	        @RequestParam(value = "unq_num") Integer unq_num, // 필수 파라미터
	        @RequestParam(value = "lctr_num") Integer lctr_num, // 필수 파라미터
	        HttpServletRequest request,
	        HttpSession session,
	        Model model) {

	    // 세션에서 사용자 정보 가져오기
	    User_Table user = (User_Table) session.getAttribute("user"); // 올바른 키로 수정
	    if (user == null) {
	        // 세션에 사용자 정보가 없으면 적절한 처리를 수행 (예: 로그인 페이지로 리다이렉트)
	        return "redirect:/jh/loginForm"; // 예시
	    }

	    int userUnqNum = user.getUnq_num(); // 사용자 고유 번호 가져오기

	    // 서비스 메서드 호출
	    List<Onln_Lctr_List> onln_Lctr_List = ss.lctrViewList(userUnqNum , lctr_num); 

	    // 모델에 추가
	    model.addAttribute("onln_Lctr_List", onln_Lctr_List);
	    System.out.println("onln_Lctr_List 값 "+onln_Lctr_List);
	    return "se/lctrViewList"; // JSP 페이지로 이동
	}

	@GetMapping(value = "/lctrView")
	public String lctrViewList(HttpServletRequest request, HttpSession session, Model model) {
		// 세션에서 사용자 정보 가져오기
	    User_Table user = (User_Table) session.getAttribute("user"); // 올바른 키로 수정
	    if (user == null) {
	        // 세션에 사용자 정보가 없으면 적절한 처리를 수행 (예: 로그인 페이지로 리다이렉트)
	        return "redirect:/jh/loginForm"; // 예시
	    }
	    int userUnqNum = user.getUnq_num(); // 사용자 고유 번호 가져오기
	    System.out.println("lctrViewList 컨트롤 작동완료");
	    // 쿼리 파라미터에서 값 가져오기
	    String vdoId = request.getParameter("vdo_id");
	    String contsId = request.getParameter("conts_id");
	    
	    // unit_num 파라미터를 안전하게 파싱
	    String lastDtl = request.getParameter("last_dtl");
	    String maxDtl = request.getParameter("max_dtl");
	    String chnm = request.getParameter("ch_nm");
	    String playstart = request.getParameter("play_start");
	    
	    int lctrNum = Integer.parseInt(request.getParameter("lctr_num"));
	    String unitNum = request.getParameter("unit_num");
	    int playHr = Integer.parseInt(request.getParameter("play_hr"));
	    String contsNm = request.getParameter("conts_nm");
	    // 모델에 객체 추가
	    model.addAttribute("vdoId", vdoId);
	    model.addAttribute("contsId", contsId);
	    model.addAttribute("lastDtl", lastDtl);
	    model.addAttribute("maxDtl", maxDtl);
	    model.addAttribute("chnm", chnm);
	    model.addAttribute("playstart", playstart);
	    model.addAttribute("lctrNum", lctrNum);
	    model.addAttribute("unitNum", unitNum);
	    model.addAttribute("unqNum", userUnqNum);
	    model.addAttribute("playHr", playHr);
	    model.addAttribute("contsNm", contsNm);
	    
	    List<Onln_Lctr_List> chapterList = ss.getChaptersForVideo(vdoId);
	    request.setAttribute("chapterList", chapterList);
	    
	    return "se/lctrView"; // JSP 페이지로 이동
	}

	
	@GetMapping("/download")
    public ResponseEntity<Resource> downloadFile(@RequestParam("filePath") String filePath) {
         System.out.println(filePath);
        try {
            Path fullPath = Paths.get(filePath).toAbsolutePath();
            Resource resource = new UrlResource(fullPath.toUri());
            System.out.println(fullPath);
         System.out.println(resource);

            if (resource.exists() && resource.isReadable()) {
                String fileName = fullPath.getFileName().toString();
                return ResponseEntity.ok()
                        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
                        .body(resource);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().build();
        }
    }
	
	
}
