package busker.scan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import busker.scan.service.MemberServiceImpl;
import busker.scan.service.ShowServiceImpl;
import busker.scan.service.SupPortServiceImpl;
import busker.scan.service.TogetherServiceImpl;
import busker.scan.service.VideoServiceImpl;
import busker.scan.vo.BackedVO;
import busker.scan.vo.MemberVO;
import busker.scan.vo.PageVO;
import busker.scan.vo.ShowVO;
import busker.scan.vo.SponserVO;
import busker.scan.vo.TogetherVO;
import busker.scan.vo.VideoVO;

// 마이페이지 컨트롤러

@Controller
public class MyPageController {

	@Autowired
	private MemberServiceImpl service;
	@Autowired
	private VideoServiceImpl videoService;
	@Autowired
	private SupPortServiceImpl supportService;
	@Autowired
	private ShowServiceImpl showService;
	@Autowired
	private TogetherServiceImpl togetherService;
	
//	정보수정 페이지로 이동
	@RequestMapping(value="mypageUpdate")
	public String mypageUpdate(String memType){
		System.out.println("mypageUpdate.jsp로 이동");
		if(memType.equals("1")){
			return "myPageView/mypageUpdateSimple";
		}else{
			return "myPageView/mypageUpdate";
		}
		
	}
	
//	회원탈퇴 페이지로 이동
	@RequestMapping(value="mypageLeave",method=RequestMethod.GET)
	public String mypageLeave(String mem,Model m){
		//System.out.println("탈퇴할 아이디: "+memEmail);
		m.addAttribute("memvo",mem);
		//System.out.println("탈퇴할 아이디 2: "+mem);
		return "myPageView/mypageLeave";
	}
	//회원탈퇴처리	
	@RequestMapping(value="myPageLeaveConfig")
	public String myPageLeaveConfig(MemberVO memberVO){
		int result=0;
		try {
			result=service.deleteMember(memberVO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("탈퇴실패");
		return "mainView/logout";
	}
	@RequestMapping(value="updateSimple")
	public String myPageSimpleUpdate(String updateEmail, String updateSimplePassword,String updateTel){
		System.out.println("updateSimple 전 : "+updateEmail);
		int result = service.updateSimple(updateEmail,updateSimplePassword,updateTel);
		System.out.println("updateSimple 후 : "+result);
		return "myPageView/mypageUpdateComplete";
	}
	
	@RequestMapping(value="updateBusker")
	public String myPageBuskerUpdate(MemberVO memberVO){
		System.out.println("updateBusker 전 : "+memberVO.getMemEmail());
		int result = service.updateBusker(memberVO);
		System.out.println("updateBusker 후 : "+result);
		return "myPageView/mypageUpdateComplete";
	}
	
	@RequestMapping(value="updateSimpleToBuskerForm")
	public String mypageSimpleToBuskerForm(){
		System.out.println("mypageSimpleToBusker.jsp로 이동");
		return "myPageView/mypageSimpleToBusker";
	}
	
	
	@RequestMapping(value="updateSimpleToBusker")
	public String mypageSimpleToBusker(MemberVO memberVO){
		System.out.println("컨트롤러쪽 멤버비오 : "+memberVO.getMemDetail());
		service.updateSimpleToBusker(memberVO);
		return "myPageView/mypageUpdateComplete";
	}
	
	@RequestMapping(value="gomain")
	public String mypageSimpleToBusker(){
		return "myPageView/goMain";
	}
	
	
	
	@RequestMapping(value="mypageAll")
	public String mypageAll(Model m,HttpSession session,PageVO pageVO,String page,HttpServletRequest request) throws Exception{
		
		String mapping=request.getServletPath();
		
		Object obj = session.getAttribute("login");
		MemberVO mVO = null;
		if(obj!=null) mVO= (MemberVO)obj;

		//################페이징
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		List<ShowVO> showList = showService.selectShowByEmail(mVO.getMemEmail(),pageVO,mapping);
		m.addAttribute("showList",showList);    
		m.addAttribute("page",pageVO);		

		return "myPageView/mypageAll";
	}
	
	// 내가 쓴글 후원하기
	@RequestMapping(value="mypageSponserList")
	public String mypageSponserList(Model m,HttpSession session,PageVO pageVO,String page) throws Exception{

		
		Object obj = session.getAttribute("login");
		MemberVO mVO = null;
		if(obj!=null) mVO= (MemberVO)obj;

		//################페이징
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}

		List<SponserVO> sponserList = supportService.myPageSponList(pageVO, mVO.getMemEmail());
		
		m.addAttribute("sponserList", sponserList);
		m.addAttribute("page",pageVO);
		
		return "myPageView/mypageAll";
	}

	// 내가 쓴글 후원 해주세요
	@RequestMapping(value="mypageBackedList")
	public String mypageBackedList(Model m,HttpSession session,PageVO pageVO,String page) throws Exception{

		
		Object obj = session.getAttribute("login");
		MemberVO mVO = null;
		if(obj!=null) mVO= (MemberVO)obj;

		//################페이징
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		List<BackedVO> backedList = supportService.myPageBackedList(pageVO, mVO.getMemEmail()); 

		m.addAttribute("backedList", backedList);
		m.addAttribute("page",pageVO);
		
		return "myPageView/mypageAll";
	}

	@RequestMapping("mypageVideoList")
	public String mypageVideoList(Model m,HttpSession session,PageVO pageVO,String page) throws Exception{

		Object obj = session.getAttribute("login");
		MemberVO mVO = null;
		if(obj!=null) mVO= (MemberVO)obj;

		//################페이징
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		List<VideoVO> videoList = videoService.myPageVideoList(pageVO,mVO.getMemEmail());
		m.addAttribute("videoList", videoList);
		m.addAttribute("page",pageVO);
		
		return "myPageView/mypageAll";
	}
	
	@RequestMapping("mypageTogetherList")
	public String mypageTogetherList(Model m,HttpSession session,PageVO pageVO,String page) throws Exception{

		Object obj = session.getAttribute("login");
		MemberVO mVO = null;
		if(obj!=null) mVO= (MemberVO)obj;

		//################페이징
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}
		
		List<TogetherVO> toList=togetherService.selectAllTogether(pageVO,mVO.getMemEmail());
		
		m.addAttribute("toList",toList);
		m.addAttribute("page",pageVO);
		
		return "myPageView/mypageAll";
	}
		
}
