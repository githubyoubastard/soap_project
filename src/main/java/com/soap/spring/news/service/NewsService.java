package com.soap.spring.news.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface NewsService {
	public void insert(HttpServletRequest request); 
	public void getList(HttpServletRequest request, ModelAndView mView);
	public void detail(HttpServletRequest request);
	public void update(HttpServletRequest request);
	public void delete(HttpServletRequest request);
}
