package kr.co.persistence;

import java.util.List;

import kr.co.domain.boardVO;
import kr.co.domain.spageTO;

public interface BoardDAO {

	List<boardVO> boardList(spageTO sto);

	int amountcall(spageTO sto);

	void boardInsert(boardVO vo);

	boardVO boardRead(int bnum);

	void update(boardVO vo);

	void delete(String bnum);

	void boardReadcnt(int bnum);
}