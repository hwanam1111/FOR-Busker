package busker.scan.dao;

import java.util.List;

import busker.scan.vo.BackedVO;
import busker.scan.vo.PageVO;
import busker.scan.vo.SponserVO;

public interface SupPortDao {

	public int insertSpon(SponserVO sponserVO);
	
	public List<SponserVO> sponList(PageVO pageVO);
	
	public SponserVO selectSpon(int num);
	
	//후원해주세요 입력
	public int insertBacked(BackedVO backedVO);
	
	//후원해주세요 리스트
	public List<BackedVO> backedList();
	
	//후원해주세요 View 뽑기
	public BackedVO selectBacked(int num);
	
	//sponser 테이블 카운트
	public int sponListCount();
	
	//backed 테이블 카운트
	public int backedListCount();
}
