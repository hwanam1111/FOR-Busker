package busker.scan.service;

import java.util.List;

import busker.scan.vo.SponserVO;

public interface SupPortService {

	//후원하기 등록
	public int insertSpon(SponserVO sponserVO) throws Exception;
	
	//후원하기 리스트 
	public List<SponserVO> sponList() throws Exception;
	
	//후원하기View
	public SponserVO selectSpon(int num) throws Exception;
}
