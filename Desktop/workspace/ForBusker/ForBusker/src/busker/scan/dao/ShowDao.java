package busker.scan.dao;

import java.util.List;

import busker.scan.vo.ShowVO;

public interface ShowDao {
	
	//공연등록
	public int insertShow(ShowVO shvo) throws Exception;
	public List selectShow(List list) throws Exception;
	public List selectShow(String loc) throws Exception;
	public List selectShow(int shno) throws Exception;
	public List selectShow(String date, String select, String val) throws Exception;

}
