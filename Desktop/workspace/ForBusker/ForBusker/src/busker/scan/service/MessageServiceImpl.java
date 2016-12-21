package busker.scan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import busker.scan.dao.MessageDao;
import busker.scan.vo.SmsVO;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao dao;
	
	//메시지 입력
	@Override
	public void InsertMessage(SmsVO sms) throws Exception {
		dao.Insert(sms);
	}
	//메시지 보기
	@Override
	public List<SmsVO> selectMessage(String email) throws Exception {
		return dao.select(email);
	}
	//메시지 삭제
	@Override
	public void deleteMessage(SmsVO sms,String email) throws Exception {
		dao.delete(sms,email);
	}
	//보기를 눌렀을때 메시지를 받아오기
	@Override
	public List<SmsVO> selectMessageByNoType(SmsVO sms,String email) throws Exception{
		return dao.selectMessageByNoType(sms,email);
	}
	//읽음 표시
	@Override
	public void updateMessage(SmsVO sms,String email) throws Exception{
		dao.updateMessage(sms,email);
	}
	//메시지가 수신여부
	@Override
	public String messageCheck(String email) throws Exception{
		return dao.messageCheck(email);
	}
}

