package busker.scan.service;

import java.util.List;

import busker.scan.vo.BackedVO;
import busker.scan.vo.PageVO;
import busker.scan.vo.SponserVO;

public interface SupPortService {

	//후원하기 등록
	public int insertSpon(SponserVO sponserVO) throws Exception;
	
	//후원하기 리스트 
	public List<SponserVO> sponList(PageVO pageVO, String search) throws Exception;
	
	
	//후원하기View
	public SponserVO selectSpon(int num) throws Exception;
	
	//후원하기 삭제
	public int deleteSpon(int sponNo) throws Exception;
	
	//후원하기 수정폼
	public SponserVO sponUpdateForm(SponserVO sponserVO) throws Exception;
	
	//후원하기 수정
	public int sponUpdate(SponserVO sponserVO)throws Exception;
	
//후원해주세요#########################################################
	
	//후원해주세요 등록
	public int insertBacked(BackedVO backedVO) throws Exception;
	
	//후원해주세요 리스트
	public List<BackedVO> backedList(PageVO pageVO,String search) throws Exception;
	
	//후원해주세요View
	public BackedVO selectBacked(int num) throws Exception;
	
	//후원해주세요 삭제
	public int deleteBacked(int backedNo) throws Exception;
	
	//후원해주세요 수정폼
	public BackedVO backedUpdateForm(BackedVO backedVO) throws Exception;
	
	//후원해주세요 수정
	public int backedUpdate(BackedVO backedVO) throws Exception;

}
