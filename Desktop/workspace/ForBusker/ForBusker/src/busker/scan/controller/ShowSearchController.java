package busker.scan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import busker.scan.service.ShowService;

// 공연찾기 컨트롤러

@Controller
public class ShowSearchController {

	@Autowired
	ShowService service;
	
	@RequestMapping(value="showList")
	public String showList(int shno, String loc,Model m) throws Exception{
		System.out.println("showList.jsp로 이동");
		System.out.println("loc는"+loc);
		System.out.println("shno는"+shno);
		if(loc==null){//Main에서 지도의 링크클릭했을때
			m.addAttribute("volist",service.selectList(shno));
		}else{//Main에서 공연찾기 링크 눌렀을때
			m.addAttribute("volist",service.selectList(loc));
		}
		
		return "showView/showList";
	}
	
	
	@RequestMapping(value="showRegist")
	public String showRegist(){
		System.out.println("showRegist.jsp로 이동");
		return "showView/showRegist";
	}
	@RequestMapping(value="showListSearch")
	public String showList2(String date, String select, String val, Model m) throws Exception{
		System.out.println("으아아아아"+service.selectList(date,select,val).size());
		m.addAttribute("volist",service.selectList(date,select,val));
		return "showView/showList";
	}
}
