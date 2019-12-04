package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.MemberVO;
import kr.co.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO mdao;

	@Override
	public List<MemberVO> list() {
		return mdao.list();
	}

	@Override
	public void insert(MemberVO vo) {
		mdao.insert(vo);
	}

	@Override
	public MemberVO read(String id) {
		return mdao.read(id);
	}

	@Override
	public void update(MemberVO vo) {
		mdao.update(vo);
	}

	@Override
	public void delete(String id) {
		mdao.delete(id);
	}
}
