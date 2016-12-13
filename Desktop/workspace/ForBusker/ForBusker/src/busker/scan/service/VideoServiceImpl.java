package busker.scan.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import busker.scan.dao.VideoDao;
import busker.scan.vo.MemberVO;
import busker.scan.vo.PageVO;
import busker.scan.vo.VideoLikeVO;
import busker.scan.vo.VideoVO;

@Service
public class VideoServiceImpl implements VideoService {

	@Autowired
	private VideoDao videoDao;

//	공지사항 리스트
	@Override
	public List<VideoVO> videoList(PageVO pageVO) throws Exception {

		int videoPageCount = videoPageCount();
		pageVO.setCount(videoPageCount);				//together 테이블에서 가져온 값 pageVO에 Count에 set해주기
		PageVO pVO = pagingMaster(pageVO);
		int curPage = pVO.getCurPage();
		System.out.println("서비스에서 curPage : "+curPage);
		return videoDao.videoList(curPage);
	}
	//전체 로우 갯수 가져오기 (count)
	public int videoPageCount(){
			
		int videoPageCount=videoDao.videoPageCount();
		System.out.println("전체 row갯수 : "+ videoPageCount);
		return videoPageCount;
	}
	
	//페이징 ㄱ ㄱ
	public PageVO pagingMaster(PageVO pageVO){
		
		int curPage = pageVO.getCurPage();			//현제 페이지 가져오기
		int limit=9;								//화면에 보일 리스트 갯수 지정
		
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
	
//	글쓰기
	@Override
	public int videoInsert(VideoVO vvo) throws Exception{
		
		return videoDao.videoInsert(vvo);
		
	}	
	
//	비디오 뷰
	@Override
	public VideoVO videoView(HashMap map) throws Exception{
		

		return videoDao.videoView(map);
	}
	
//	비디오 삭제
	@Override
	public	VideoVO videoDelete(HashMap map) throws Exception{
		
		return videoDao.videoDelete(map);
	}
	
//	비디오 수정
	@Override
	public int videoUpdate(VideoVO nvo) throws Exception{
		
		return videoDao.videoUpdate(nvo);
	}	
	
//	비디오 수정 폼
	@Override
	public VideoVO videoViewSelect(VideoVO vvo) throws Exception{
		
		return videoDao.videoViewSelect(vvo);
		
	}

//	조회수
	@Override
	public void videoCount(VideoVO vvo) throws Exception {
		
		videoDao.videoCount(vvo);
		
	}

//	실시간 리스트
	@Override
	public List<VideoVO> videoNewList() throws Exception {
		
		return videoDao.videoNewList();
	}

//	좋아요
	@Override
	public int videoLikeInsert(VideoLikeVO vlo) throws Exception {
		
		return videoDao.videoLikeInsert(vlo);
	}
 
//  좋아요 업데이트 +1
	@Override
	public int videoLikeUpdate(VideoVO vvo) throws Exception {
		return videoDao.videoLikeUpdate(vvo);
	}

//	비디오 뷰 들어올 때 좋아요했는지 확인
	@Override
	public List<VideoLikeVO> videoLikeList(VideoVO vvo) throws Exception {
		return videoDao.videoLikeList(vvo);
	}

//	좋아요 삭제
	@Override
	public int videoLikeDelete(VideoLikeVO vlo) throws Exception {
		return videoDao.videoLikeDelete(vlo);
	}

//	좋아요 업데이트 -1
	@Override
	public int videoLikeMinusUpdate(VideoVO vvo) throws Exception {
		return videoDao.videoLikeMinusUpdate(vvo);
	}

//	좋아요한 페이지 리스트
	@Override
	public List<VideoLikeVO> videoMypageLikeList(String memEmail) throws Exception {
	
		System.out.println("videoService:"+memEmail);
		return videoDao.videoMypageLikeList(memEmail);

}


//	좋아요 되있는 글도 삭제
	@Override
	public VideoLikeVO videoLikeParentDelete(HashMap hashmap) {

		return videoDao.videoLikeParentDelete(hashmap);
	} 




}
