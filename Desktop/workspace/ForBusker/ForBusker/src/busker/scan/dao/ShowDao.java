package busker.scan.dao;

import busker.scan.vo.ShowVO;

public interface ShowDao {
	
	//공연등록
	public int insertShow(ShowVO shvo) throws Exception;

}
