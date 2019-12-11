package kr.co.persistence;

import java.util.List;

import kr.co.domain.boardVO;
import kr.co.domain.spageTO;

public interface BoardDAO {

	List<boardVO> boardList(spageTO<boardVO> sto);

	int amountcall(spageTO<boardVO> sto);

	void boardInsert(boardVO vo);

	boardVO boardRead(int bnum);

	void update(boardVO vo);

	void delete(String bnum);

	void boardReadcnt(int bnum);

	void replyInsert(boardVO vo);

	List<boardVO> replyList(spageTO<boardVO> rto, int bnum);

	int replyamountcall(int bnum);
}
