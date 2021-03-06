package busker.scan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import busker.scan.dao.SupPortDao;
import busker.scan.vo.BackedVO;
import busker.scan.vo.PageVO;
import busker.scan.vo.SponserVO;

@Service
public class SupPortServiceImpl implements SupPortService {

	@Autowired
	private SupPortDao supportDao;
	
	//후원하기 입력
	@Override
	public int insertSpon(SponserVO sponserVO) throws Exception {
		
		int result = supportDao.insertSpon(sponserVO);
		return result;
	}

	//후원하기 List 페이지
	@Override
	public List<SponserVO> sponList(PageVO pageVO, String search) throws Exception {
		

		//###################페이징
		int sponCount = sponPageCount(search);		//테이블의 row카운트
		
		pageVO.setCount(sponCount);				//sponser 테이블에서 가져온 값 pageVO에 Count에 set해주기
		PageVO pVO = pagingMaster(pageVO);
		int curPage = pVO.getCurPage();
		List<SponserVO> sponList = supportDao.sponList(curPage,search);
		return sponList;
	}
	


	//후원하기 View
	@Override
	public SponserVO selectSpon(int num) throws Exception {
		
		SponserVO sVO = supportDao.selectSpon(num);
		return sVO;
	}
	
	//후원하기 삭제
	@Override
	public int deleteSpon(int sponNo) throws Exception {

		int result = supportDao.deleteSpon(sponNo);
		return result;
	}
	
	//후원하기 수정폼
	@Override
	public SponserVO sponUpdateForm(SponserVO sponserVO) throws Exception {
		SponserVO sVO = supportDao.sponUpdateForm(sponserVO);
		return sVO;
	}
	
	//후원하기 수정
	@Override
	public int sponUpdate(SponserVO sponserVO) throws Exception {
		int result = supportDao.sponUpdate(sponserVO);
		return result;
	}
	
//후원해주세요 ###############################################################	
	//후원해주세요 입력
	@Override
	public int insertBacked(BackedVO backedVO) throws Exception {
		int result = supportDao.insertBacked(backedVO);
		return result;
	}

	//후원해주세요 등록form에서 url 띄우기
	@Override
	public String selectPrVideo(String memEmail) throws Exception {
		String prUrl = supportDao.selectPrVideo(memEmail);
		return prUrl;
	}
	
	//후원해주세요 리스트
	@Override
	public List<BackedVO> backedList(PageVO pageVO,String search) throws Exception {
		
		//###################페이징
		int backedCount = backedPageCount(search);		//테이블의 row카운트
		pageVO.setCount(backedCount);				//sponser 테이블에서 가져온 값 pageVO에 Count에 set해주기

		System.out.println("테이블의 row 카운트  : " +pageVO.getCount());
		
		PageVO pVO = pagingMaster(pageVO);
		int curPage = pVO.getCurPage();
		
		List<BackedVO> backedList = supportDao.backedList(curPage,search);
		
		
		return backedList;
	}

	//후원해주세요 View
	@Override
	public BackedVO selectBacked(int num) throws Exception {
		
		BackedVO bVO = supportDao.selectBacked(num);
		return bVO;
		
	}
	
	//후원해주세요 삭제
	@Override
	public int deleteBacked(int backedNo) throws Exception {
		int result = supportDao.deleteBacked(backedNo);
		return result;
	}
	
	//후원해주세요 수정폼
	@Override
	public BackedVO backedUpdateForm(BackedVO backedVO) throws Exception {
		BackedVO bVO = supportDao.backedUpdateForm(backedVO);
		return bVO;
	}
	
	//후원해주세요 수정
	@Override
	public int backedUpdate(BackedVO backedVO) throws Exception {
		int result = supportDao.backedUpdate(backedVO);
		return result;
	}

//############################################################	
	
	//sponser 테이블 카운트 해오기
	public int sponPageCount(String search){
		
		int sponCount=supportDao.sponListCount(search);
		return sponCount;
	}
	
	
	//backed 테이블 카운트 해오기
	public int backedPageCount(String search){
		int backedCount=supportDao.backedListCount(search);
		return backedCount;
	}
	
	
	
	//후원하기 List 페이지
	@Override
	public List<SponserVO> myPageSponList(PageVO pageVO, String memEmail) throws Exception {
		
		//###################페이징
		int sponCount = myPageSponPageCount(memEmail);		//테이블의 row카운트
		
		pageVO.setCount(sponCount);				//sponser 테이블에서 가져온 값 pageVO에 Count에 set해주기
		PageVO pVO = pagingMaster(pageVO);
		int curPage = pVO.getCurPage();
		List<SponserVO> sponList = supportDao.myPageSponList(curPage,memEmail);
		return sponList;
	}
	
	//sponser 테이블에 내가 쓴 글 카운트 해오기
	@Override
	public int myPageSponPageCount(String memEmail){
		
		int sponCount=supportDao.myPageSponListCount(memEmail);
		return sponCount;
	}
	
	
	//후원해주세요 리스트
	@Override
	public List<BackedVO> myPageBackedList(PageVO pageVO,String memEmail) throws Exception {
			
		//###################페이징
		int backedCount = myPageBackedPageCount(memEmail);		//테이블의 row카운트
	
		pageVO.setCount(backedCount);				//sponser 테이블에서 가져온 값 pageVO에 Count에 set해주기
		
		PageVO pVO = pagingMaster(pageVO);
		int curPage = pVO.getCurPage();
		
		List<BackedVO> backedList = supportDao.myPagebackedList(curPage,memEmail);
		
			
		return backedList;
	}
	

	//backed 테이블에 내가 쓴 글 카운트 해오기
	@Override
	public int myPageBackedPageCount(String memEmail){
		int sponCount=supportDao.myPageBackedListCount(memEmail);
		return sponCount;
	}
	
	
	//PageVO클래스 set해주는부분
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




	

	



	


	
	

	
	
}
