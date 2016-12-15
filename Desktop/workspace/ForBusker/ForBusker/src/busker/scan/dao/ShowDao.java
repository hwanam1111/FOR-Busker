package busker.scan.dao;

import java.util.List;

import busker.scan.vo.ShowVO;

public interface ShowDao {
	
	//공연등록
	public int insertShow(ShowVO shvo) throws Exception;
	public List selectShow(List list) throws Exception;
	public List selectShow(String loc,int curPage) throws Exception;
	//loc들어왔을 때 row 갯수 가져오기
	public int showLocCount(String loc);
	
	public List selectShow(int shno) throws Exception;
	
	public List selectShow(String date, String select, String val,int curPage) throws Exception;
	//검색어가 들어왔을 때 row 갯수 가져오기
	public int showSearchCount(String date, String select, String val);
	public ShowVO selectShowByNum(int shNo);
}
