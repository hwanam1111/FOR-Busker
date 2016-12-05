package busker.scan.dao;

import busker.scan.vo.MemberVO;

public interface MemberDao {
	//로그인
	MemberVO idCheck( MemberVO vo );
	
	//회원가입
	public int insertMember(MemberVO vo);
}
