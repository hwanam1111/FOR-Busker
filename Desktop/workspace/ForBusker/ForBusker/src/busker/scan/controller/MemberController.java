package busker.scan.controller;

import org.apache.log4j.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import busker.scan.service.MemberService;
import busker.scan.vo.MemberVO;

@Controller
public class MemberController {

	private final Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired
	private MemberService service;
	
//	로그인확인 페이지로 이동
	@RequestMapping(value="loginOK")
	public String loginOK(MemberVO memberVO, Model m, HttpSession session) throws Exception{
		System.out.println("loginOK.jsp로 이동");
		System.out.println(memberVO.getMemEmail());
		System.out.println(memberVO.getMemPw());
		MemberVO ok = null;
		ok= service.selectMember(memberVO);
		String result="";	
		String message="";
	
		if(ok!=null){
			result="mainView/loginOK";
			message=ok.getMemEmail()+"님 로그인하셨습니다.";
			m.addAttribute("vo",ok);
			session.setAttribute("login", ok);
		}else{
			result="mainView/loginOK";
			message="로그인실패";
			
		}
		
		m.addAttribute("message",message);
		
		return result;
	}
	
	
//	회원가입 확인 페이지로 이동
	@RequestMapping(value = "joinOk")
	public String insertMember(MemberVO vo, Model m, HttpServletRequest req) throws Exception{
		
		
		logger.info("MemberVO.mememail : " + vo.getMemEmail());
		logger.info("MemberVO.mempw : " + vo.getMemPw());
		logger.info("MemberVO.memnick : " + vo.getMemNick());
		logger.info("MemberVO.memphone : " + vo.getMemPhone());
		logger.info("memberVO.memteamphoto : " + vo.getFile());
		logger.info("MemberVO.memteamtype : " + vo.getMemTeamType());
		logger.info("MemberVO.memteamname : " + vo.getMemTeamName());
		logger.info("MemberVO.memvideo : " + vo.getMemVideo());
		logger.info("MemberVO.memdetail : " + vo.getMemDetail());
		logger.info("MemberVO.memstatus : " + vo.getMemStatus());
		logger.info("MemberVO.memtype : " + vo.getMemType());
		
		int resultCnt = service.insertMember(vo);
		String result = "";
		  if ( resultCnt == 0 ){
		   result = "실패당";
		  } else {
		   result = "성공이당";
		  }
		  
		  m.addAttribute("result", result);
		  m.addAttribute("vo", vo);
		
		return "mainView/joinOk";
	}
	
//	아이디 중복체크
	@RequestMapping(value="idchecked.do")
	public String idchecked(String userid, Model m, HttpSession session) throws Exception{
		System.out.println("idchecked.jsp로 이동");
		System.out.println(userid);
		MemberVO ok = null;
		MemberVO memberVO = new MemberVO();
		memberVO.setMemEmail(userid);
		ok= service.selectEmail(memberVO);
		String result="";	
	
		if(ok!=null){
			result="mainView/idchecked";
			m.addAttribute("vo",ok);
		}else{
			result="mainView/idchecked";
		}
		
		return result;
	}
	
	
//	이메일 인증
	@RequestMapping(value="gmail.do")
	public String gmail(){
		System.out.println("Gmail.jsp로 이동");
		return "mainView/Gmail";
	}
	
	
}
