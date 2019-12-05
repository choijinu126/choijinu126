package kr.co.service;

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
	
}
