package kr.co.persistence;

import java.util.List;

import kr.co.domain.MemberVO;
import kr.co.domain.spageTO;

public interface MemberDAO {

	List<MemberVO> list(spageTO sto);

	void insert(MemberVO vo);

	MemberVO read(String id);

	void update(MemberVO vo);

	void delete(String id);

	int amountcall(spageTO sto);
	
}
