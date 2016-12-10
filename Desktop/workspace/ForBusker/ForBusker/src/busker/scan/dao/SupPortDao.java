package busker.scan.dao;

import java.util.List;

import busker.scan.vo.BackedVO;
import busker.scan.vo.PageVO;
import busker.scan.vo.SponserVO;

public interface SupPortDao {

	public int insertSpon(SponserVO sponserVO);
	
	public List<SponserVO> sponList(PageVO pageVO);
	
	public SponserVO selectSpon(int num);
	
	//후원하기 삭제
	public int deleteSpon(int sponNo);
	
	//후원하기 수정폼
	public SponserVO sponUpdateForm(SponserVO sponserVO);
	
	//후원하기 수정
	public int sponUpdate(SponserVO sponserVO);

	
//후원해주세요 #######################################################	
	//후원해주세요 입력
	public int insertBacked(BackedVO backedVO);
	
	//후원해주세요 리스트
	public List<BackedVO> backedList(PageVO pageVO);
	
	//후원해주세요 View 뽑기
	public BackedVO selectBacked(int num);
	
	//후원해주세요 삭제
	public int deleteBacked(int backedNo);
	
	//sponser 테이블 카운트
	public int sponListCount();
	
	//backed 테이블 카운트
	public int backedListCount();
	
	//후원해주세요 수정폼
	public BackedVO backedUpdateForm(BackedVO backedVO);
	
	//후원해주세요 수정
	public int backedUpdate(BackedVO backedVO);
}
