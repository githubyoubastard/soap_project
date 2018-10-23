package com.soap.spring.news.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soap.spring.news.dto.NewsDto;

@Repository
public class NewsDaoImpl implements NewsDao{

	@Autowired
	private SqlSession session;
	
	// 글 저장
	@Override
	public void insert(NewsDto dto) {
		session.insert("news.insert", dto);	
	}
	// 리스트
	@Override
	public List<NewsDto> getList(NewsDto dto) {
	
		List<NewsDto> list=session.selectList("news.getList", dto);
		return list;
	}
	// 한 개의 글을 가져오는 메소드
	@Override
	public NewsDto getData(NewsDto dto) {
		
		NewsDto resultDto=session.selectOne("news.getData", dto);
		return resultDto;
	}
	// 글 수정
	@Override
	public void update(NewsDto dto) {
		session.update("news.update", dto);
		
	}
	@Override
	public void delete(int num) {
		session.delete("news.delete", num);
		
	}
	@Override
	public void addViewCount(int num) {
		session.update("news.addViewCount", num);
		
	}
	@Override
	public int getCount(NewsDto dto) {
		int count=session.selectOne("news.getCount", dto);
		
		return count;
	}



	}


