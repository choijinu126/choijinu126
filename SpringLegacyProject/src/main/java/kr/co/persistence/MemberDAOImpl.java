package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession msession;
	private final String NS = "kr.co.mapper.member";

	@Override
	public List<MemberVO> list() {
		return msession.selectList(NS+".list");
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
}
