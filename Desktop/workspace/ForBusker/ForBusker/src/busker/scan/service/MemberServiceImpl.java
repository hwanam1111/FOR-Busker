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


	
}
