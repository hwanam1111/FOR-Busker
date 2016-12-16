package busker.scan.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import busker.scan.vo.MemberVO;
import busker.scan.vo.TogetherVO;

@Repository
public class TogetherDaoImpl {
	@Autowired
	private SqlSessionTemplate ss;
	
	public int insertTogether(TogetherVO tovo) {
		int result=0;
		result=ss.insert("together.insertTogether",tovo);
		return result;
	}
	public List<TogetherVO> selectAllTogether(int curPage,String memEmail){
		HashMap hash=new HashMap<>();
		hash.put("curPage",curPage);
		hash.put("memEmail",memEmail);
		System.out.println("hash맵"+hash);
		List<TogetherVO> list=null;
		list=ss.selectList("together.selectAllTogether",hash);
		return list;
	}
	
	//전체 로우 갯수 가져오기 (count)
	public int togeListCount(){
		
		int result=ss.selectOne("together.togeListCount");
		return result;
		
	}
	public TogetherVO selectTogetherByNum(TogetherVO tovo){
		TogetherVO vo=ss.selectOne("together.selectTogetherByNum",tovo);
		return vo;
	}
	public int deleteTogether(TogetherVO tovo){
		return ss.delete("together.deleteTogether",tovo);
	}
	public int modifyTogether(TogetherVO tovo){
		return ss.update("together.modifyTogether",tovo);
	}
	public List<TogetherVO> selectBySearchVal(String searchVal,int curPage){
		HashMap<String, Object>hash=new HashMap<>();
		hash.put("searchVal", searchVal);
		hash.put("curPage", curPage);
		System.out.println("dao search"+searchVal+":"+curPage);
		return ss.selectList("together.selectBySearchVal", hash);
	}
	
	public int toSearchCount(String searchVal){
		HashMap<String, String>hash=new HashMap<>();
		hash.put("searchVal", searchVal);
		int result = ss.selectOne("together.searchCount",hash);
		return result ;
	}
}
