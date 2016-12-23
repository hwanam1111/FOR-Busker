package busker.scan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import busker.scan.dao.ShowDao;
import busker.scan.vo.PageVO;
import busker.scan.vo.ShowVO;

@Service
public class ShowServiceImpl implements ShowService {
	
	@Autowired
	private ShowDao dao; 
	
	@Override
	public int insertShow(ShowVO shvo) throws Exception{
		System.out.println("showService쪽 vo값" + shvo.getMemEmail());
		
		int result;
		result = dao.insertShow(shvo);
		return result;
	}

	@Override
	public List<ShowVO> selectList(List sendList) throws Exception {
		System.out.println("showService_selectList내부진입");
		return dao.selectShow(sendList);
	}

	//find a show 눌렀을 떄
	@Override
	public List selectList(String loc,PageVO pageVO) throws Exception {
		System.out.println("showService_selectList내부진입(string버전)");
		int showLocCount =showLocCount(loc);
		pageVO.setCount(showLocCount);				//together 테이블에서 가져온 값 pageVO에 Count에 set해주기
		PageVO pVO = pagingMaster(pageVO,null);
		int curPage = pVO.getCurPage();
		
		return dao.selectShow(loc,curPage);
	}

	//show테이블의 마포일 때  row 갯수 가져오기
	public int showLocCount(String loc) {
		int showLocCount=dao.showLocCount(loc);
		return showLocCount;
	}

	//페이징 ㄱ ㄱ
	public PageVO pagingMaster(PageVO pageVO,String mapping){
			
		int curPage = pageVO.getCurPage();//현제 페이지 가져오기
		int limit=0;								
		
		//화면에 보일 리스트 갯수 지정
		if(mapping!=null){
			limit=9;
		}else{
			limit=2;
		}
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
	
	
	@Override
	public List selectList(int shno) throws Exception {
		System.out.println("showService_selectList내부진입(int버전)");
		
		return dao.selectShow(shno);
	}
	

	
	public List selectList(String date, String select, String val,PageVO pageVO) throws Exception {
		System.out.println("showService_selectList내부진입(검색버전)  데이트는 :"+date+"/셀렉트는"+select+"발은"+val);
		int showSearchCount = showSearchCount(date,select,val);
		pageVO.setCount(showSearchCount);				//together 테이블에서 가져온 값 pageVO에 Count에 set해주기
		PageVO pVO = pagingMaster(pageVO,null);
		int curPage = pVO.getCurPage();
		return dao.selectShow(date,select,val,curPage); 
	}
 
	//show테이블의 검색어일 때  row 갯수 가져오기
	public int showSearchCount(String date, String select, String val){
		int showSearchCount = dao.showSearchCount(date,select,val);
		return showSearchCount;
	}
	
	//slide 눌렀을때 정보가지고오기
	public ShowVO selectShowByNum(int shNo){
		return dao.selectShowByNum(shNo);
	}

	
	//해당 이메일로 등록한 show 가져오기
	@Override
	public List<ShowVO>selectShowByEmail (String email,PageVO pageVO,String mapping){
		int myShowCount=myShowCount(email);
		
		pageVO.setCount(myShowCount);				
		PageVO pVO = pagingMaster(pageVO,mapping);
		int curPage = pVO.getCurPage();
		System.out.println("서비스 curpage :"+curPage);
		return dao.selectShowByEmail(email,curPage);
	}
	//show테이블에서 해당 이메일의 갯수 가져오기
	@Override
	public int myShowCount(String email){
		int myShowCount=dao.myShowCount(email);
		return myShowCount;
	}

	//수정하기
	public int updateShow(ShowVO showVO){
		int result = dao.updateShow(showVO);
		return result;
	}
	
	//삭제하기
	public int deleteShow(int shNo){
		int result = dao.deleteShow(shNo);
		return result;
	}

	public ShowVO selectList(String email, String videoURL, String coords) {
		// TODO Auto-generated method stub
		ShowVO vo = dao.selectShow(email,videoURL,coords);
		return vo;
	} 		

	
}
