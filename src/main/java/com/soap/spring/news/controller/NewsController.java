package com.soap.spring.news.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.news.service.NewsService;

@Controller
public class NewsController {
	
	//의존객체
	@Autowired
	private NewsService  newsService;

	@RequestMapping("/community/n_insertform")
	public ModelAndView showList(ModelAndView mView) {
		mView.setViewName("community/n_insertform");
		return mView;
	}
	//새글 저장 요청 처리
	@RequestMapping("/community/n_insert")
	public ModelAndView authInsert(HttpServletRequest request) {
		//서비스 객체를 이용해서 새글을 저장하고
		newsService.insert(request);
		//view 페이지로 forward 이동
		return new ModelAndView("redirect:/community/n_list.do");
	}
	//글 목록 보기 요청 처리 
	@RequestMapping("/community/n_list")
	public ModelAndView list(HttpServletRequest request, ModelAndView mView) {
		//인자로 전달받은 HttpServletRequest 객체를 서비스에 전달해서
		//비즈니스 로직을 수행하고 
		//view 페이지에서 필요한 데이터가 request 영역에 담기게 한다.
		newsService.getList(request, mView);
		mView.setViewName("community/n_list");
		//view 페이지로 forward 이동
		return mView;
	}
	//글 자세히 보기 요청 처리
	@RequestMapping("/community/detail")
	public ModelAndView detail(HttpServletRequest request) {
		newsService.detail(request);
		return new ModelAndView("community/n_detail");
	}
	//글 수정 폼 요청처리
	@RequestMapping("/community/n_updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request){
		// request 에 글 하나의 정보가 담기게 한다. 
		newsService.detail(request);
		
		return new ModelAndView("community/n_updateform");
	}
	//글 수정 요청 처리
	@RequestMapping("/community/update")
	public ModelAndView authUpdate(HttpServletRequest request) {
		newsService.update(request);
		int num=Integer.parseInt(request.getParameter("num"));
		return new ModelAndView("redirect:/community/detail.do?num="+num);
	}
	//글 삭제 요청 처리
	@RequestMapping("/community/delete")
	public ModelAndView authDelete(HttpServletRequest request) {
		
		newsService.delete(request);
		
		return new ModelAndView("redirect:/community/n_list.do");
	}

}
