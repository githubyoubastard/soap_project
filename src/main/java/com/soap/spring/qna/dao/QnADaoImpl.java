package com.soap.spring.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soap.spring.qna.dto.QnADto;

@Repository
public class QnADaoImpl implements QnADao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(QnADto dto) {
		
		session.insert("QnA.insert", dto);
	}

	@Override
	public int getSequence() {
		
		return session.selectOne("QnA.getSequence");
		
	}

	@Override
	public int getCount(QnADto dto) {
		int count =session.selectOne("QnA.getCount",dto);
		return count;
	}

	@Override
	public List<QnADto> getList(QnADto dto) {
		
		return session.selectList("QnA.getList",dto);
	}

	@Override
	public QnADto getData(QnADto dto) {
		
		return session.selectOne("QnA.getData",dto);
	}
	
}
