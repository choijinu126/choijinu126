package kr.co.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.MemberVO;

@Repository
public class loginDAOImpl implements loginDAO{
	@Inject
	private SqlSession lsession;
	private final String NS = "kr.co.mapper.login";

	@Override
	public MemberVO idCheck(String id) {
		return lsession.selectOne(NS+".idCheck", id);
	}

}
