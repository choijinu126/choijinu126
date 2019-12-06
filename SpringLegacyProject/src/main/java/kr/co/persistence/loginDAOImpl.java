package kr.co.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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

	@Override
	public MemberVO login(MemberVO vo) {
		return lsession.selectOne(NS+".login", vo);
	}

	@Override
	public void keepLogin(String id, String sessionid, Date sessionlimit) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("sessionid", sessionid);
		map.put("sessionlimit", sessionlimit);
		lsession.update(NS+".keepLogin", map);
	}

	@Override
	public MemberVO checksessionkey(String sessionId) {
		return lsession.selectOne(NS+".checksessionkey", sessionId);
	}

}
