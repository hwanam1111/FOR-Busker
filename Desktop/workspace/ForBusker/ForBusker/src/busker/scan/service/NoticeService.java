package busker.scan.service;

import java.util.HashMap;
import java.util.List;

import busker.scan.vo.NoticeVO;
import busker.scan.vo.PageVO;

public interface NoticeService {

	// 게시글 입력
	public int noticeInsert(NoticeVO nvo) throws Exception;

	// 게시글 리스트
	public List<NoticeVO> noticeList(PageVO pageVO) throws Exception;

	//	게시글 뷰
	public NoticeVO noticeView(HashMap map) throws Exception;

	// 게시글 삭제
	public NoticeVO noticeDelete(HashMap map) throws Exception;

	// 게시글 수정
	public int noticeUpdate(NoticeVO nvo) throws Exception;

	// 게시글 수정 폼 셀렉트
	public NoticeVO noticeViewSelect(NoticeVO nvo) throws Exception;

}
