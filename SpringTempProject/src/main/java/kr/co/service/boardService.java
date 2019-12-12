package kr.co.service;

import java.util.List;

import kr.co.domain.boardVO;
import kr.co.domain.spageTO;

public interface boardService {

	List<boardVO> boardList(spageTO<boardVO> sto);

	void insert(boardVO vo);

	boardVO read(int bnum);

	boardVO updateUI(int bnum);

	void updateUI(boardVO vo);

	void delete(String bnum);

	void replyInsert(boardVO vo);

	List<boardVO> boardreplyList(spageTO<boardVO> rto, int bnum);

	boardVO replyRead(boardVO vo);

	void replyUpdate(boardVO vo);

	void replyDelete(boardVO vo);

}
