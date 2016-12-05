package busker.scan.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import busker.scan.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate ss;
	
//	로그인
	@Override
	public MemberVO idCheck(MemberVO vo) {
		
		System.out.println("idCheck쪽 vo값" + vo.getMemEmail());
		
		MemberVO ok = null;
		ok = ss.selectOne("main.idCheck", vo);
		
		return ok;
	}

	
//	회원가입
	@Override
	public int insertMember(MemberVO vo) {
		
		System.out.println("insertMember쪽 vo값" + vo.getMemEmail());
		
		MemberVO ok = null;
		ok = ss.selectOne("main.insertMember", vo);
		
		return 1;
	}


}
