package busker.scan.service;

import java.util.List;

import busker.scan.vo.*;

public interface MessageService {

	//메시지 입력
	public void InsertMessage(SmsVO sms) throws Exception;

	//메시지 보기
	public List<SmsVO> selectMessage(String Email) throws Exception;

	//메시지 삭제
	public void deleteMessage(SmsVO sms) throws Exception;

	List<SmsVO> selectMessageByNoType(SmsVO sms) throws Exception;

	public void updateMessage(SmsVO sms) throws Exception;


	
	
}
