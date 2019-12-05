package com.springboot.service;
import java.util.List;

import com.springboot.model.testDTO;


public interface testService {

	public List<testDTO> list();

	public void insert(testDTO vo);

}
