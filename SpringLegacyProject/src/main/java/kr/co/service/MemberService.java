package kr.co.service;

import java.util.List;

import kr.co.domain.MemberVO;

public interface MemberService {

	List<MemberVO> list();

	void insert(MemberVO vo);

	MemberVO read(String id);

	void update(MemberVO vo);

	void delete(String id);

}
