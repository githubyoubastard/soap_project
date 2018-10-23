package com.soap.spring.qna.dao;

import java.util.List;

import com.soap.spring.qna.dto.QnADto;

public interface QnADao {
	public void insert(QnADto dto);
	public int getSequence(); //새로운 글의 글번호를 리턴해주는 메소드 // 그룹번호로 넣어줘야하기때문에 미리 가져온다.!
	public int getCount(QnADto dto);
	public List<QnADto> getList(QnADto dto);
	public QnADto getData(QnADto dto); //인자로 전달되는 정보에 맞는 글 하나의 정보를 리턴하는 메소드 
}
