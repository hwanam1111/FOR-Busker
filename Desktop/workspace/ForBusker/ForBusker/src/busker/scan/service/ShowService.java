package busker.scan.service;

import busker.scan.vo.ShowVO;

public interface ShowService {
	//공연등록
	public int insertShow(ShowVO shvo) throws Exception;
}
