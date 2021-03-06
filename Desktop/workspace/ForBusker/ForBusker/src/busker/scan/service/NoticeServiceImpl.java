package busker.scan.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import busker.scan.dao.NoticeDao;
import busker.scan.vo.NoticeVO;
import busker.scan.vo.PageVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
//	공지사항 리스트
	@Override
	public List<NoticeVO> noticeList(PageVO pageVO) throws Exception {

		//paging 부분
		int noticeCount = noticePageCount();
		pageVO.setCount(noticeCount);				//notice 테이블에서 가져온 값 pageVO에 Count에 set해주기
		PageVO pVO = pagingMaster(pageVO);
		int curPage = pVO.getCurPage();
		
		return noticeDao.noticeList(curPage);
	}
	
	//공지사항 테이블에서 전체 row갯수 가져오기
	public int noticePageCount(){
		int noticeCount = noticeDao.noticePageCount();

		return noticeCount;
	}
	
//	공지사항 뷰 수정 셀렉트
	@Override
	public NoticeVO noticeViewSelect(NoticeVO nvo) throws Exception{
		
		return noticeDao.noticeViewSelect(nvo);
		
	}
	
//	공지사항 뷰
	@Override
	public NoticeVO noticeView(HashMap map) throws Exception{
		

		return noticeDao.noticeView(map);
	}
	
	
//	공지사항 등록
	@Override
	public int noticeInsert(NoticeVO nvo) throws Exception {
		
		System.out.println("insertNotice쪽 vo값" + nvo.getNoticeTitle());
		
		return noticeDao.noticeInsert(nvo);
	}
	
//	공지사항 삭제
	@Override
	public NoticeVO noticeDelete(HashMap map) throws Exception{
		
		return noticeDao.noticeDelete(map);
	}
	
//	공지사항 수정
	@Override
	public int noticeUpdate(NoticeVO nvo) throws Exception{
		
		return noticeDao.noticeUpdate(nvo);
	}	

	//페이징 ㄱ ㄱ
	public PageVO pagingMaster(PageVO pageVO){

		int curPage = pageVO.getCurPage();			//현제 페이지 가져오기
		int limit=5;								//화면에 보일 리스트 갯수 지정

		int sponCount = pageVO.getCount();   //카운트 가져오기
		int maxpage = (sponCount+limit-1)/limit;	  //마지막 페이지 구하기 
		int startpage = ((curPage-1)/5) * 5 + 1; //1부터 5까지는 1 6부터 10까지는 2
		//한 화면에 출력되는 쪽 번호의 시작번호
		int endpage = startpage + 5 - 1;      //화면 마지막 페이지 지정


		// 화면 마지막 페이지가 한페이지거나, 마지막페이지인 경우
		if(endpage > maxpage) 
			endpage = maxpage;

		if(endpage < curPage) 
			curPage = endpage;

		//############ 이전,다음 값 지정
		int previPage = curPage-1;
		int nextPage = curPage+1;	    

		//############ 이전버튼, 다음버튼을 눌렀을때  1페이지 혹은 마지막 페이지를 눌렀을 경우
		if(previPage < 1){
			previPage=1;
		}
		if(nextPage>endpage){
			nextPage=endpage;
		}

		pageVO.setStartPage(startpage);	//startPage set해주기
		pageVO.setEndPage(endpage);		//endPage set 해주기
		pageVO.setPreviPage(previPage);
		pageVO.setNextPage(nextPage);
		return pageVO;

	}		
	 
}
