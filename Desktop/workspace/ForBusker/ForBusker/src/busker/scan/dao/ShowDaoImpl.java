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
	public List selectShow(String loc,int curPage){
		System.out.println("showdao쪽 selectShow진입(string버전)");
		HashMap map = new HashMap();
		map.put("first", loc);
		map.put("curPage",curPage);
		return ss.selectList("show.selectShow2",map);
	}
	
	//loc들어왔을 때 row 갯수 가져오기
	@Override
	public int showLocCount(String loc){
		int showLocCount =ss.selectOne("show.showLocCount", loc);
		System.out.println(loc+"들어왔을때 갯수 "+showLocCount);
		return showLocCount;
	}

	@Override
	public List selectShow(int shno) throws Exception {
		System.out.println("showdao쪽 selectShow진입(int버전)");
		HashMap map = new HashMap();
		map.put("first", shno);
		return ss.selectList("show.selectShow3",shno);
	}
	
	
	
	public List selectShow(String date, String select, String val,int curPage) throws Exception {
		System.out.println("showDao쪽 selectShow진입(검색버전) 데이트는 :"+date+"/셀렉트는"+select+"발은"+val);
		HashMap map = new HashMap();
	
		map.put("date", date);
		map.put("select", select);
		map.put("curPage", curPage);
		if(val!=null){
			if(val.equals("기타"))
			{
			map.put("val", 0);	
			}else{
			map.put("val", val);
			}
		}
		
		List selectShow = ss.selectList("show.selectShowSearch",map);
		System.out.println("DAO에서 리스트 갯수 : "+selectShow.size());
		System.out.println("DAO에서 현재 페이지 번호 : "+curPage);
		return selectShow;
	}
	
	//검색어가 들어왔을 때 row 갯수 가져오기
	@Override
	public int showSearchCount(String date, String select, String val){
		HashMap map = new HashMap();
		
		map.put("date", date);
		map.put("select", select);
		if(val!=null){
			if(val.equals("기타"))
			{
			map.put("val", 0);	
			}else{
			map.put("val", val);
			}
		}
		int showSearchCount =  ss.selectOne("show.showSearchCount",map);
		System.out.println("검색했을때 총 row 갯수 = "+showSearchCount);
		return showSearchCount;
	}
//slide 나올때 상세정보 적어주기
	public ShowVO selectShowByNum(int shNo){
		HashMap<String,Integer> hash=new HashMap<>();
		hash.put("shNo",shNo);
		return ss.selectOne("show.selectShowByNum",hash);
	}
	
	//내 이메일로 적은 쇼 갯수 가져오기
	@Override
	public int myShowCount(String email){
		    System.out.println("내가 쓴 쇼글 갯수 : "+ss.selectOne("show.myShowCount", email));
			return ss.selectOne("show.myShowCount", email);
		}
	
	@Override
	public List<ShowVO> selectShowByEmail(String email,int curPage){
		HashMap hash=new HashMap();
		hash.put("email",email);
		hash.put("curPage", curPage);
		System.out.println("email 과 curpage :"+email+" / "+curPage);
		return ss.selectList("show.selectShowByEmail", hash);
	}
	
	//수정하기
	public int updateShow(ShowVO showVO){
		int result = ss.update("show.updateShow",showVO);
		return result;
	}
	
	//삭제하기
	public int deleteShow(int shNo){
		int result = ss.delete("show.deleteShow",shNo);
		return result;
	}


}
