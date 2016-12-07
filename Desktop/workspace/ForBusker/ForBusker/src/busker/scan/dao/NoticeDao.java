package busker.scan.dao;

import java.util.HashMap;
import java.util.List;

import busker.scan.vo.NoticeVO;

public interface NoticeDao {

	// 게시글 입력
	public int noticeInsert(NoticeVO nvo);

	// 게시글 리스트
	public List<NoticeVO> noticeList();

	// 게시글 뷰
	public NoticeVO noticeView(HashMap map);

	// 게시글 삭제
	public NoticeVO noticeDelete(HashMap map);

	//	게시글 수정
	public int noticeUpdate(NoticeVO nvo);

	// 게시글 수정 셀렉트
	public NoticeVO noticeViewSelect(NoticeVO nvo);

}
