package busker.scan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import busker.scan.service.SupPortService;
import busker.scan.vo.SponserVO;

// 후원하기 컨트롤러

@Controller
public class SupPortController {

	@Autowired
	private SupPortService service;
	
	//후원리스트로 이동
	@RequestMapping(value="sponAndBacked.do")
	public String sponAndBacked(Model m)  throws Exception {
		System.out.println("sponAndBacked로 이동");
	
		List<SponserVO> sponList = service.sponList();
		m.addAttribute("sponList",sponList);
		return "sponserView/sponAndBacked";
	}
	
	//후원View로 이동
	@RequestMapping(value="sponserView.do")
	public String sponserForm(int num,Model m) throws Exception {
		
		SponserVO sVO = service.selectSpon(num);
		System.out.println("ponserView로 이동 : "+num);
		m.addAttribute("selectSpon",sVO);
		return "sponserView/sponserView";
	}
	
	//후원하기 페이지로 이동
	@RequestMapping(value="sponserForm.do")
	public String sponserForm1(){
		System.out.println("ponserForm로 이동");
		return "sponserView/sponserForm";
	}
	
	//후원받기View로 이동
	@RequestMapping(value="backedView.do")
	public String backedView(){
		System.out.println("backedView로 이동");
		return "backedView/backedView";
	}
	
	//후원받기 페이지로 이동
	@RequestMapping(value="backedForm.do")
	public String backedForm(){
		System.out.println("backedForm로 이동");
		return "backedView/backedForm";
	}
	
	//후원하기 insert페이지
	@RequestMapping(value="sponInsert.do")
	public String sponInsert(SponserVO sponserVO) throws Exception {
		System.out.println("insert콘트롤확인 : "+sponserVO.getSpName());
		int result=0;
		result = service.insertSpon(sponserVO);
		System.out.println(result);
		return "sponserView/sponInsertOk";
	}
		
}
