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
import busker.scan.vo.*;
// 메세지 컨트롤러

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

		
		System.out.println("초기 들어오는 smsSendEmail값  : " + sms.getSmsSendEmail());
		System.out.println("초기 들어오는 smsReceiveEmail값  : " +sms.getSmsReceiveEmail());
		
		if(sms.getSmsReceiveEmail().equals(mem.getMemEmail())){
			sms.setSmsReceiveEmail(sms.getSmsTo());
			if(sms.getSmsTo().equals(mem.getMemEmail())){
				sms.setSmsSendEmail(sms.getSmsTo());
				sms.setSmsReceiveEmail(sms.getSmsFrom());
				System.out.println("2번쨰 if문 안의 sendEmail  :  " + sms.getSmsSendEmail());
				System.out.println("2번쨰 if문 안의 receiveEmail  : " + sms.getSmsReceiveEmail());
			}
		}
	/*	//쪽지함에서 그 사람에게 다시 메시지를 보낼때 
		if(sms.getSmsReceiveEmail().equals(mem.getMemEmail())){
			System.out.println("쪽지함에서 그 사람에게 다시 메시지를 보낼때 ");
			sms.setSmsSendEmail(sms.getSmsFrom());
			sms.setSmsReceiveEmail(sms.getSmsTo());
			//	sms.setSmsSendEmail(sms.getSmsTo());
			//		sms.setSmsTo(sms.getSmsFrom());
			//		sms.setSmsFrom(to);

			System.out.println("바뀐 smsSendEmail 값 : " + sms.getSmsSendEmail());
			System.out.println("바뀐 smsReceiveEmail 값 : " + sms.getSmsReceiveEmail());
			System.out.println("바뀐 smsTo 값 : " + sms.getSmsTo());
			System.out.println("바뀐 smsSmsFrom 값 : " + sms.getSmsFrom());
		}*/
		
		service.InsertMessage(sms);
		
		return "messageView/MessageInsert";
	}	

	
	@RequestMapping(value="chatView",produces = "application/text; charset=utf8")
	@ResponseBody
	public String Message(SmsVO sms,HttpSession session) throws Exception{
		//로그인 한 사람의 session값 가져오기
		Object obj= session.getAttribute("login");
		MemberVO mem= null;
		if(obj!=null){
			mem = (MemberVO)obj;
		}

		// 받는 사람이 나일때 읽음 표시
		if(sms.getSmsReceiveEmail().equals(mem.getMemEmail())){
			 service.updateMessage(sms);
		}
		
		//select 해온 문장중 보기를 눌렀을시 해당하는 글 내용 가져오기
		List<SmsVO> list =service.selectMessageByNoType(sms);
	
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
	
	@RequestMapping(value="deleteMessage",produces = "application/text; charset=utf8")
	@ResponseBody
	public String MessageDelete(SmsVO sms) throws Exception{
		
		service.deleteMessage(sms);
		
		return "null";
	}

}