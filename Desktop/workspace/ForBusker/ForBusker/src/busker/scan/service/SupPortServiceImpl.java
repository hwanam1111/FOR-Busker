package busker.scan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import busker.scan.dao.SupPortDao;
import busker.scan.vo.SponserVO;

@Service
public class SupPortServiceImpl implements SupPortService {

	@Autowired
	private SupPortDao supportDao;
	
	@Override
	public int insertSpon(SponserVO sponserVO) throws Exception {
		System.out.println("servie부분");
		int result = supportDao.insertSpon(sponserVO);
		return result;
	}

	@Override
	public List<SponserVO> sponList() throws Exception {
		
		List<SponserVO> sponList = supportDao.sponList();
		return sponList;
	}

	@Override
	public SponserVO selectSpon(int num) throws Exception {
		
		SponserVO sVO = supportDao.selectSpon(num);
		return sVO;
	}
	
	

	
	
}
