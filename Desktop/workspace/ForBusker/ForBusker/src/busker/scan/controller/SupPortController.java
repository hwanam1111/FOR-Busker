package busker.scan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 후원하기 컨트롤러

@Controller
public class SupPortController {

	@RequestMapping(value="sponAndBacked.do")
	public String sponAndBacked(){
		System.out.println("sponAndBacked로 이동");
		return "sponserView/sponAndBacked";
	}
	
	
	@RequestMapping(value="sponserView.do")
	public String sponserForm(){
		System.out.println("ponserView로 이동");
		return "sponserView/sponserView";
	}
	
	@RequestMapping(value="sponserForm.do")
	public String sponserForm1(){
		System.out.println("ponserForm로 이동");
		return "sponserView/sponserForm";
	}
	
	@RequestMapping(value="backedView.do")
	public String backedView(){
		System.out.println("backedView로 이동");
		return "backedView/backedView";
	}
	
	@RequestMapping(value="backedForm.do")
	public String backedForm(){
		System.out.println("backedForm로 이동");
		return "backedView/backedForm";
	}
		
}
