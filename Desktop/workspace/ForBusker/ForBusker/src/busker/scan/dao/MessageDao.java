package busker.scan.dao;


import java.util.List;

import javax.servlet.http.HttpSession;

import busker.scan.vo.SmsVO;

public interface MessageDao {

	//메시지 입력
	public void Insert(SmsVO sms) throws Exception ;
	//메시지 보기
	public List<SmsVO>  select(String email) throws Exception ;
	//메시지 삭제
	public void delete(SmsVO sms,String email) throws Exception ;
	//보기를 눌렀을때 메시지를 받아오기
	List<SmsVO> selectMessageByNoType(SmsVO sms,String email) throws Exception;
	//읽음 표시
	void updateMessage(SmsVO sms,String email) throws Exception;
	//메시지가 수신여부
	public String messageCheck(String email) throws Exception;


	
	
}
