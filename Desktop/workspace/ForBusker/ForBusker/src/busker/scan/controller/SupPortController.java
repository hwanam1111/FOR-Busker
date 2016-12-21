package busker.scan.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import busker.scan.service.SupPortService;
import busker.scan.vo.BackedVO;
import busker.scan.vo.MemberVO;
import busker.scan.vo.PageVO;
import busker.scan.vo.SponserVO;

// 후원하기 컨트롤러

@Controller
public class SupPortController {

	@Autowired
	private SupPortService service;

	//후원하기 List 이동
	@RequestMapping(value="sponAndBacked.do")
	public String sponAndBacked(Model m,String page, PageVO pageVO , String search)  throws Exception {
		System.out.println("sponList로 이동 ");
		//System.out.println("스폰리스트 search : "+search);
		//검색어 null들어오면 공백으로 처리
		if( search !=null && search.equals("null")) search = "";

		//################페이징
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}

		//후원하기 리스트
		List<SponserVO> sponList = service.sponList(pageVO,search);

		m.addAttribute("sponList",sponList);
		m.addAttribute("page",pageVO);
		m.addAttribute("search",search);

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

	//후원하기 insert페이지
	@RequestMapping(value="sponInsert.do")
	public String sponInsert(SponserVO sponserVO,Model m ) throws Exception {


		int result=0;
		result = service.insertSpon(sponserVO);
		if(result==1){
			m.addAttribute("message","입력성공@.@");

		}else{
			m.addAttribute("message","입력실패-.-");
		}
		return "sponserView/sponInsertOk";
	}

	//후원하기 삭제
	@RequestMapping(value="sponDelete.do")
	public String sponDelete(String num,Model m) throws Exception{
		int sponNo = Integer.parseInt(num);
		int result = service.deleteSpon(sponNo);
		String message="삭제성공";
		if(result != 1){
			message="삭제 실패 ㅡㅡ";
		}
		m.addAttribute("message",message);

		return "sponserView/sponserDeleteOk";
	}

	//후원하기 수정폼
	@RequestMapping(value="sponUpdateForm.do")
	public String sponUpdate(String spNo, SponserVO sponserVO,Model m) throws Exception{

		int num=Integer.parseInt(spNo);
		//System.out.println("넘넘넘"+num);
		sponserVO.setSpNo(num);
		SponserVO sVO = service.sponUpdateForm(sponserVO);
		System.out.println("확인해보쟈 : "+sVO.getSpContent());
		m.addAttribute("sponserVO",sVO);
		return "sponserView/sponserUpdate";
	}

	//후원하기 수정
	@RequestMapping(value="sponUpdate.do")
	public String sponUpdateOk(SponserVO sponserVO, Model m) throws Exception{

		int result = service.sponUpdate(sponserVO);
		String message="수정 성공!!!";
		if(result!=1){
			message = "수정 실패!!!";
		}
		m.addAttribute("message",message);
		m.addAttribute("num",sponserVO.getSpNo());
		return "sponserView/sponserUpdateOk";
	}

	//후원하기 검색
	@RequestMapping(value="sponSearch.do")
	public String sponSearch(String search, RedirectAttributes redirectAttributes) throws Exception{
		System.out.println("스폰서치.do : " + search);      
		redirectAttributes.addAttribute("search",search);   //search를 받아와서 search로 지정 
		return "redirect:sponAndBacked.do";
	}


	//후원해주세요 ###################################################
	//후원해주세요 List
	@RequestMapping(value="backedList.do")
	public String backedList(Model m,String page, PageVO pageVO, String search) throws Exception{
		System.out.println("BackedList로 이동 : ");

		//################페이징
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}

		//검색어 null들어오면 공백으로 처리
		if( search !=null && search.equals("null")) search = "";
		//후원해주세요 리스트
		List<BackedVO> backedList = service.backedList(pageVO,search);

		m.addAttribute("backedList",backedList);
		m.addAttribute("page",pageVO);
		m.addAttribute("search",search);

		return "sponserView/sponAndBacked";
	}

	//후원받기View로 이동
	@RequestMapping(value="backedView.do")
	public String backedView(int num, Model m) throws Exception{
		System.out.println("backedView로 이동");

		BackedVO bVO = service.selectBacked(num);
		m.addAttribute("selectBacked",bVO);
		return "backedView/backedView";
	}

	//후원받기 입력페이지로 이동
	@RequestMapping(value="backedForm.do")
	public String backedForm(HttpSession session, Model m) throws Exception{
		System.out.println("backedForm로 이동");
		Object obj= session.getAttribute("login");
		MemberVO mem= null;
		if(obj!=null){
			mem = (MemberVO)obj;
			String prUrl = service.selectPrVideo(mem.getMemEmail());
			String message = null;
			if(mem.getMemType().equals("1")){
				message = "공연자 회원이 아닙니다.";
			}
			m.addAttribute("prUrl",prUrl);
			m.addAttribute("message",message);
		}




		return "backedView/backedForm";
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

	//후원해주세요 삭제
	@RequestMapping(value="backedDelete.do")
	public String backedDelete(String num,Model m) throws Exception{
		int backedNo = Integer.parseInt(num);
		int result = service.deleteBacked(backedNo);
		String message="삭제성공";
		if(result != 1){
			message="삭제 실패 ㅡㅡ";
		}
		m.addAttribute("message",message);

		return "sponserView/sponserDeleteOk";
	}

	//후원해주세요 수정폼
	@RequestMapping(value="backedUpdateForm.do")
	public String backedUpdateForm(String backNo, BackedVO backedVO ,Model m) throws Exception{


		int num=Integer.parseInt(backNo);

		backedVO.setBackNo(num);
		BackedVO bVO = service.backedUpdateForm(backedVO);
		//		System.out.println("확인해보쟈 : "+bVO.getSpContent());
		m.addAttribute("backedVO",bVO);

		return "backedView/backedUpdate";
	}

	//후원해주세요 수정
	@RequestMapping(value="backedUpdate.do")
	public String backedUpdateOk(BackedVO backedVO, Model m) throws Exception{

		int result = service.backedUpdate(backedVO);
		String message="수정 성공!!!";
		if(result!=1){
			message = "수정 실패!!!";
		}
		m.addAttribute("message",message);
		m.addAttribute("num",backedVO.getBackNo());

		return "backedView/backedUpdateOk";
	}

	//후원하기 검색
	@RequestMapping(value="backedSearch.do")
	public String backedSearch(String search, RedirectAttributes redirectAttributes) throws Exception{
		System.out.println("backedSearch.do : " + search);      
		redirectAttributes.addAttribute("search",search);   //search를 받아와서 search로 지정 
		return "redirect:backedList.do?cate=backed";
	}


}
