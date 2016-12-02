package busker.scan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import busker.scan.service.MemberService;
import busker.scan.vo.MemberVO;
// 메인페이지 컨트롤러 

@Controller
public class MainController {
	

	@Autowired
	private MemberService service;
	
//	메인 페이지로 이동
	@RequestMapping(value="main")
	public String main(){
		System.out.println("main.jsp로 이동");
		return "mainView/main";
	}
	
//	로그인 페이지로 이동
	@RequestMapping(value="login")
	public String login(){
		System.out.println("login.jsp로 이동");
		return "mainView/login";
	}
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
	
	
//	회원가입 페이지로 이동
	@RequestMapping(value="join")
	public String join(){
		System.out.println("join.jsp로 이동");
		return "mainView/join";
	}
	
//	일반 회원가입 페이지로 이동
	@RequestMapping(value="simpleJoin")
	public String simpleJoin(){
		System.out.println("simpleJoin.jsp로 이동");
		return "mainView/simpleJoin";
	}
	
//	공연자 회원가입 페이지로 이동
	@RequestMapping(value="buskerJoin")
	public String buskerJoin(){
		System.out.println("buskerJoin.jsp로 이동");
		return "mainView/buskerJoin";
	}
	
//	ID / PW 찾기 페이지로 이동
	@RequestMapping(value="loginSearch")
	public String loginSearch(){
		System.out.println("loginSearch.jsp로 이동");
		return "mainView/loginSearch";
	}
	
//	일반 ID 찾기 페이지로 이동
	@RequestMapping(value="simpleIdSearch")
	public String simpleIdSearch(){
		System.out.println("simpleIdSearch.jsp로 이동");
		return "mainView/simpleIdSearch";
	}
	
//	공연자 ID 찾기 페이지로 이동
	@RequestMapping(value="buskerIdSearch")
	public String buskerIdSearch(){
		System.out.println("buskerIdSearch.jsp로 이동");
		return "mainView/buskerIdSearch";
	}
	
//	PW 찾기 페이지로 이동
	@RequestMapping(value="pwSearch")
	public String pwSearch(){
		System.out.println("pwSearch.jsp로 이동");
		return "mainView/pwSearch";
	}
	

	
	
}
