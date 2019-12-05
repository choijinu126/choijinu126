package kr.co.persistence;

import kr.co.domain.MemberVO;

public interface loginDAO {

	MemberVO idCheck(String id);

}
