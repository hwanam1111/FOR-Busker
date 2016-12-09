package busker.scan.service;

import java.util.HashMap;
import java.util.List;

import busker.scan.vo.VideoVO;

public interface VideoService {

	// 비디오 등록(글쓰기)
	public int videoInsert(VideoVO vvo) throws Exception;

	// 비디오 리스트
	public List<VideoVO> videoList() throws Exception;

	// 비디오 뷰
	public VideoVO videoView(HashMap map) throws Exception;

	// 비디오 삭제
	public VideoVO videoDelete(HashMap map) throws Exception;

	// 비디오 수정
	public int videoUpdate(VideoVO nvo) throws Exception;

	// 비디오 수정 폼
	public VideoVO videoViewSelect(VideoVO vvo) throws Exception;

	//	조회수
	public void videoCount(VideoVO vvo) throws Exception;
	
	// 비디오 new 리스트
	public List<VideoVO> videoNewList() throws Exception;
	
}
