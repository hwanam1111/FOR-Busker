package busker.scan.dao;


import java.util.List;

import javax.servlet.http.HttpSession;

import busker.scan.vo.SmsVO;

public interface MessageDao {

	public void Insert(SmsVO sms) throws Exception ;

	public List<SmsVO>  select(String email) throws Exception ;
	
	public void delete(SmsVO sms,String email) throws Exception ;

	List<SmsVO> selectMessageByNoType(SmsVO sms,String email) throws Exception;

	void updateMessage(SmsVO sms,String email) throws Exception;

	public String messageCheck(String email) throws Exception;


	
	
}
