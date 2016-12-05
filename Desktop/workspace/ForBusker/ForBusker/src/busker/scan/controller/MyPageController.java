package busker.scan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 마이페이지 컨트롤러

@Controller
public class MyPageController {

//	좋아요 페이지로 이동
	@RequestMapping(value="mypageLike")
	public String mypageLike(){
		System.out.println("mypageLike.jsp로 이동");
		return "myPageView/mypageLike";
	}
	
//	정보수정 페이지로 이동
	@RequestMapping(value="mypageUpdate")
	public String mypageUpdate(){
		System.out.println("mypageUpdate.jsp로 이동");
		return "myPageView/mypageUpdate";
	}
	
//	회원탈퇴 페이지로 이동
	@RequestMapping(value="mypageLeave")
	public String mypageLeave(){
		System.out.println("mypageLeave.jsp로 이동");
		return "myPageView/mypageLeave";
	}
}
