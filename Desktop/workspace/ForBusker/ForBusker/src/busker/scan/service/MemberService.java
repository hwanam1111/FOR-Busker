package busker.scan.service;

import busker.scan.vo.MemberVO;

public interface MemberService {
	public MemberVO selectMember(MemberVO memvo) throws Exception;
}
