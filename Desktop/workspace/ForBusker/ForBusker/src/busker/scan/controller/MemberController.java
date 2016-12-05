package busker.scan.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import busker.scan.service.MemberService;
import busker.scan.vo.MemberVO;

@Controller
public class MemberController {

	private final Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired
	private MemberService service;
	
//	로그인확인 페이지로 이동
	@RequestMapping(value="loginOK")
	public String loginOK(MemberVO memberVO, Model m, HttpSession session) throws Exception{
		System.out.println("loginOK.jsp로 이동");
		System.out.println(memberVO.getMemEmail());
		System.out.println(memberVO.getMemPw());
		MemberVO ok = null;
		ok= service.selectMember(memberVO);
		String result="";	
		String message="";
	
		if(ok!=null){
			result="mainView/loginOK";
			message=ok.getMemEmail()+"님 로그인하셨습니다.";
			m.addAttribute("vo",ok);
			session.setAttribute("login", ok);
		}else{
			result="mainView/loginOK";
			message="로그인실패";
			
		}
		
		m.addAttribute("message",message);
		
		return result;
	}
	
	
//	회원가입 확인 페이지로 이동
	@RequestMapping(value = "joinOk")
	public String insertMember(MemberVO vo, Model m, HttpServletRequest req) throws Exception{
		
		logger.info("MemberVO.mememail : " + vo.getMemEmail());
		logger.info("MemberVO.mempw : " + vo.getMemPw());
		logger.info("MemberVO.memnick : " + vo.getMemNick());
		logger.info("MemberVO.memphone : " + vo.getMemPhone());
		
		int resultCnt = service.insertMember(vo);
		String result = "";
		  if ( resultCnt == 0 ){
		   result = "실패당";
		  } else {
		   result = "성공이당";
		  }
		  
		  m.addAttribute("result", result);
		  m.addAttribute("vo", vo);
		
		return "mainView/joinOk";
	}
	
}
