package busker.scan.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import busker.scan.service.MessageService;
// 메세지 컨트롤러
import busker.scan.vo.MemberVO;
import busker.scan.vo.SmsVO;

@Controller
public class MessageController {

	@Autowired
	private MessageService service;
	
	@RequestMapping(value="message")
	public String message(String email,Model m) throws Exception{

		System.out.println("message.jsp로 이동");
		//LIST 생성 후 나에게 온 Message 확인
		List<SmsVO> list= null;
				
		list = service.selectMessage(email);
		// list view 단으로 보냄
		m.addAttribute("mlist", list);

		return "messageView/message";
	}
	
	@RequestMapping(value="sponserMessage.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String sponserMessage(SmsVO sms,Model m,HttpSession session) throws Exception{

		//세션 값 가져오기
		Object obj= session.getAttribute("login");
		MemberVO mem= null;
		if(obj!=null){
			mem = (MemberVO)obj;
		}
		if(sms.getSmsReceiveEmail().equals(mem.getMemEmail())){
			sms.setSmsReceiveEmail(sms.getSmsSendEmail());
			sms.setSmsSendEmail(mem.getMemEmail());
		}
	
		service.InsertMessage(sms);
		
		//select 해온 문장중 보기를 눌렀을시 해당하는 글 내용 가져오기
		List<SmsVO> list =service.selectMessageByNoType(sms,mem.getMemEmail());
	
		//가져온 리스트를 ajax형태인 자바스크립트로 보낼때 
		//JSON배열로 만들어서 전송
		JSONArray jsonarray = new JSONArray();
		for(SmsVO vo : list){ 
			JSONObject json = new JSONObject();
			json.put("smsNo", vo.getSmsNo());
			json.put("smsContent", vo.getSmsContent());
			json.put("smsReceiveEmail", vo.getSmsReceiveEmail());
			json.put("smsSendEmail", vo.getSmsSendEmail());
			json.put("smsStatus", vo.getSmsStatus());
			json.put("smsSendTime", vo.getSmsSendTime());
			json.put("smsType", vo.getSmsType());
			jsonarray.add(json);						
		}
	
		return jsonarray.toString();
	}	
	
	@RequestMapping(value="chatView",produces = "application/text; charset=utf8")
	@ResponseBody
	public String messagechatView(SmsVO sms,HttpSession session) throws Exception{
		
		//로그인 한 사람의 session값 가져오기
		System.out.println("chatView에 들어옴");
		Object obj= session.getAttribute("login");
		MemberVO mem= null;
		if(obj!=null){
			mem = (MemberVO)obj;
		}

		// 받는 사람이 나일때 읽음 표시
		if(sms.getSmsReceiveEmail().equals(mem.getMemEmail())){
			 service.updateMessage(sms,mem.getMemEmail());
		}
		
		//select 해온 문장중 보기를 눌렀을시 해당하는 글 내용 가져오기
		List<SmsVO> list =service.selectMessageByNoType(sms,mem.getMemEmail());
	
		//가져온 리스트를 ajax형태인 자바스크립트로 보낼때 
		//JSON배열로 만들어서 전송
		JSONArray jsonarray = new JSONArray();
		for(SmsVO vo : list){ 
			JSONObject json = new JSONObject();
			json.put("smsNo", vo.getSmsNo());
			json.put("smsContent", vo.getSmsContent());
			json.put("smsReceiveEmail", vo.getSmsReceiveEmail());
			json.put("smsSendEmail", vo.getSmsSendEmail());
			json.put("smsStatus", vo.getSmsStatus());
			json.put("smsSendTime", vo.getSmsSendTime());
			json.put("smsType", vo.getSmsType());
			jsonarray.add(json);						
		}
				
		return jsonarray.toString();		
	}
	
	//메시지 삭제
	@RequestMapping(value="deleteMessage",produces = "application/text; charset=utf8")
	@ResponseBody
	public String mssageDelete(SmsVO sms,HttpSession session) throws Exception{
		
		Object obj= session.getAttribute("login");
		MemberVO mem= null;
		if(obj!=null){
			mem = (MemberVO)obj;
		}
		service.deleteMessage(sms,mem.getMemEmail());
		
		return "null";
	}
	//메세지가 나에게 왔는지 확인
	@RequestMapping(value="messageCheck",produces = "application/text; charset=utf8")
	@ResponseBody
	public String messageCheck(String Email) throws Exception{
		
		String result = service.messageCheck(Email);
		return result; 
	}
	
	
}
