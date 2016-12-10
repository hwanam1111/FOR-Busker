package busker.scan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import busker.scan.dao.ShowDao;
import busker.scan.vo.ShowVO;

@Service
public class ShowServiceImpl implements ShowService {
	
	@Autowired
	private ShowDao dao; 
	
	@Override
	public int insertShow(ShowVO shvo) throws Exception{
		System.out.println("showService쪽 vo값" + shvo.getMemEmail());
		
		int result;
		result = dao.insertShow(shvo);
		return result;
	}

	@Override
	public List<ShowVO> selectList(List sendList) throws Exception {
		System.out.println("showService_selectList내부진입");
		return dao.selectShow(sendList);
	}

	@Override
	public List selectList(String loc) throws Exception {
		System.out.println("showService_selectList내부진입(string버전)");
		return dao.selectShow(loc);
	}

	@Override
	public List selectList(int shno) throws Exception {
		System.out.println("showService_selectList내부진입(int버전)");
		return dao.selectShow(shno);
	}
	
	public List selectList(String date, String select, String val) throws Exception {
		System.out.println("showService_selectList내부진입(검색버전)  데이트는 :"+date+"/셀렉트는"+select+"발은"+val);
		return dao.selectShow(date,select,val); 
	}
 
	


}
