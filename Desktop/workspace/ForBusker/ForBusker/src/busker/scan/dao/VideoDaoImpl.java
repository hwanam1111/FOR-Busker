package busker.scan.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import busker.scan.vo.MemberVO;
import busker.scan.vo.VideoLikeVO;
import busker.scan.vo.VideoVO;

@Repository
public class VideoDaoImpl implements VideoDao {

	@Autowired
	private SqlSessionTemplate ss;
	
//	비디오 리스트
	@Override
	public List<VideoVO> videoList() {
		return ss.selectList("video.videoList");
	}
	
//	비디오 글쓰기
	@Override
	public int videoInsert(VideoVO vvo){
		System.out.println("videoInsert쪽 VO값 : " + vvo.getVideoName());
		
		VideoVO  videoVo = null;
		videoVo = ss.selectOne("video.videoInsert", vvo);
		
		return 1;
	}
	
//	비디오 뷰
	@Override
	public VideoVO videoView(HashMap map){
		return ss.selectOne("video.videoView", map);
		
	}
	
//	비디오 삭제
	@Override
	public VideoVO videoDelete(HashMap map){
		
		return ss.selectOne("video.videoDelete", map);
		
	}
	
//	비디오 수정 폼
	@Override
	public VideoVO videoViewSelect(VideoVO vvo) {
		return ss.selectOne("video.videoViewSelect", vvo);
	}

	
//	비디오 수정
	@Override
	public int videoUpdate(VideoVO vvo){
		
		return ss.update("video.videoUpdate", vvo);
		
	}
	
	//	조회수
	@Override
	public void videoCount(VideoVO vvo) {
		
		ss.update("video.videoCount", vvo);
		
	}

	//	new 영상
	@Override
	public List<VideoVO> videoNewList() {
		return ss.selectList("video.videoNewList");
		
	}

	//	좋아요
	@Override
	public int videoLikeInsert(VideoLikeVO vlo) {
		System.out.println("videoLikeInsert쪽 VO값 : " + vlo.getMemLoginEmail());
		
		
		VideoLikeVO  videoLikeVo = null;
		videoLikeVo = ss.selectOne("video.videoLikeInsert", vlo);
		
		return 1;
	}

	// 좋아요 수 업데이트 +1
	@Override
	public int videoLikeUpdate(VideoVO nvo) {

		return ss.update("video.videoLikeUpdate", nvo);
	}

	//	좋아요 뷰 들어올 때 확인
	@Override
	public List<VideoLikeVO> videoLikeList(VideoVO vvo) {
		System.out.println("dao : " + vvo.getVideoNo());
		
		return ss.selectList("video.videoLikeList",vvo);
	}

	// 좋아요 삭제
	@Override
	public int videoLikeDelete(VideoLikeVO vlo) {
		return ss.delete("video.videoLikeDelete",vlo);
	}

	// 좋아요 수 업데이트 -1
	@Override
	public int videoLikeMinusUpdate(VideoVO vvo) {
		return ss.update("video.videoLikeUpdateMinus",vvo);
	}

	// 좋아요 한 페이지 리스트
	@Override
	public List<VideoLikeVO> videoMypageLikeList(String memEmail) {
		System.out.println("videoDao:"+memEmail);
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("memEmail", memEmail);
		return ss.selectList("video.videoMypageLikeList",map);
	}




}
