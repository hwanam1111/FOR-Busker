package busker.scan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 메세지 컨트롤러

@Controller
public class MessageController {

	@RequestMapping(value="message")
	public String message(){
		System.out.println("message.jsp로 이동");
		return "messageView/message";
	}
}
