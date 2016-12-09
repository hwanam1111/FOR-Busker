package busker.scan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import busker.scan.dao.TogetherDaoImpl;
import busker.scan.vo.TogetherVO;

@Service
public class TogetherServiceImpl{
	
	@Autowired
	private TogetherDaoImpl dao;

	
	public List<TogetherVO> selectAllTogether() throws Exception {
		List<TogetherVO> toList=null;
		toList=dao.selectAllTogether();
		return toList;
	}


	public int insertTogether(TogetherVO tovo) throws Exception {
		int result=0;
		result=dao.insertTogether(tovo);
		return result;
	}

	public int deleteTogether(TogetherVO tovo) throws Exception {
		int result=0;
		result=dao.deleteTogether(tovo);
		return result;
	}
	public TogetherVO selectTogetherByNum(TogetherVO tovo)throws Exception{
		System.out.println("service tovo num: "+tovo.getToNo());
		TogetherVO vo=dao.selectTogetherByNum(tovo);
		return vo;
	}
	public int togetherMod(TogetherVO tovo) throws Exception{
		return dao.modifyTogether(tovo);
	}
	public List<TogetherVO> selectBySearchVal(String searchVal) throws Exception {
		List<TogetherVO> toList=null;
		System.out.println("service search");
		toList=dao.selectBySearchVal(searchVal);
		return toList;
	}
}
