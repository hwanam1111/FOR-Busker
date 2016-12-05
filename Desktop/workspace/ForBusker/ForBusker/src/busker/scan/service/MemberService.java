package busker.scan.service;

import busker.scan.vo.MemberVO;

public interface MemberService {
	//로그인
	public MemberVO selectMember(MemberVO memvo) throws Exception;

	//회원가입
	public int insertMember(MemberVO memvo) throws Exception;
}
