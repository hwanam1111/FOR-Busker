package busker.scan.dao;

import java.util.List;

import busker.scan.vo.BackedVO;
import busker.scan.vo.PageVO;
import busker.scan.vo.SponserVO;

public interface SupPortDao {

	public int insertSpon(SponserVO sponserVO);
	
	public List<SponserVO> sponList(int curPage, String search);
	
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
	
	//후원해주세요 등록form에서 url 띄우기
	public String selectPrVideo(String memEmail);
	
	//후원해주세요 리스트
	public List<BackedVO> backedList(int curPage,String search);
	
	//후원해주세요 View 뽑기
	public BackedVO selectBacked(int num);
	
	//후원해주세요 삭제
	public int deleteBacked(int backedNo);
	
	//sponser 테이블 카운트
	public int sponListCount(String search);
	
	//backed 테이블 카운트
	public int backedListCount(String search);
	
	//후원해주세요 수정폼
	public BackedVO backedUpdateForm(BackedVO backedVO);
	
	//후원해주세요 수정
	public int backedUpdate(BackedVO backedVO);

	public int myPageBackedListCount(String search);

	public int myPageSponListCount(String search);

	public List<BackedVO> myPagebackedList(int curPage, String memEmail);
	
	public List<SponserVO> myPageSponList(int curPage, String memEmail);
}
