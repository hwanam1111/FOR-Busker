package busker.scan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
//	로그인 페이지로 이동
	@RequestMapping(value="main")
	public String main(){
		System.out.println("login.jsp로 이동");
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
	
//	공지사항 페이지로 이동
	@RequestMapping(value="notice")
	public String notice(){
		System.out.println("join.jsp로 이동");
		return "mainView/notice";
	}
	
	
}
