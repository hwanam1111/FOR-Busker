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
	public String togetherList(Model m){
		try {
			List<TogetherVO>list=service.selectAllTogether();
			m.addAttribute("list",list);
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
	public String togetherView(TogetherVO tovo,Model m){
		try {
			System.out.println("tovo num : "+tovo.getToNo());
			TogetherVO vo=service.selectTogetherByNum(tovo);
			m.addAttribute("tovo",vo);
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
		if(result==1){
			nextPage= "togetherView/togetherList";
			List<TogetherVO>list=service.selectAllTogether();
			m.addAttribute("list",list);
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
	public String togetherDel(TogetherVO tovo,Model m){
		String nextpage="";
		int result2=0;
		try {
			//System.out.println("삭제할 글번호: "+tovo.getToNo());
			result2=service.deleteTogether(tovo);
			if(result2==1){
				//삭제 결과 다음 페이지에 넘겨주고 거기서 load될때 result값에 따라 삭제 완료인지 실패인지 띄워주기
				List<TogetherVO>list=service.selectAllTogether();
				m.addAttribute("list",list);
				m.addAttribute("result2",1);
				nextpage="togetherView/togetherList";
			}else{
				m.addAttribute("result2",2);
				nextpage="togetherView/togetherList";
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
	public String searchCofig(String searchVal,Model m){
		String nextPage="";
		try {
			List<TogetherVO> voList=service.selectBySearchVal(searchVal);
			if(voList!=null){
				m.addAttribute("voList", voList);
				m.addAttribute("searchVal", searchVal);
				nextPage="togetherView/togetherSearch";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nextPage;
	}
	
}
