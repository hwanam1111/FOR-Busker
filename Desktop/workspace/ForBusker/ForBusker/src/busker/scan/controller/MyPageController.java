package busker.scan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 마이페이지 컨트롤러

@Controller
public class MyPageController {

	@RequestMapping(value="mypageUpdate")
	public String mypageUpdate(){
		System.out.println("mypageUpdate.jsp로 이동");
		return "myPageView/mypageUpdate";
	}
	
	@RequestMapping(value="mypageLeave")
	public String mypageLeave(){
		System.out.println("mypageLeave.jsp로 이동");
		return "myPageView/mypageLeave";
	}
}
