package busker.scan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import busker.scan.service.MemberService;
import busker.scan.vo.MemberVO;

@Controller
public class MemberController {

	
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
	
}
