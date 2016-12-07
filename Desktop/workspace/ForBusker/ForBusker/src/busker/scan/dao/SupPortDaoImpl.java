package busker.scan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<SponserVO> sponList() {
		List<SponserVO> sponList= ss.selectList("support.sponList");
		return sponList;
	}


	@Override
	public SponserVO selectSpon(int num) {
		SponserVO sVO = ss.selectOne("support.selectSpon",num);	
		return sVO;
	}

}
