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
	public List<SmsVO> selectMessage(String Email) throws Exception {
		return dao.select(Email);
	}
	@Override
	public void deleteMessage(SmsVO sms) throws Exception {
		dao.delete(sms);
	}
	
	@Override
	public List<SmsVO> selectMessageByNoType(SmsVO sms) throws Exception{
		return dao.selectMessageByNoType(sms);
	}
	
	@Override
	public void updateMessage(SmsVO sms) throws Exception{
		dao.updateMessage(sms);
	}

}

