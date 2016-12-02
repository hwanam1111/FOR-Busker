package busker.scan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import busker.scan.dao.MemberDao;
import busker.scan.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao; 
	
	
	@Override
	public MemberVO selectMember(MemberVO memvo) throws Exception {
		
		System.out.println("selectMember쪽 vo값" + memvo.getMemEmail());
		
		MemberVO result = memberDao.idCheck(memvo);

		return result;
	}
	
}
