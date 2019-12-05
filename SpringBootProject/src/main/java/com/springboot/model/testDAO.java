package com.springboot.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface testDAO {

	@Select("select * from member_test")
	public List<testDTO> list();

	@Insert("insert into member_test values(#{id}, #{name}, #{num}, #{pw})")
	public void insert(testDTO vo);

}
