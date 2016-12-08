package busker.scan.service;

import java.util.HashMap;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import busker.scan.dao.VideoDao;
import busker.scan.vo.NoticeVO;
import busker.scan.vo.VideoVO;

@Service
public class VideoServiceImpl implements VideoService {

	@Autowired
	private VideoDao videoDao;
	
//	공지사항 리스트
	@Override
	public List<VideoVO> videoList() throws Exception {

		return videoDao.videoList();
	}
	
//	글쓰기
	@Override
	public int videoInsert(VideoVO vvo) throws Exception{
		
		return videoDao.videoInsert(vvo);
		
	}	
	
//	비디오 뷰
	@Override
	public VideoVO videoView(HashMap map) throws Exception{
		

		return videoDao.videoView(map);
	}
	
//	비디오 삭제
	@Override
	public	VideoVO videoDelete(HashMap map) throws Exception{
		
		return videoDao.videoDelete(map);
	}
	
//	비디오 수정
	@Override
	public int videoUpdate(VideoVO nvo) throws Exception{
		
		return videoDao.videoUpdate(nvo);
	}	
	
//	비디오 수정 폼
	@Override
	public VideoVO videoViewSelect(VideoVO vvo) throws Exception{
		
		return videoDao.videoViewSelect(vvo);
		
	}
}
