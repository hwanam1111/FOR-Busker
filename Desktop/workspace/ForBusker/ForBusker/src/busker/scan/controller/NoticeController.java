package busker.scan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

//	공지사항 페이지로 이동
	@RequestMapping(value="noticeList")
	public String noticeList(){
		System.out.println("noticeList.jsp로 이동");
		return "noticeView/noticeList";
	}
	
//	공지사항 폼 이동
	@RequestMapping(value="noticeForm")
	public String noticeForm(){
		System.out.println("noticeForm.jsp로 이동");
		return "noticeView/noticeForm";
	}
	
//	공지사항 뷰 이동
	@RequestMapping(value="noticeView")
	public String noticeView(){
		System.out.println("noticeView.jsp로 이동");
		return "noticeView/noticeView";
	}
	
}
