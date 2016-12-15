package busker.scan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import busker.scan.service.MemberServiceImpl;
import busker.scan.service.VideoServiceImpl;
import busker.scan.vo.MemberVO;
import busker.scan.vo.VideoVO;

// 마이페이지 컨트롤러

@Controller
public class MyPageController {

	@Autowired
	private MemberServiceImpl service;
	@Autowired
	private VideoServiceImpl videoService;
	
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
			
			//System.out.println("탈퇴성공");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("탈퇴실패");
		return "mainView/logout";
	}
	@RequestMapping(value="updateSimple")
	public String myPageSimpleUpdate(String updateEmail, String updateSimplePassword,String updateTel){
		System.out.println("으아:"+updateEmail);
		int result = service.updateSimple(updateEmail,updateSimplePassword,updateTel);
		System.out.println("됏니:"+result);
		return "myPageView/mypageUpdateComplete";
	}
	
	@RequestMapping(value="updateBusker")
	public String myPageBuskerUpdate(MemberVO memberVO){
		System.out.println("으아:"+memberVO.getMemEmail());
		int result = service.updateBusker(memberVO);
		System.out.println("됏니:"+result);
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
	public String mypageAll(VideoVO vvo, Model m, String email) throws Exception{
		
		List<VideoVO> videoList = videoService.videoAll(email);
		m.addAttribute("videoList", videoList);
		
		return "myPageView/mypageAll";
	}
}
