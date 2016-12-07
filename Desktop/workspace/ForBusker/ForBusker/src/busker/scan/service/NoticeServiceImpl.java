package busker.scan.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import busker.scan.dao.NoticeDao;
import busker.scan.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
//	공지사항 리스트
	@Override
	public List<NoticeVO> noticeList() throws Exception {

		return noticeDao.noticeList();
	}
	
//	공지사항 뷰 수정 셀렉트
	@Override
	public NoticeVO noticeViewSelect(NoticeVO nvo) throws Exception{
		
		return noticeDao.noticeViewSelect(nvo);
		
	}
	
//	공지사항 뷰
	@Override
	public NoticeVO noticeView(HashMap map) throws Exception{
		

		return noticeDao.noticeView(map);
	}
	
	
//	공지사항 등록
	@Override
	public int noticeInsert(NoticeVO nvo) throws Exception {
		
		System.out.println("insertNotice쪽 vo값" + nvo.getNoticeTitle());
		
		return noticeDao.noticeInsert(nvo);
	}
	
//	공지사항 삭제
	@Override
	public NoticeVO noticeDelete(HashMap map) throws Exception{
		
		return noticeDao.noticeDelete(map);
	}
	
//	공지사항 수정
	@Override
	public int noticeUpdate(NoticeVO nvo) throws Exception{
		
		return noticeDao.noticeUpdate(nvo);
	}	
		
	 
}
