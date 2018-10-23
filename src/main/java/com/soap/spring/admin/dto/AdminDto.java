package com.soap.spring.admin.dto;

public class AdminDto {
	private String id; // 관리자 아이디
	private String pwd; // 관리자 비밀번호
	private String name; // 관리자 이름
	private String regdate; // 등록일
	
	public AdminDto() {}

	public AdminDto(String id, String pwd, String name, String regdate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.regdate = regdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
