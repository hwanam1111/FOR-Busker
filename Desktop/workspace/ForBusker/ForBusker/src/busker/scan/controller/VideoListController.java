package busker.scan.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// 영상모음 컨트롤러

@Controller
public class VideoListController {
	@RequestMapping(value="videoMain")
	public String main(){
		System.out.println("videoMain.jsp로 이동");
		return "videoCollectionView/videoMain";
	}
	
	@RequestMapping(value="videoView")
	public String view(String imgpath, HttpSession session, Model m){
		
		System.out.println("videoView.jsp로 이동");
//		세셔값 확인 후 list에 값 넣기
		ArrayList<String> list = (ArrayList)session.getAttribute("list");
		
		if(list == null){
			list = new ArrayList<String>();
			 list.add(imgpath);
			 session.setAttribute("list", list);
		}else{
			list.add(imgpath);
			session.setAttribute("list", list);
		}
		
		//m.addAttribute("source","");
		return "videoCollectionView/videoView";
	}	
}
