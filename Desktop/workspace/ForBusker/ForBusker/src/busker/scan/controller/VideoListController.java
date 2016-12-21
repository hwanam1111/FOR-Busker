package busker.scan.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Result;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import busker.scan.service.VideoService;
import busker.scan.vo.MemberVO;
import busker.scan.vo.PageVO;
import busker.scan.vo.VideoLikeVO;
import busker.scan.vo.VideoVO;


// 영상모음 컨트롤러

@Controller
public class VideoListController {
	
	@Autowired
	private VideoService service;
	
	private List<HashMap> list;
	
//	영상 업로드
	@RequestMapping(value="videoUpload")
	public String videoUpload(){
		
		return "videoCollectionView/videoUpload";
	}
	
//	영상 리스트
	@RequestMapping(value="videoMain")
	public String main(VideoVO vvo, String page, Model m) throws Exception{
		System.out.println("videoMain.jsp로 이동");
		//페이징 부분 
		PageVO pageVO = new PageVO();
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}
		List<VideoVO> list = service.videoList(pageVO);
		System.out.println(list);
		m.addAttribute("list", list);
		m.addAttribute("page",pageVO);
		
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
	public String videoView(VideoVO vvo, VideoLikeVO vlo , String videoNo, Model m,  String myId, String result,String imgpath, HttpSession session) throws Exception{
		// 해시맵으로 글 넘버
		HashMap hashmap = new HashMap();
		hashmap.put("videoNo", videoNo);
		
		System.out.println("videoView");
		// 화면 뷰
		VideoVO videoView = service.videoView(hashmap);
		
		// 조회수
		service.videoCount(vvo);
		
		// 실시간 새로운 동영상 리스트
		List<VideoVO> videoList = service.videoNewList();
		
		m.addAttribute("list", videoList);

		if(videoView!=null){
			m.addAttribute("map", videoView);
		}else{
			m.addAttribute("map", "");
		}
		m.addAttribute("result", result);
		return "videoCollectionView/videoView";
	}
	
