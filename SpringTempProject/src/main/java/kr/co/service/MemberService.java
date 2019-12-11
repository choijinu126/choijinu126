package kr.co.service;

import java.util.List;

import kr.co.domain.MemberVO;
import kr.co.domain.spageTO;

public interface MemberService {

	List<MemberVO> list(spageTO sto);

	void insert(MemberVO vo);

	MemberVO read(String id);

	void update(MemberVO vo);

	void delete(String id);

}
