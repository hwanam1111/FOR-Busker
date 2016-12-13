package busker.scan.service;


import busker.scan.vo.MemberVO;

public interface MemberService {
	//로그인
	public MemberVO selectMember(MemberVO memvo) throws Exception;

	//회원가입
	public int insertMember(MemberVO memvo) throws Exception;

	//중복체크
	public MemberVO selectEmail(MemberVO memvo) throws Exception;

	public MemberVO simpleIdSearch(MemberVO vo);

	public MemberVO buskerIdSearch(MemberVO vo);

	public MemberVO searchPw(MemberVO vo);
	
	public int updateSimple(String updateEmail, String updateSimplePassword,String updateTel);

	public int updateBusker(MemberVO memberVO);
	
	public int updateSimpleToBusker(MemberVO memberVO);




}
