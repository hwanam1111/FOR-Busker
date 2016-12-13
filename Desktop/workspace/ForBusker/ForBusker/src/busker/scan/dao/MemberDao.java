package busker.scan.dao;

import busker.scan.vo.MemberVO;

public interface MemberDao {
	//로그인
	MemberVO idCheck( MemberVO vo );
	
	//회원가입
	public int insertMember(MemberVO vo);

	//중복체크
	MemberVO idchecked(MemberVO vo);

	int deleteMember(MemberVO memvo);

	MemberVO simpleIdSearch(MemberVO memvo);

	MemberVO buskerIdSearch(MemberVO memvo);

	MemberVO searchPw(MemberVO memvo);
	
	int updateSimple(String updateEmail, String updateSimplePassword,String updateTel);
	

	int updateBusker(MemberVO memberVO);
	int updateSimpleToBusker(MemberVO memberVO);
}
