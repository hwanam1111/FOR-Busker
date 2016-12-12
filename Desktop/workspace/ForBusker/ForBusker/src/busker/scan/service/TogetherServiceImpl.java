package busker.scan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import busker.scan.dao.TogetherDaoImpl;
import busker.scan.vo.PageVO;
import busker.scan.vo.TogetherVO;

@Service
public class TogetherServiceImpl{
	
	@Autowired
	private TogetherDaoImpl dao;

	 
	public List<TogetherVO> selectAllTogether(PageVO pageVO) throws Exception {
		List<TogetherVO> toList=null;
		
		int togeCount = togetherPageCount();
		pageVO.setCount(togeCount);				//together 테이블에서 가져온 값 pageVO에 Count에 set해주기
		PageVO pVO = pagingMaster(pageVO);
		int curPage = pVO.getCurPage();
		
		toList=dao.selectAllTogether(curPage);
		return toList;
	}
	
	//전체 로우 갯수 가져오기 (count)
	public int togetherPageCount(){
		
		int togeCount=dao.togeListCount();
		return togeCount;
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

	public int insertTogether(TogetherVO tovo) throws Exception {
		int result=0;
		result=dao.insertTogether(tovo);
		return result;
	}

	public int deleteTogether(TogetherVO tovo) throws Exception {
		int result=0;
		result=dao.deleteTogether(tovo);
		return result;
	}
	public TogetherVO selectTogetherByNum(TogetherVO tovo)throws Exception{
		System.out.println("service tovo num: "+tovo.getToNo());
		TogetherVO vo=dao.selectTogetherByNum(tovo);
		return vo;
	}
	public int togetherMod(TogetherVO tovo) throws Exception{
		return dao.modifyTogether(tovo);
	}
	public List<TogetherVO> selectBySearchVal(String searchVal,PageVO pageVO) throws Exception {
		List<TogetherVO> toList=null;
		int togeCount = toSearchCount(searchVal);
		
		pageVO.setCount(togeCount);				//together 테이블에서 가져온 값 pageVO에 Count에 set해주기
		PageVO pVO = pagingMaster(pageVO);
		int curPage = pVO.getCurPage();
		
		toList=dao.selectBySearchVal(searchVal,curPage);
		return toList;
	}
	
	//전체 로우 갯수 가져오기 (count)
	public int toSearchCount(String searchVal){
				
		int togeCount=dao.toSearchCount(searchVal);
		return togeCount;
	}
}
