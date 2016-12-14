package busker.scan.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import busker.scan.vo.BackedVO;
import busker.scan.vo.PageVO;
import busker.scan.vo.SponserVO;

@Repository
public class SupPortDaoImpl implements SupPortDao {

	@Autowired
	private SqlSessionTemplate ss;

	
	//후원하기 입력
	@Override
	public int insertSpon(SponserVO sponserVO)  {
		
		int result=ss.insert("support.insertSpon",sponserVO);
		return result;
	}


	//후원하기 리스트
	@Override
	public List<SponserVO> sponList(int curPage, String search) {
		
		HashMap<String, Object>hash=new HashMap<>();
		hash.put("curPage", curPage);
		hash.put("search", search);
		List<SponserVO> sponList= ss.selectList("support.sponList",hash);
		return sponList;
	}

	//후원하기 View
	@Override
	public SponserVO selectSpon(int num) {
		SponserVO sVO = ss.selectOne("support.selectSpon",num);	
		return sVO;
	}
	
	//후원하기 삭제
	@Override
	public int deleteSpon(int sponNo) {
		int result = ss.delete("support.delteSpon",sponNo);
		return result;
	}

	//후원하기 수정폼
	@Override
	public SponserVO sponUpdateForm(SponserVO sponserVO) {
		SponserVO sVO = ss.selectOne("support.sponUpdateForm",sponserVO);
		return sVO;
	}
	
	//후원하기 수정
	@Override
	public int sponUpdate(SponserVO sponserVO) {
		int result = ss.update("support.sponUpdate",sponserVO);
		return result;
	}

	
//후원해주세요 #######################################################	
	
	//후원해주세요 입력
	@Override
	public int insertBacked(BackedVO backedVO) {
		
		int result = ss.insert("support.insertBacked",backedVO);
		return result;
	}

	//후원해주세요 등록form에서 url 띄우기
	@Override
	public String selectPrVideo(String memEmail) {
		String prUrl=ss.selectOne("support.selectPrVideo",memEmail);
		return prUrl;
	}	
	
	//후원해주세요 리스트
	@Override
	public List<BackedVO> backedList(int curPage, String search) {

		HashMap<String, Object>hash=new HashMap<>();
		hash.put("curPage", curPage);
		hash.put("search", search);
		
		List<BackedVO> backedList = ss.selectList("support.backedList",hash);
		return backedList;
	}

	
	//후원해주세요 View
	@Override
	public BackedVO selectBacked(int num) {

		BackedVO bVO = ss.selectOne("support.selectBacked",num);
		return bVO;
	}
	
	//후원해주세요 삭제
	@Override
	public int deleteBacked(int backedNo) {
		int result = ss.delete("support.deleteBacked",backedNo);
		return result;
	}
	
	//후원해주세요 수정폼
	@Override
	public BackedVO backedUpdateForm(BackedVO backedVO) {
		BackedVO bVO = ss.selectOne("support.backedUpdateForm",backedVO);
		return bVO;
	}
	
	//후원해주세요 수정
	@Override
	public int backedUpdate(BackedVO backedVO) {
		int result = ss.update("support.backedUpdate",backedVO);
		return result;
	}

//######################################################################	
	//sponser테이블 총 갯수 구하기 
	@Override
	public int sponListCount(String search) {
		HashMap<String, String> hash = new HashMap<>();
		hash.put("search", search);
		
		int sponCount = ss.selectOne("support.sponListCount",hash);
		return sponCount;
	}

	//backed테이블 총 갯수 구하기 
	@Override
	public int backedListCount(String search) {
		HashMap<String, String> hash = new HashMap<>();
		hash.put("search", search);
		int backedCount = ss.selectOne("support.backedListCount",hash);
		return backedCount;
	}



}
