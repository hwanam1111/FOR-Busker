package busker.scan.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import busker.scan.dao.MemberDao;
import busker.scan.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao; 
	 
//	로그인
	@Override
	public MemberVO selectMember(MemberVO memvo) throws Exception {
		
		System.out.println("selectMember쪽 vo값" + memvo.getMemEmail());
		
		MemberVO result = memberDao.idCheck(memvo);

		return result;
	}
	
//	중복체크
	@Override
	public MemberVO selectEmail(MemberVO memvo) throws Exception {
		
		System.out.println("selectEmail쪽 vo값" + memvo.getMemEmail());
		
		MemberVO result = memberDao.idchecked(memvo);

		return result;
	}
	
// 회원가입
	
	@Override
	public int insertMember(MemberVO memvo) throws Exception {
		
		System.out.println("selectMember쪽 vo값" + memvo.getMemEmail());
		
		 return memberDao.insertMember(memvo);
	}
//탈퇴
	public int deleteMember(MemberVO memvo) throws Exception {
		 return memberDao.deleteMember(memvo);
	}
	//일반 사용자용 이메일 찾기
	public MemberVO simpleIdSearch(MemberVO memvo) {
		
		MemberVO result = memberDao.simpleIdSearch(memvo);
		return result;
	}
	//공연자용 이메일 찾기
	public MemberVO buskerIdSearch(MemberVO memvo) {
		System.out.println("sevice tel and name: "+memvo.getMemPhone()+"/"+memvo.getMemTeamName());
		MemberVO result = memberDao.buskerIdSearch(memvo);
		return result;
	} 
	//비번 찾기
	public MemberVO searchPw(MemberVO memvo){
		MemberVO result=memberDao.searchPw(memvo);
		return result;
	}
	
}
