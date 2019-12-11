package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.boardVO;
import kr.co.domain.spageTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Inject
	private SqlSession bsession;
	private final String NS = "kr.co.mapper.board";
	
	@Override
	public List<boardVO> boardList(spageTO<boardVO> sto) {
		return bsession.selectList(NS+".boardList", sto);
	}

	@Override
	public int amountcall(spageTO<boardVO> sto) {
		return bsession.selectOne(NS+".amountcall", sto);
	}

	@Override
	public void boardInsert(boardVO vo) {
		bsession.insert(NS+".boardInsert", vo);
	}

	@Override
	public boardVO boardRead(int bnum) {
		return bsession.selectOne(NS+".boardRead", bnum);
	}

	@Override
	public void update(boardVO vo) {
		bsession.update(NS+".boardUpdate", vo);
	}

	@Override
	public void delete(String bnum) {
		bsession.delete(NS+".boardDelete", bnum);
	}

	@Override
	public void boardReadcnt(int bnum) {
		bsession.update(NS+".boardReadcnt", bnum);
	}

	@Override
	public void replyInsert(boardVO vo) {
		bsession.insert(NS+".boardreplyInsert", vo);
	}

	@Override
	public List<boardVO> replyList(spageTO<boardVO> rto, int bnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rto", rto);
		map.put("bnum", bnum);
		return bsession.selectList(NS+".boardreplyList", map);
	}

	@Override
	public int replyamountcall(int bnum) {
		return bsession.selectOne(NS+".replyamountcall", bnum);
	}

}
