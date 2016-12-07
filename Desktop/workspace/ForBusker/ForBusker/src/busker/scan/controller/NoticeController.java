package busker.scan.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import busker.scan.dao.NoticeDao;
import busker.scan.dao.NoticeDaoImpl;
import busker.scan.service.NoticeService;
import busker.scan.vo.NoticeVO;

@Controller
public class NoticeController {
	
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired
	private NoticeService service;

//	공지사항 페이지로 이동
	@RequestMapping(value="noticeList")
	public String noticeList(NoticeVO noticevo, Model m) throws Exception{
		System.out.println("noticeList.jsp로 이동");
		
		List<NoticeVO> list = service.noticeList();
		System.out.println(list);
		m.addAttribute("list", list);
		
		return "noticeView/noticeList";
			
	}
	
//	글 수정 폼
	@RequestMapping(value="noticeFormUpdate")
	public String noticeFormUpdate(NoticeVO noticevo, Model m) throws Exception{
		
		NoticeVO noticeViewSelect = service.noticeViewSelect(noticevo);
		m.addAttribute("noticeViewSelect", noticeViewSelect);
		return "noticeView/noticeFormUpdate";
	}
	
//	공지사항 뷰 이동
	@RequestMapping(value="noticeView")
	public String noticeView(String noticeNo, Model m) throws Exception{
		System.out.println("noticeView.jsp로 이동");
		System.out.println("글작성 : " + noticeNo);
		HashMap hashmap = new HashMap();
		hashmap.put("noticeNo", noticeNo);
		
		NoticeVO noticeView = service.noticeView(hashmap);
		
		if(noticeView!=null){
		m.addAttribute("map", noticeView);
		}else{
		m.addAttribute("map", "null");
		}
		return "noticeView/noticeView";
	}
	
//	글삭제
	@RequestMapping(value="noticeFormDelete.do")
	public String noticeFormDelete(String noticeNo, Model m) throws Exception{
		System.out.println("noticeFormDelete.jsp로 이동");
		System.out.println("글삭제 : " + noticeNo);
		HashMap hashmap = new HashMap();
		hashmap.put("noticeNo", noticeNo);
		
		NoticeVO noticeDelete = service.noticeDelete(hashmap);
		
		if(noticeDelete==null){
			m.addAttribute("state", "yes");
			m.addAttribute("message", "삭제성공");
		}else{
			m.addAttribute("state", "no");
			m.addAttribute("message", "실패");
		}
		
		
		return "noticeView/noticeFormDelete";
	}
	
	
//	글 수정
	@RequestMapping(value="noticeFormUpdateOk")
	public String noticeUpdate(NoticeVO nvo, Model m) throws Exception{
		System.out.println("noticeFormUpdate.jsp로 이동");
		/* ######################## 로그 확인 ######################## */
		logger.info("NoticeVO.noticeNo" + nvo.getNoticeNo());
		logger.info("NoticeVO.noticeTitle" + nvo.getNoticeTitle());
		logger.info("NoticeVO.noticeContent" + nvo.getNoticeContent());
		/* ######################################################### */
		
		int resultCnt = service.noticeUpdate(nvo);
		String result="";
		
		
		if(resultCnt == 1) {
			result = "글 수정 성공";
		}else{
			result = "글 수정 실패";
		}
		
		m.addAttribute("result", result);
		m.addAttribute("nvo", nvo);
		
		
		return "noticeView/noticeFormUpdateOk";
	}
	
	
//	공지사항 폼 이동
	@RequestMapping(value="noticeForm")
	public String noticeForm(){
		System.out.println("noticeForm.jsp로 이동");
		return "noticeView/noticeForm";
	}
	
	
//	공지사항 입력 OK 이동
	@RequestMapping(value="noticeFormOk.do")
	public String noticeFormOk(NoticeVO nvo, Model m) throws Exception{
		/* ######################## 로그 확인 ######################## */
		logger.info("NoticeVO.noticeNo" + nvo.getNoticeNo());
		logger.info("NoticeVO.noticeTitle" + nvo.getNoticeTitle());
		logger.info("NoticeVO.noticeContent" + nvo.getNoticeContent());
		logger.info("NoticeVO.noticeDate" + nvo.getNoticeDate());
		/* ######################################################### */
		
		int resultCnt = service.noticeInsert(nvo);
		String result = "";
		if(resultCnt == 0){
			result = "실패냥";
		} else {
			result = "성공이냥";
		}
		
		m.addAttribute("result", result);
		m.addAttribute("nvo", nvo);
		
		System.out.println("noticeFormOk.jsp로 이동");
		return "noticeView/noticeFormOk";
	}
	
}
