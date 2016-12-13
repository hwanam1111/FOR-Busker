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
	
	
	@Override
	public void InsertMessage(SmsVO sms) throws Exception {
		dao.Insert(sms);
	}

	@Override
	public List<SmsVO> selectMessage(String email) throws Exception {
		return dao.select(email);
	}
	@Override
	public void deleteMessage(SmsVO sms,String email) throws Exception {
		dao.delete(sms,email);
	}
	
	@Override
	public List<SmsVO> selectMessageByNoType(SmsVO sms,String email) throws Exception{
		return dao.selectMessageByNoType(sms,email);
	}
	
	@Override
	public void updateMessage(SmsVO sms) throws Exception{
		dao.updateMessage(sms);
	}

	@Override
	public String messageCheck(String email) throws Exception{
		return dao.messageCheck(email);
	}
}

