package busker.scan.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import busker.scan.service.VideoService;
import busker.scan.vo.VideoVO;


// 영상모음 컨트롤러

@Controller
public class VideoListController {
	
	@Autowired
	private VideoService service;
	
//	영상 업로드
	@RequestMapping(value="videoUpload")
	public String videoUpload(){
		
		return "videoCollectionView/videoUpload";
	}
	
//	영상 리스트
	@RequestMapping(value="videoMain")
	public String main(VideoVO vvo, Model m) throws Exception{
		System.out.println("videoMain.jsp로 이동");
		List<VideoVO> list = service.videoList();
		System.out.println(list);
		m.addAttribute("list", list);
		
		return "videoCollectionView/videoMain";
	}
	
//	영상 폼
	@RequestMapping(value="videoForm")
	public String videoForm(){
		System.out.println("videoForm.jsp로 이동");
		return "videoCollectionView/videoForm";
	}
	
//	영상 폼 등록
	@RequestMapping(value="videoFormOk.do")
	public String videoFormOk(VideoVO vvo, Model m) throws Exception{
		
		int resultCnt = service.videoInsert(vvo); 
		String result = "";
		if(resultCnt == 1) {
			result ="성공!!";
		}else{
			result="실패 ㅜ";
		}
		
		m.addAttribute("result", result);
		m.addAttribute("vvo", vvo);
		
		System.out.println("videoFormOk.jsp로 이동");
		return "videoCollectionView/videoFormOk";
	}
	
//	글보기 뷰
	@RequestMapping(value="videoView")
	public String videoView(String videoNo, Model m) throws Exception{
		System.out.println("비디오 번호 : " + videoNo);
		HashMap hashmap = new HashMap();
		hashmap.put("videoNo", videoNo);
		
		VideoVO videoView = service.videoView(hashmap);
		
		if(videoView!=null){
			m.addAttribute("map", videoView);
		}else{
			m.addAttribute("map", "null");
		}
		
		return "videoCollectionView/videoView";
	}
	
//	글삭제
	@RequestMapping(value="videoFormDelete.do")
	public String noticeFormDelete(String videoNo, Model m) throws Exception{
		System.out.println("videoFormDelete.jsp로 이동");
		System.out.println("글삭제 : " + videoNo);
		HashMap hashmap = new HashMap();
		hashmap.put("videoNo", videoNo);
		
		VideoVO videoDelete = service.videoDelete(hashmap);
		 
		if(videoDelete==null){
			m.addAttribute("state", "yes");
			m.addAttribute("message", "삭제성공");
		}else{
			m.addAttribute("state", "no");
			m.addAttribute("message", "실패");
		}
		
		
		return "videoCollectionView/videoFormDelete";
	}
	
//	글 수정 폼
	@RequestMapping(value="videoFormUpdate")
	public String noticeFormUpdate(VideoVO videovo, Model m) throws Exception{
		
		VideoVO videoViewSelect = service.videoViewSelect(videovo);
		m.addAttribute("videoViewSelect", videoViewSelect);
		return "videoCollectionView/videoFormUpdate";
	}
	
	
//	글 수정
	@RequestMapping(value="videoFormUpdateOk")
	public String noticeUpdate(VideoVO vvo, Model m) throws Exception{
		System.out.println("videoFormUpdate.jsp로 이동");
		
		int resultCnt = service.videoUpdate(vvo);
		String result="";
		
		
		if(resultCnt == 1) {
			result = "글 수정 성공";
		}else{
			result = "글 수정 실패";
		}
		
		m.addAttribute("result", result);
		m.addAttribute("vvo", vvo);
		
		
		return "videoCollectionView/videoFormUpdateOk";
	}
}
