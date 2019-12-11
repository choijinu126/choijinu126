package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.MemberVO;
import kr.co.domain.spageTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession msession;
	private final String NS = "kr.co.mapper.member";

	@Override
	public List<MemberVO> list(spageTO sto) {
		return msession.selectList(NS+".list", sto);
	}

	@Override
	public void insert(MemberVO vo) {
		msession.insert(NS+".insert", vo);
	}

	@Override
	public MemberVO read(String id) {
		return msession.selectOne(NS+".read", id);
	}

	@Override
	public void update(MemberVO vo) {
		msession.update(NS+".update", vo);
	}

	@Override
	public void delete(String id) {
		msession.delete(NS+".delete", id);
	}

	@Override
	public int amountcall(spageTO sto) {
		return msession.selectOne(NS+".amountcall");
	}
}
