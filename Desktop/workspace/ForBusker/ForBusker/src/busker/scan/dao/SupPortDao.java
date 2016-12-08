package busker.scan.dao;

import java.util.List;

import busker.scan.vo.SponserVO;

public interface SupPortDao {

	public int insertSpon(SponserVO sponserVO);
	
	public List<SponserVO> sponList();
	
	public SponserVO selectSpon(int num);
}
