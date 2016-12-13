package busker.scan.service;

import java.util.List;

import busker.scan.vo.*;

public interface MessageService {

	//메시지 입력
	public void InsertMessage(SmsVO sms) throws Exception;

	//메시지 보기
	public List<SmsVO> selectMessage(String email) throws Exception;

	//메시지 삭제
	public void deleteMessage(SmsVO sms,String email) throws Exception;

	List<SmsVO> selectMessageByNoType(SmsVO sms,String email) throws Exception;

	public void updateMessage(SmsVO sms,String email) throws Exception;

	public String messageCheck(String email) throws Exception;


	
	
}
