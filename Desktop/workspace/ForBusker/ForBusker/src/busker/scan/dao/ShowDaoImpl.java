package busker.scan.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import busker.scan.vo.ShowVO;

@Repository
public class ShowDaoImpl implements ShowDao {
	
	@Autowired
	private SqlSessionTemplate ss;

	public int insertShow(ShowVO shvo) throws Exception{
		System.out.println("showdao쪽 shvo="+shvo.getMemEmail());
		ss.insert("show.insertShow", shvo);
		
		return 0;
	}

}
