package busker.scan.dao;

import java.util.HashMap;
import java.util.List;

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

	@Override
	public List<ShowVO> selectShow(List list) throws Exception {
		System.out.println("showdao쪽 selectShow진입");
	//	System.out.println("list는"+list.get(1));
		HashMap map=new HashMap();
		if(list.size()==2){
			System.out.println("이프문안"+list.size());
			map.put("first", list.get(0));
			map.put("second",list.get(1));
		}else{
			System.out.println("엘스문안"+list.size());
			map.put("first", list.get(0));
		}
		return ss.selectList("show.selectShow",map);
	}

	@Override
	public List selectShow(String loc) throws Exception {
		System.out.println("showdao쪽 selectShow진입(string버전)");
		HashMap map = new HashMap();
		map.put("first", loc);
		return ss.selectList("show.selectShow2",loc);
	}

	@Override
	public List selectShow(int shno) throws Exception {
		System.out.println("showdao쪽 selectShow진입(int버전)");
		HashMap map = new HashMap();
		map.put("first", shno);
		return ss.selectList("show.selectShow3",shno);
	}

}
