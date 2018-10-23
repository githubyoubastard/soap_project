package com.soap.spring.qna.service;



import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.qna.dto.QnADto;




public interface QnAService {
	public void insert(HttpServletRequest request, QnADto dto, ModelAndView mav);
	public void getList(HttpServletRequest request);
	public void detail(HttpServletRequest request);
	public void formdata(HttpServletRequest request);
}
