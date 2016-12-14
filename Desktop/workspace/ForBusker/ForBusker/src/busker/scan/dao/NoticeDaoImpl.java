package busker.scan.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import busker.scan.vo.NoticeVO;


@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSessionTemplate ss;



	//	공지사항 리스트
	@Override
	public List<NoticeVO> noticeList(int curPage) {
		return ss.selectList("notice.noticeList",curPage);
	}

	//공지사항 테이블에서 전체 row갯수 가져오기
	@Override
	public int noticePageCount() {

		return ss.selectOne("notice.noticeCount");
	}		

	//	공지사항 뷰
	@Override
	public NoticeVO noticeView(HashMap map){
		return ss.selectOne("notice.noticeView", map);

	}

	//	공지사항 글쓰기
	@Override
	public int noticeInsert(NoticeVO nvo) {

		System.out.println("noticeInsert쪽 vo값" + nvo.getNoticeTitle());

		NoticeVO noticeVo = null;
		noticeVo = ss.selectOne("notice.noticeInsert", nvo);

		return 1;

	}

	//	공지사항 삭제
	@Override
	public NoticeVO noticeDelete(HashMap map){

		return ss.selectOne("notice.noticeDelete", map);

	}

	//	공지사항 수정
	@Override
	public int noticeUpdate(NoticeVO nvo){

		return ss.update("notice.noticeUpdate", nvo);

	}

	@Override
	public NoticeVO noticeViewSelect(NoticeVO nvo) {
		return ss.selectOne("notice.noticeViewSelect", nvo);
	}

}