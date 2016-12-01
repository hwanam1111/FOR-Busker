package busker.scan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 메인페이지 컨트롤러

@Controller
public class MainController {
	
//	로그인 페이지로 이동
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
	
//	공지사항 페이지로 이동
	@RequestMapping(value="notice")
	public String notice(){
		System.out.println("notice.jsp로 이동");
		return "mainView/notice";
	}
	
	
}
