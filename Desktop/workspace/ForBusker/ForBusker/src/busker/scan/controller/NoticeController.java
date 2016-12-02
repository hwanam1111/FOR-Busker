package busker.scan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

//	공지사항 페이지로 이동
	@RequestMapping(value="noticeList")
	public String notice(){
		System.out.println("noticeList.jsp로 이동");
		return "noticeView/noticeList";
	}
}
