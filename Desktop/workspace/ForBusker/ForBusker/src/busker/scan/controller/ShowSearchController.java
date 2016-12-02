package busker.scan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 공연찾기 컨트롤러

@Controller
public class ShowSearchController {

	@RequestMapping(value="showList")
	public String showList(){
		System.out.println("showList.jsp로 이동");
		return "showView/showList";
	}
	
	@RequestMapping(value="showRegist")
	public String showRegist(){
		System.out.println("showRegist.jsp로 이동");
		return "showView/showRegist";
	}
	
}
