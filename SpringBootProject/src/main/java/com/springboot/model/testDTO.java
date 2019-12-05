package com.springboot.model;

import java.io.Serializable;

public class testDTO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String name;
	private String num;
	private String pw;
	
	public testDTO() {
		// TODO Auto-generated constructor stub
	}

	public testDTO(String id, String name, String num, String pw) {
		super();
		this.id = id;
		this.name = name;
		this.num = num;
		this.pw = pw;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getNum() {
		return num;
	}

	public String getPw() {
		return pw;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		testDTO other = (testDTO) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "testDTO [id=" + id + ", name=" + name + ", num=" + num + "]";
	}
}
