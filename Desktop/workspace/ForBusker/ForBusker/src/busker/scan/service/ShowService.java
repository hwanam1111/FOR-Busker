package busker.scan.service;

import java.util.List;

import busker.scan.vo.PageVO;
import busker.scan.vo.ShowVO;

public interface ShowService {
	//공연등록
	public int insertShow(ShowVO shvo) throws Exception;
	public List selectList(List sendList) throws Exception;
	public List selectList(String loc,PageVO pageVO)throws Exception; 
	public List selectList(int shno)throws Exception;
	public List selectList(String date, String select, String val,PageVO pageVO) throws Exception;
	public ShowVO selectList(String email, String videoURL, String coords);
	public ShowVO selectShowByNum(int shNo);
	public List<ShowVO> selectShowByEmail(String email, PageVO pageVO, String mapping);
	public int myShowCount(String email);

	//수정
	public int updateShow(ShowVO showVO);
	//삭제
	public int deleteShow(int shNo);	
}
