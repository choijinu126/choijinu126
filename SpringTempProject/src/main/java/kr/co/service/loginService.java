package kr.co.service;

import java.util.Date;

import kr.co.domain.MemberVO;

public interface loginService {

	MemberVO idCheck(String id);

	MemberVO login(MemberVO vo);

	void keepLogin(String id, String sessionid, Date sessionlimit);

	MemberVO checksessionkey(String sessionId);

	MemberVO checkVoFromCookie(String sessionId);

}
