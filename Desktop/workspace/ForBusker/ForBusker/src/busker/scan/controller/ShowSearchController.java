package busker.scan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import busker.scan.service.ShowService;
import busker.scan.vo.PageVO;
import busker.scan.vo.ShowVO;

// 공연찾기 컨트롤러

@Controller
public class ShowSearchController {

	@Autowired
	ShowService service;
	
	@RequestMapping(value="showList")
	public String showList(int shno, String loc,String page , Model m) throws Exception{
		System.out.println("showList.jsp로 이동");
		System.out.println("loc는"+loc);
		System.out.println("shno는"+shno);
		
		//페이징 부분 
		PageVO pageVO = new PageVO();
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		if(loc==null){//Main에서 지도의 링크클릭했을때
			m.addAttribute("volist",service.selectList(shno));
			
			
		}else{//Main에서 공연찾기 링크 눌렀을때
			List<ShowVO> volist = service.selectList(loc,pageVO);
		
			m.addAttribute("volist",volist);
			m.addAttribute("page",pageVO);
			m.addAttribute("mapo","마포");
			
		}
		
		m.addAttribute("shno",shno);
		return "showView/showList";
	}
	@RequestMapping(value="showRegist")
	public String showRegist(){
		System.out.println("showRegist.jsp로 이동");
		return "showView/showRegist";
	}
	@RequestMapping(value="showListSearch")
	public String showList2(String date, String select, String val, String page, Model m) throws Exception{
		
		
		//페이징 부분 
		PageVO pageVO = new PageVO();
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		m.addAttribute("volist",service.selectList(date,select,val,pageVO));
		m.addAttribute("value",val);
		m.addAttribute("date",date);
		m.addAttribute("select",select);
		m.addAttribute("page",pageVO);
		return "showView/showList";
	}
}
