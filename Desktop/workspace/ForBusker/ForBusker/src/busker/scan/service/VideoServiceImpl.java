package busker.scan.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import busker.scan.dao.VideoDao;
import busker.scan.vo.MemberVO;
import busker.scan.vo.VideoLikeVO;
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

//	조회수
	@Override
	public void videoCount(VideoVO vvo) throws Exception {
		
		videoDao.videoCount(vvo);
		
	}

//	실시간 리스트
	@Override
	public List<VideoVO> videoNewList() throws Exception {
		
		return videoDao.videoNewList();
	}

//	좋아요
	@Override
	public int videoLikeInsert(VideoLikeVO vlo) throws Exception {
		
		return videoDao.videoLikeInsert(vlo);
	}
 
//  좋아요 업데이트 +1
	@Override
	public int videoLikeUpdate(VideoVO vvo) throws Exception {
		return videoDao.videoLikeUpdate(vvo);
	}

//	비디오 뷰 들어올 때 좋아요했는지 확인
	@Override
	public List<VideoLikeVO> videoLikeList(VideoVO vvo) throws Exception {
		return videoDao.videoLikeList(vvo);
	}

//	좋아요 삭제
	@Override
	public int videoLikeDelete(VideoLikeVO vlo) throws Exception {
		return videoDao.videoLikeDelete(vlo);
	}

//	좋아요 업데이트 -1
	@Override
	public int videoLikeMinusUpdate(VideoVO vvo) throws Exception {
		return videoDao.videoLikeMinusUpdate(vvo);
	}

	@Override
	public List<VideoLikeVO> videoMypageLikeList(String memEmail) throws Exception {
	
		System.out.println("videoService:"+memEmail);
		return videoDao.videoMypageLikeList(memEmail);

} 

//	좋아요한 페이지 리스트



}
