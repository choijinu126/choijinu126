package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.testMapper;

@Service
public class testServiceImpl implements testService{
	@Inject
	private testMapper tmapper;

	@Override
	public String selection() {
		return tmapper.selection();
	}
}
