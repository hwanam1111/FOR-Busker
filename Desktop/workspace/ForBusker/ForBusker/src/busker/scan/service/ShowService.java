package busker.scan.service;

import java.util.List;

import busker.scan.vo.ShowVO;

public interface ShowService {
	//공연등록
	public int insertShow(ShowVO shvo) throws Exception;
	public List selectList(List sendList) throws Exception;
	public List selectList(String loc)throws Exception; 
	public List selectList(int shno)throws Exception;
	public List selectList(String date, String select, String val) throws Exception;

}
