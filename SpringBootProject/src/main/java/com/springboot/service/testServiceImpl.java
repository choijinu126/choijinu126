package com.springboot.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.springboot.model.testDAO;
import com.springboot.model.testDTO;

@Service
public class testServiceImpl implements testService{
	@Inject
	testDAO mdao;
	
	@Override
	public List<testDTO> list() {
		return mdao.list();
	}

	@Override
	public void insert(testDTO vo) {
		mdao.insert(vo);
	}
	
}
