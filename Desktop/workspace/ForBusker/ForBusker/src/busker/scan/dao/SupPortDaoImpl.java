package busker.scan.dao;

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

	
	@Override
	public int insertSpon(SponserVO sponserVO)  {
		
		int result=ss.insert("support.insertSpon",sponserVO);
		return result;
	}


	@Override
	public List<SponserVO> sponList(PageVO pageVO) {
		List<SponserVO> sponList= ss.selectList("support.sponList",pageVO);
		return sponList;
	}


	@Override
	public SponserVO selectSpon(int num) {
		SponserVO sVO = ss.selectOne("support.selectSpon",num);	
		return sVO;
	}


	@Override
	public int insertBacked(BackedVO backedVO) {
		
		int result = ss.insert("support.insertBacked",backedVO);
		return result;
	}


	@Override
	public List<BackedVO> backedList() {

		List<BackedVO> backedList = ss.selectList("support.backedList");
		return backedList;
	}


	@Override
	public BackedVO selectBacked(int num) {

		BackedVO bVO = ss.selectOne("support.selectBacked",num);
		return bVO;
	}


	//sponser테이블 총 갯수 구하기 
	@Override
	public int sponListCount() {
		int sponCount = ss.selectOne("support.sponListCount");
		return sponCount;
	}


	@Override
	public int backedListCount() {
		int backedCount = ss.selectOne("support.backedListCount");
		return backedCount;
	}

}
