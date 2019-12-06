package kr.co.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.MemberVO;
import kr.co.persistence.loginDAO;

@Service
public class loginServiceImpl implements loginService{

	@Autowired
	private loginDAO ldao;
	
	@Override
	public MemberVO idCheck(String id) {
		return ldao.idCheck(id);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		return ldao.login(vo);
	}

	@Override
	public void keepLogin(String id, String sessionid, Date sessionlimit) {
		ldao.keepLogin(id, sessionid, sessionlimit);
	}

	@Override
	public MemberVO checksessionkey(String sessionId) {
		return ldao.checksessionkey(sessionId);
	}
	
}
