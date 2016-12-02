package busker.scan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 함께해요 컨트롤러

@Controller
public class TogetherController {

	// 함께하기 리스트로 이동
	@RequestMapping(value="togetherList")
	public String togetherList(){
		System.out.println("togetherList.jsp로 이동");
		return "togetherView/togetherList";
	}

	// 함께하기 Form 이동
	@RequestMapping(value="togetherForm")
	public String togetherForm(){
		System.out.println("togetherForm.jsp로 이동");
		return "togetherView/togetherForm";
	}

	// 함께하기 View 이동
	@RequestMapping(value="togetherView")
	public String togetherView(){
		System.out.println("togetherview.jsp로 이동");
		return "togetherView/togetherView";
	}
}
