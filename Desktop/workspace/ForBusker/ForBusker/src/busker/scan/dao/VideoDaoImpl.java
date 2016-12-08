package busker.scan.dao;

import java.util.HashMap;



import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int videoUpdate(VideoVO nvo){
		
		return ss.update("video.videoUpdate", nvo);
		
	}
	
}
