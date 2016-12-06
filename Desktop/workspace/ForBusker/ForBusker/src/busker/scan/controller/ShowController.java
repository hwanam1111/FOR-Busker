package busker.scan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import busker.scan.service.ShowService;
import busker.scan.vo.ShowVO;



@Controller
public class ShowController {
	
	@Autowired
	private ShowService service;

	@RequestMapping(value="ShowRegistCompleteForm")
	public String ShowRegist(ShowVO showVO,Model m) throws Exception{
		System.out.println("showRegistCompleteForm으로 이동");
		System.out.println("shocontroller에서 showvo값"+showVO.getMemEmail());
		System.out.println("shocontroller에서 이름이라도..="+showVO.getShName());
		System.out.println("shocontroller에서 date="+showVO.getShDate());
		System.out.println("shocontroller에서 time="+showVO.getShTime());
		int result = service.insertShow(showVO);
		if(result == 1){
			System.out.println("공연등록성공");
		}else{
			System.out.println("공연등록실패");
		}
		m.addAttribute("showvo",showVO);
		
		return "showView/showRegistCompleteForm";
	}
}
