package busker.scan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import busker.scan.service.MemberServiceImpl;
import busker.scan.vo.MemberVO;

// 마이페이지 컨트롤러

@Controller
public class MyPageController {

	@Autowired
	private MemberServiceImpl service;
	
//	정보수정 페이지로 이동
	@RequestMapping(value="mypageUpdate")
	public String mypageUpdate(){
		System.out.println("mypageUpdate.jsp로 이동");
		return "myPageView/mypageUpdate";
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
}
