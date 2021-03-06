package com.it.wanted.career.detail.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.wanted.career.admin.model.ProgramService;
import com.it.wanted.career.admin.model.ProgramVO;
import com.it.wanted.career.admin.model.ProgramVO2;
import com.it.wanted.career.detail.model.CareerSubsService;
import com.it.wanted.member.model.MemberVO;

@Controller
@RequestMapping("/career/detailpage")
public class CareerDetailController {

	private static final Logger logger = LoggerFactory.getLogger(CareerDetailController.class);
	@Autowired private ProgramService programService;
	@Autowired private CareerSubsService subsService;
	
	
	/* 회원 디테일페이지 뷰 보여주기 */
	  @RequestMapping("/detailPage.do") 
	  public void detailPage_get(@RequestParam int programNo, HttpSession session, Model model) {
			  logger.info("일반회원 프로그램 상세페이지, 파라미터 programNo={}", programNo);
			 
			  /*
			  int memNo= (Integer) session.getAttribute("mem_no"); 
			  String email= (String)session.getAttribute("email");
			  			
			  String memName = programService.selectMembersName(email);
			  logger.info("회원이름 memName={}", memName);
			  */
			  
			  List<ProgramVO2> proConList = new ArrayList<ProgramVO2>(); 
			  proConList = programService.selectProgramContentsView(programNo);
			  logger.info("프로그램 내용 상세보기 결과, proConList.size={}", proConList.size());
			  
			  ProgramVO proVo = new ProgramVO();
			  proVo=programService.selectProgramView(programNo);
			  logger.info("프로그램 기본 상세보기 조회, 결과 proVo={}", proVo);
			  
			  /* 함께보면 좋은 이벤트 */			  
			  List<ProgramVO> proVoRecList = programService.selectSimilarProgram();
			  
			 // model.addAttribute("memName", memName);
			  model.addAttribute("proConList", proConList); 
			  model.addAttribute("proVo", proVo);
			  model.addAttribute("proVoRecList", proVoRecList);
			  
			  
	  }
			 

	
	  /* 개별 프로그램 구매 */
	  @RequestMapping("/buyProgram.do") 
	  public void buyProgram(@RequestParam int programNo, HttpSession session, Model model){
		  
			logger.info("프로그램 구매 페이지 보여주기");
			
			int memNo=0;
			String email="";
			if(session.getAttribute("mem_no") != null ) {
				memNo= (Integer) session.getAttribute("mem_no"); 
			}
			if(session.getAttribute("email")!= null) {
				email= (String)session.getAttribute("email");
			}
			
			MemberVO memVo = new MemberVO();
			memVo = subsService.selectMemberNameSub(email);
			logger.info("회원이메일 email={}", email);
			logger.info("회원이름 memName={}", memVo);
			
			ProgramVO proVo = new ProgramVO();
			proVo = subsService.selectProgramInfo(programNo);
			
			model.addAttribute("email", email);
			model.addAttribute("memVo", memVo);		  
			model.addAttribute("proVo", proVo);		  
		  
	  }
	 
	  
	  

}
