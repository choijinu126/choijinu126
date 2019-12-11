package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.boardVO;
import kr.co.domain.spageTO;
import kr.co.persistence.BoardDAO;

@Service
@Transactional
public class boardServiceImpl implements boardService{
	@Inject
	private BoardDAO bdao;
	
	@Override
	public List<boardVO> boardList(spageTO<boardVO> sto) {
		int amount = bdao.amountcall(sto);
		sto.setAmount(amount);
		return bdao.boardList(sto);
	}

	@Override
	public void insert(boardVO vo) {
		bdao.boardInsert(vo);
	}

	@Override
	public boardVO read(int bnum) {
		bdao.boardReadcnt(bnum);
		return bdao.boardRead(bnum);
	}

	@Override
	public boardVO updateUI(int bnum) {
		return bdao.boardRead(bnum);
	}

	@Override
	public void updateUI(boardVO vo) {
		bdao.update(vo);
	}

	@Override
	public void delete(String bnum) {
		bdao.delete(bnum);
	}

	@Override
	public void replyInsert(boardVO vo) {
		bdao.replyInsert(vo);
	}

	@Override
	public List<boardVO> boardreplyList(spageTO<boardVO> rto, int bnum) {
		rto.setAmount(bdao.replyamountcall(bnum));
		return bdao.replyList(rto, bnum);
	}
	
}
