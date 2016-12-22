package busker.scan.controller;

import java.util.List;

import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import busker.scan.service.MemberServiceImpl;
import busker.scan.service.TogetherServiceImpl;
import busker.scan.vo.MemberVO;
import busker.scan.vo.PageVO;
import busker.scan.vo.TogetherVO;

// 함께해요 컨트롤러

@Controller
public class TogetherController {
	
	@Autowired
	private TogetherServiceImpl service;
	@Autowired
	private MemberServiceImpl memService;
	
	
	// 함께하기 리스트로 이동하면서 together 테이블에서 select*
	@RequestMapping(value="togetherList")
	public String togetherList(Model m, String page,String memEmail){
		//페이징 부분 
		PageVO pageVO = new PageVO();
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		try {
			List<TogetherVO>list=service.selectAllTogether(pageVO,memEmail);
			System.out.println("listsize - " + list.size());
			m.addAttribute("list",list);
			m.addAttribute("page",pageVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "togetherView/togetherList";
	}

	// 함께하기 Form 이동
	@RequestMapping(value="togetherForm")
	public String togetherForm(){
		System.out.println("togetherForm.jsp로 이동");
		return "togetherView/togetherForm";
	}

	// 함께하기 View 이동
	@RequestMapping(value="togetherView")
	public String togetherView(TogetherVO tovo,Model m,String param){
		try {
			System.out.println("tovo num : "+tovo.getToNo());
			TogetherVO vo=service.selectTogetherByNum(tovo);
			m.addAttribute("tovo",vo);
			if(param!=null){
				m.addAttribute("param",param);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "togetherView/togetherView";
	}
	
	@RequestMapping(value="togetherRegist")
	public String togetherRegist(TogetherVO tovo,Model m){
		//멤버테이블에서 사진,동영상 가져오기
		MemberVO memVO=new MemberVO();
		memVO.setMemEmail(tovo.getToId());
		int result=0;
		String nextPage="togetherView/togetherForm";
		try {
		memVO=memService.selectEmail(memVO);
		tovo.setToVideo(memVO.getMemVideo());
		tovo.setToPhoto(memVO.getMemTeamPhoto());
		result=service.insertTogether(tovo);
		
		//페이징 부분 
		PageVO pageVO = new PageVO();
		pageVO.setCurPage(1);				//page값 1로 지정
		
				
		if(result==1){
			nextPage= "togetherView/togetherList";
			List<TogetherVO>list=service.selectAllTogether(pageVO,null);
			m.addAttribute("list",list);
			m.addAttribute("page",pageVO);
		}else{
			nextPage="togetherView/togetherForm";
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return nextPage;
	}
	//함께하기 글 지우기
	@RequestMapping(value="togetherDel")
	public String togetherDel(TogetherVO tovo,Model m,String param){
		String nextpage="";
		int result2=0;
		//페이징 부분 
		PageVO pageVO = new PageVO();
		pageVO.setCurPage(1);				//page값 1로 지정	
		
		System.out.println("param :"+param);
		//param값이 있다면 mypageTogetherList로
		if(param==null){
			nextpage="togetherView/togetherList";
			
		}else{
			nextpage="redirect:mypageTogetherList.do?cate=toList&page=1";
		}//else 끝
		
		try {
			//System.out.println("삭제할 글번호: "+tovo.getToNo());
			result2=service.deleteTogether(tovo);
			if(result2==1){
				//삭제 결과 다음 페이지에 넘겨주고 거기서 load될때 result값에 따라 삭제 완료인지 실패인지 띄워주기
				List<TogetherVO>list=service.selectAllTogether(pageVO,null);
				m.addAttribute("list",list);
				m.addAttribute("page",pageVO);
				m.addAttribute("result2",1);
				
			}else{
				m.addAttribute("result2",2);
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return nextpage;
	}
	//함께하기 수정하기
	@RequestMapping(value="togetherModCofig")
	public String togetherMod(TogetherVO tovo,Model m){
		int result=0;
		String nextPage="";
		
		try {
			result=service.togetherMod(tovo);
			if(result==1){
				TogetherVO vo=service.selectTogetherByNum(tovo);
				m.addAttribute("tovo",vo);
			
				nextPage="togetherView/togetherView";
			}else{
				
				m.addAttribute("tovo", tovo);
				nextPage="togetherView/togetherModForm";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nextPage;
	}
	//수정하기 폼으로
	@RequestMapping(value="togetherMod")
	public String togetherModForm(TogetherVO tovo,Model m){
		try {
			TogetherVO vo=service.selectTogetherByNum(tovo);
			m.addAttribute("tovo", vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "togetherView/togetherModForm";
	}
	//검색 결과창으로
	@RequestMapping(value="searchCofig")
	public String searchCofig(String searchVal,String page, Model m){
		String nextPage="";
		//페이징 부분 
		PageVO pageVO = new PageVO();
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		try {
			List<TogetherVO> voList=service.selectBySearchVal(searchVal,pageVO);
			if(voList!=null){
				m.addAttribute("list", voList);
				m.addAttribute("searchVal", searchVal);
				m.addAttribute("page",pageVO);
				nextPage="togetherView/togetherList";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return nextPage;
	}
	
}
