package kr.co.service;

import java.util.List;

import kr.co.domain.boardVO;
import kr.co.domain.spageTO;

public interface boardService {

	List<boardVO> boardList(spageTO sto);

	void insert(boardVO vo);

	boardVO read(int bnum);

	boardVO updateUI(int bnum);

	void updateUI(boardVO vo);

	void delete(String bnum);

}
