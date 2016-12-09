package busker.scan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import busker.scan.service.SupPortService;
import busker.scan.vo.BackedVO;
import busker.scan.vo.PageVO;
import busker.scan.vo.SponserVO;

// 후원하기 컨트롤러

@Controller
public class SupPortController {

	@Autowired
	private SupPortService service;
	
	//후원리스트로 이동
	@RequestMapping(value="sponAndBacked.do")
	public String sponAndBacked(Model m,String page,String cate, PageVO pageVO)  throws Exception {
		System.out.println("sponList로 이동 : ");
		
		//################페이징
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		System.out.println("현제페이지번호 : "+pageVO.getCurPage() );
		//#####################
	    
		//후원하기 리스트
		List<SponserVO> sponList = service.sponList(pageVO);
		//후원해주세요 리스트
		
		
		m.addAttribute("sponList",sponList);
		m.addAttribute("page",pageVO);
		
		return "sponserView/sponAndBacked";
	}
	
	//후원해주세요 List
	@RequestMapping(value="backedList.do")
	public String backedList(Model m,String page, PageVO pageVO) throws Exception{
		System.out.println("BackedList로 이동 : ");
		
		//################페이징
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}		
		System.out.println("현제페이지번호 : "+pageVO.getCurPage() );
		//후원해주세요 리스트
		List<BackedVO> backedList = service.backedList(pageVO);
		//후원하기 리스트
		
		m.addAttribute("backedList",backedList);
		
		m.addAttribute("page",pageVO);
		return "sponserView/sponAndBacked";
	}
	
	//후원View로 이동
	@RequestMapping(value="sponserView.do")
	public String sponserView(int num,Model m) throws Exception {
		
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
	public String backedView(int num, Model m) throws Exception{
		System.out.println("backedView로 이동");

		BackedVO bVO = service.selectBacked(num);
		m.addAttribute("selectBacked",bVO);
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
	public String sponInsert(SponserVO sponserVO,Model m ) throws Exception {
		System.out.println("insert콘트롤확인 : "+sponserVO.getSpName());
		int result=0;
		result = service.insertSpon(sponserVO);
		if(result==1){
			m.addAttribute("message","입력성공@.@");
		}else{
			m.addAttribute("message","입력실패-.-");
		}
		return "sponserView/sponInsertOk";
	}
	
	//후원받기 insert페이지
	@RequestMapping(value="backedInsert.do")
	public String backedInsert(BackedVO backedVO,Model m)throws Exception{
		
		int result=0;
		result=service.insertBacked(backedVO);
		if(result==1){
			m.addAttribute("message","입력성공@.@");
		}else{
			m.addAttribute("message","입력실패-.-");
		}
		
		
		return "backedView/backedInsertOk";
	}
	
	
		
}
