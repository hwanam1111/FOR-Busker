package busker.scan.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import busker.scan.service.MemberService;
import busker.scan.service.ShowService;
import busker.scan.service.VideoService;
import busker.scan.vo.BestVideoVO;
import busker.scan.vo.MemberVO;
// 메인페이지 컨트롤러 
import busker.scan.vo.ShowVO;

@Controller
public class MainController {
	
	@Autowired
	private ShowService service;
	
	@Autowired
	private VideoService videoService;
	
//	메인 페이지로 이동
	@RequestMapping(value="main")
	public String main(Model m) throws Exception{
		System.out.println("main.jsp로 이동");

		List<BestVideoVO> vlist = videoService.videoBest();
		//베스트 3명
		m.addAttribute("vlist", vlist);
		
		return "mainView/main";
	}
	
//	로그인 페이지로 이동
	@RequestMapping(value="login")
	public String login(){
		System.out.println("login.jsp로 이동");
		return "mainView/login";
	}
	
//	로그아웃 페이지로 이동
	@RequestMapping(value="logout")
	public String logout(){
		System.out.println("logout.jsp로 이동");
		return "mainView/logout";
	}

//	회원가입 페이지로 이동
	@RequestMapping(value="join")
	public String join(){
		System.out.println("join.jsp로 이동");
		return "mainView/join";
	}
	
//	일반 회원가입 페이지로 이동
	@RequestMapping(value="simpleJoin")
	public String simpleJoin(){
		System.out.println("simpleJoin.jsp로 이동");
		return "mainView/simpleJoin";
	}
	
//	공연자 회원가입 페이지로 이동
	@RequestMapping(value="buskerJoin")
	public String buskerJoin(){
		System.out.println("buskerJoin.jsp로 이동");
		return "mainView/buskerJoin";
	}
	
//	ID / PW 찾기 페이지로 이동
	@RequestMapping(value="loginSearch")
	public String loginSearch(){
		System.out.println("loginSearch.jsp로 이동");
		return "mainView/loginSearch";
	}
	
//	일반 ID 찾기 페이지로 이동
	@RequestMapping(value="simpleIdSearch")
	public String simpleIdSearch(){
		System.out.println("simpleIdSearch.jsp로 이동");
		return "mainView/simpleIdSearch";
	}
	
//	공연자 ID 찾기 페이지로 이동
	@RequestMapping(value="buskerIdSearch")
	public String buskerIdSearch(){
		System.out.println("buskerIdSearch.jsp로 이동");
		return "mainView/buskerIdSearch";
	}
	
//	PW 찾기 페이지로 이동
	@RequestMapping(value="pwSearch")
	public String pwSearch(){
		System.out.println("pwSearch.jsp로 이동");
		return "mainView/pwSearch";
	}
	
	//main에 클릭에 이은 리스트 출력
	@RequestMapping(value="showlistcheck")
	@ResponseBody
	public String showlistcheck(String loc, String val,Model m) throws Exception{
		String[] array=null; //만약 2개의 구가 포함된 값이 넘어왔을때 split한 값을 저장할 string배열
		ArrayList sendList=new ArrayList();  //service에 넘길 list
		ArrayList<ShowVO> temp = new ArrayList<ShowVO>();
		
		JSONArray jArray = new JSONArray();
		System.out.println(loc);
		System.out.println(val);
		
		if(val.equals("2")){ //넘어온var(area에 포함된 구의 개수)가 2일경우
			array=loc.split("_"); //loc(xx_xx식으로 저장되어있음)을 _단위로 나눠서 sendlist에 저장
			sendList.add(array[0]+"구");
			System.out.println("발이 이야");
			sendList.add(array[1]+"구");
		}else{ //loc에 저장된 구의 개수가 1개면
			System.out.println("발이 일이야야"); 
			sendList.add(loc+"구"); // loc을 나눌필요없이 바로 sendlist에 넣어줌
		}
		temp = (ArrayList<ShowVO>)service.selectList(sendList); //service를 통해 DB에 갖다옴 (select를 loc으로 리스트가져옴)
		//m.addAttribute("list",service.selectList(sendList));
		System.out.println(temp.size());
		
		for(int i=0;i<temp.size();i++){//json array에 json을 생성해서 json값을 하나하나 넣어줌
			JSONObject json = new JSONObject();	
			json.put("shno", temp.get(i).getShNo());
			json.put("name", temp.get(i).getShName()); 
			json.put("date", temp.get(i).getShDate());
			json.put("time", temp.get(i).getShTime());
			json.put("videourl", temp.get(i).getShVideo());
			json.put("coords", temp.get(i).getShMapCoords());
			jArray.add(json);
		}
		
		
		System.out.println("제이슨투스트링"+jArray.toString());
		return jArray.toString(); //넘김
	}

	@RequestMapping(value="streamingWindow")
	public String streamingWindow(){
		return "mainView/streamingWindow";
	}
}
