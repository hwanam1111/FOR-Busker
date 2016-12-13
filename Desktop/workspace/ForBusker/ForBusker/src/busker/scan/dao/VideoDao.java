package busker.scan.dao;

import java.util.HashMap;
import java.util.List;

import busker.scan.vo.MemberVO;
import busker.scan.vo.VideoLikeVO;
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

	//	조회수
	public void videoCount(VideoVO vvo);
	
	// 비디오 new 리스트
	public List<VideoVO> videoNewList();
	
	// 좋아요 추가
	public int videoLikeInsert(VideoLikeVO vlo);
	
	// 좋아요 수 업데이트 +1
	public int videoLikeUpdate(VideoVO vvo);

	// 좋아요 뷰 들어올 때 확인
	public List<VideoLikeVO> videoLikeList(VideoVO vvo);

	// 좋아요 삭제
	public int videoLikeDelete(VideoLikeVO vlo);

	// 좋아요 업데이트 -1
	public int videoLikeMinusUpdate(VideoVO vvo);

	// 좋아요한 페이지 리스트
	public List<VideoLikeVO> videoMypageLikeList(String memEmail);

	// 좋아요 한 글도 삭제
	public VideoLikeVO videoLikeParentDelete(HashMap hashmap);

	
}
