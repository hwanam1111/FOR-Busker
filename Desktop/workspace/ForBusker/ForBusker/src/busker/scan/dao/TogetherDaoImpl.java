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
	public List<TogetherVO> selectAllTogether(){
		List<TogetherVO> list=null;
		list=ss.selectList("together.selectAllTogether");
		return list;
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
	public List<TogetherVO> selectBySearchVal(String searchVal){
		HashMap<String, String>hash=new HashMap<>();
		hash.put("searchVal", searchVal);
		System.out.println("dao search"+searchVal);
		return ss.selectList("together.selectBySearchVal", hash);
	}
}
