package busker.scan.service;

import java.util.HashMap;
import java.util.List;

import busker.scan.vo.BackedVO;
import busker.scan.vo.BestVideoVO;
import busker.scan.vo.MemberVO;
import busker.scan.vo.PageVO;
import busker.scan.vo.VideoLikeVO;
import busker.scan.vo.VideoReplyVO;
import busker.scan.vo.VideoVO;

public interface VideoService {

	// 비디오 등록(글쓰기)
	public int videoInsert(VideoVO vvo) throws Exception;

	// 비디오 리스트
	public List<VideoVO> videoList(PageVO pageVO) throws Exception;

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
	
	// 좋아요 insert
	public int videoLikeInsert(VideoLikeVO vvo) throws Exception;
	
	// 좋아요 업데이트 +1
	public int videoLikeUpdate(VideoVO nvo) throws Exception;

	// 비디오 뷰 들어올 떄 좋아요 체크
	public List<VideoLikeVO> videoLikeList(VideoVO vvo) throws Exception;
	
	// 좋아요 delete
	public int videoLikeDelete(VideoLikeVO vlo) throws Exception;
	
	// 좋아요 업데이트 -1
	public int videoLikeMinusUpdate(VideoVO vvo) throws Exception;

	// 좋아요 페이지 보기
	public List<VideoVO> videoMypageLikeList(String memEmail,PageVO pageVO) throws Exception;

	// 좋아요 되있는 글도 삭제
	public VideoLikeVO videoLikeParentDelete(HashMap hashmap);

	// 베스트 영상 가져오기
	public List<BestVideoVO> videoBest() throws Exception;

	// 내가 쓴글 비디오 영상 카운트
	int myPageVideoPageCount(String memEmail) throws Exception;

	// 내가 쓴글 비디오 영상 리스트 가져오기
	List<VideoVO> myPageVideoList(PageVO pageVO, String memEmail) throws Exception;

	public int insertReply(VideoReplyVO vo);

	public List<VideoReplyVO> selectReply(VideoReplyVO vo);
	
	
}
