package busker.scan.controller;

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
	public String view(Model m){
		
		System.out.println("videoView.jsp로 이동");
		//m.addAttribute("source","");
		return "videoCollectionView/videoView";
	}	
}