	// 좋아요 누른 리스트
	@RequestMapping(value="videoLikeSearch")
	public String videoLikeSearch(Model m, String videoNo,  String myId, RedirectAttributes rttr,String imgpath, HttpSession session) throws Exception{
		VideoVO vvo=new VideoVO();
		vvo.setVideoNo(Integer.parseInt(videoNo));
		// 좋아요 됬는지 확인
		
		ArrayList<VideoLikeVO> likeList = (ArrayList<VideoLikeVO>) service.videoLikeList(vvo);
		
		String result= "";
		
		
		// 로그인이 됬을때만 확인
		if(myId!=""){
			for(VideoLikeVO temp:likeList){
				System.out.println("temp.getMemLoginEmail : " + temp.getMemLoginEmail());
				if(temp.getMemLoginEmail().equals(myId)) {
				result="OK";
				}
			}
		}
		
		String img=imgpath.substring(imgpath.length()-11);
		list = (List<HashMap>)session.getAttribute("list");
		
		if (list == null) {
			list = new ArrayList<>();
			HashMap hashMap = new HashMap();
			hashMap.put("img", img);
			hashMap.put("videoNo", videoNo);
			hashMap.put("myId", myId);			
			list.add(hashMap);
			session.setAttribute("list", list);
		} else {

			if(list.size()==3){
				list.remove(0);
			}

			String add = "yes";
			
			for(int i=0; i<list.size(); i++){
				if(list.get(i).get("img").equals(img)){
					add = "no";
					break;
				}
			}
			if(add.equals("yes")){
				HashMap hashMap = new HashMap();
				hashMap.put("img", img);
				hashMap.put("videoNo", videoNo);
				hashMap.put("myId", myId);
				list.add(hashMap);
				session.setAttribute("list", list);
			}
		}
		
		rttr.addAttribute("result", result);
		rttr.addAttribute("myId", myId);
		rttr.addAttribute("videoNo", videoNo);
		
		
		return "redirect:videoView.do";
	}
	 
	
//	좋아요 추가
	@RequestMapping(value="videoLikeInsert")
	@ResponseBody
	public String videoLike(VideoVO vvo ,VideoLikeVO vlo, String videoNo, String memLoginEmail) throws Exception{
		
		System.out.println("Controller : " + vlo.getMemLoginEmail());
		System.out.println("Controller String : " + videoNo);
		System.out.println("Controller String : " + memLoginEmail);
		
		 
			// 좋아요 테이블에 insert
			int resultInsertCnt = service.videoLikeInsert(vlo);
			// 비디오 테이블에 update +1
			int resultUpdateCnt = service.videoLikeUpdate(vvo);
			
			String result = "";
			if(resultInsertCnt == 1 && resultUpdateCnt == 1) {
				result ="성공!!";
			}else{
				result="실패 ㅜ";
			}
			
		JSONObject json = new JSONObject();	
		json.put("videoLikeCnt", vlo.getLikeNo());
		json.put("videoMemEmail", vvo.getMemEmail());
		json.put("videoNo", vvo.getVideoNo());
		json.put("videoLike", vvo.getVideoLike());
		
		return json.toString();
	}
	
	
//	좋아요 삭제
	@RequestMapping(value="videoLikeDelete")
	@ResponseBody
	public String videoLikeDel(VideoVO vvo ,VideoLikeVO vlo, Model m, String videoNo) throws Exception{
		
		System.out.println("Controller : " + vlo.getMemLoginEmail());
		
		
			// 좋아요 테이블에 delete
			int resultDeleteCnt = service.videoLikeDelete(vlo);
			// 비디오 테이블에 update -1
			int resultUpdateMinusCnt = service.videoLikeMinusUpdate(vvo);
			
			String resultDel = "";
			if(resultDeleteCnt == 1 && resultUpdateMinusCnt == 1){
				resultDel = "성공";
			}else{
				resultDel = "실패";
			}
			
			m.addAttribute("resultDel", resultDel);
		
		m.addAttribute("vlo", vlo);
		m.addAttribute("vvo", vvo);
		
		return resultDel;
	}
	
//	글삭제
	@RequestMapping(value="videoFormDelete.do")
	public String noticeFormDelete(String videoNo, Model m) throws Exception{
		System.out.println("videoFormDelete.jsp로 이동");
		System.out.println("글삭제 : " + videoNo);
		HashMap hashmap = new HashMap();
		hashmap.put("videoNo", videoNo);
		
		// 좋아요 테이블에 delete
		VideoLikeVO videoLikeParentDelete = service.videoLikeParentDelete(hashmap);
		VideoVO videoDelete = service.videoDelete(hashmap);
		
		// 좋아요페이지 delete
	
		if(videoDelete==null && videoLikeParentDelete==null){
			System.out.println("성공에 들어옴");
			m.addAttribute("state", "yes");
			m.addAttribute("message", "삭제성공");
		}else{
			System.out.println("실패에 들어옴");
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
	
//	좋아요한 페이지로 이동
	@RequestMapping(value="mypageLike")
	public String mypageLike(VideoVO vvo, Model m, String memEmail,String page) throws Exception{
		System.out.println("mypageLike.jsp로 이동");
		
		//페이징 부분 
		PageVO pageVO = new PageVO();
		if(page == null){
			pageVO.setCurPage(1);				//page값이 null이면 1로 지정
		}else{
			int curPage = Integer.parseInt(page); //형변환
			pageVO.setCurPage(curPage);			//현제페이지값 set해주기
		}
						
		List<VideoVO> likeList = service.videoMypageLikeList(memEmail,pageVO);
		m.addAttribute("likeList", likeList); 
		m.addAttribute("page",pageVO);
		
		return "myPageView/mypageLike";
	}
	
}
