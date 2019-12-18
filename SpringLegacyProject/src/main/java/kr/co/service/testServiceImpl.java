package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.MemberVO;
import kr.co.mapper.testMapper;

@Service
public class testServiceImpl implements testService{
	@Inject
	private testMapper tmapper;

	@Override
	public List<MemberVO> mSelect() {
		return tmapper.mSelect();
	}
}
