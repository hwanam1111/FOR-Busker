package busker.scan.dao;

import java.util.HashMap;

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
	
//	중복체크
	@Override
	public MemberVO idchecked(MemberVO vo) {
		
		System.out.println("idchecked쪽 vo값" + vo.getMemEmail());
		
		return ss.selectOne("main.idchecked", vo);
	}

	
//	회원가입
	@Override
	public int insertMember(MemberVO vo) {
		
		System.out.println("insertMember쪽 vo값" + vo.getMemEmail());
		
		MemberVO ok = null;
		ok = ss.selectOne("main.insertMember", vo);
		
		return 1;
	}
	public int deleteMember(MemberVO vo) {
		return ss.update("main.deleteMember",vo);
	}
	//일반인 아이디 찾기
	public MemberVO simpleIdSearch(MemberVO memvo){
	
			MemberVO result = ss.selectOne("main.simpleIdSearch",memvo);
			return result;
		}
	//공연자 아이디 찾기
		public MemberVO buskerIdSearch(MemberVO memvo){
			System.out.println("dao tel and name: "+memvo.getMemPhone()+"/"+memvo.getMemTeamName());
				MemberVO result = ss.selectOne("main.buskerIdSearch",memvo);
				return result;
			}
		//비번 찾기
		public MemberVO searchPw(MemberVO memvo){
			MemberVO result=ss.selectOne("main.searchPw", memvo);
			return result;
		}	
		
		public int updateSimple(String updateEmail, String updateSimplePassword,String updateTel){
			System.out.println("memberDao pw:"+updateSimplePassword+"memberdao email"+updateEmail+"memberdao tel:"+updateTel);
			HashMap<String,Object> map =new HashMap<String,Object>();
			map.put("Email", updateEmail);
			map.put("pw", updateSimplePassword);
			map.put("tel", updateTel);
			int result = ss.update("main.updateSimple",map);
			return result;
		}
		
		public int updateBusker(MemberVO memberVO){
			int result = ss.update("main.updateBusker",memberVO);
			return result;
		}
		
		public int updateSimpleToBusker(MemberVO memberVO){
			
			System.out.println(" / dao쪽 : "+memberVO.getMemEmail());
			System.out.println(" / dao쪽 : "+memberVO.getMemDetail());
			int result = ss.update("main.updateSimpleToBusker",memberVO);
			
			return result;
		}



}
