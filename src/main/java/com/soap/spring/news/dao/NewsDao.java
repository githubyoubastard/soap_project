package com.soap.spring.news.dao;

import java.util.List;

import com.soap.spring.news.dto.NewsDto;

public interface NewsDao {	//구현 할 클래스가 강제로 메소드를 정의한 것
	//새글 저장하는 메소드 
	public void insert(NewsDto dto);
	//인자로 전달되는 정보에 맞는 글 목록을 리턴하는 메소드 
	public List<NewsDto> getList(NewsDto dto);
	//인자로 전달되는 정보에 맞는 글 하나를 리턴하는 메소드
	public NewsDto getData(NewsDto dto);
	//인자로 전달되는 정보에 맞는 글을 수정하는 메소드
	public void update(NewsDto dto);
	//인자로 전달되는 글번호에 해당되는 글을 삭제하는 메소드
	public void delete(int num);
	//인자로 전달되는 글번호에 해당되는 글의 조회수를 증가 시키는 메소드
	public void addViewCount(int num);
	//인자로 전달되는 정보에 맞는 글의 갯수를 리턴하는 메소드 
	public int getCount(NewsDto dto);
		
}
