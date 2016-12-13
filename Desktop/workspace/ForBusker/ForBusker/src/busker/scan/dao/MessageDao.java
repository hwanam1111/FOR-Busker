package busker.scan.dao;


import java.util.List;

import javax.servlet.http.HttpSession;

import busker.scan.vo.SmsVO;

public interface MessageDao {

	public void Insert(SmsVO sms) throws Exception ;

	public List<SmsVO>  select(String Email) throws Exception ;
	
	public void delete(SmsVO sms,String Email) throws Exception ;

	List<SmsVO> selectMessageByNoType(SmsVO sms,String Email) throws Exception;

	void updateMessage(SmsVO sms) throws Exception;

	public String messageCheck(String email) throws Exception;


	
	
}
