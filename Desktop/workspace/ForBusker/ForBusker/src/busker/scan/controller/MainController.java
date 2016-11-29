package busker.scan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("login")
	public String login(){
		
		System.out.println("Login.jsp로 이동");
		
		return "login";
	}
}
