package busker.scan.dao;

import java.util.HashMap;
import java.util.List;

import busker.scan.vo.VideoVO;

public interface VideoDao {

	// 비디오 등록(글쓰기)
	public int videoInsert(VideoVO vvo);

	// 비디오 리스트
	public List<VideoVO> videoList();

	// 비디오 뷰
	public VideoVO videoView(HashMap map);

	// 비디오 삭제
	public VideoVO videoDelete(HashMap map);

	// 비디오 수정
	public int videoUpdate(VideoVO nvo);

	// 비디오 수정 폼
	public VideoVO videoViewSelect(VideoVO vvo);

}
