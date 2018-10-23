package com.soap.spring.qna.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.qna.dto.QnADto;
import com.soap.spring.qna.service.QnAServiceImpl;



@Controller
public class QnAController {
	@Autowired
	private QnAServiceImpl QnAService;
	
	// Q&A 목록 보여주기 
	@RequestMapping("/community/q_list")
	public ModelAndView showList(ModelAndView mView,HttpServletRequest request) {
		
		QnAService.getList(request);
		
		mView.setViewName("community/q_list");
		return mView;
	}
	
	// 새글 작성 폼 요청 처리
	@RequestMapping("/community/q_insertform")
	public ModelAndView authInsertForm(ModelAndView mav, HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		QnAService.formdata(request);
		mav.setViewName("community/q_insertform");
		mav.addObject("id", id);
		return mav;

	}
	// 새글 저장 요청 처리 
	@RequestMapping("/community/q_insert")
	public ModelAndView Insert(@ModelAttribute QnADto dto, HttpServletRequest request, ModelAndView mav) {
		//서비스 객체를 이용해서 새글을 저장
		QnAService.insert(request, dto, mav);
	
		mav.setViewName("redirect:/community/q_list.do");
		return mav;
	}
	
	// 글 자세히 보기 요청 처리
	@RequestMapping("/community/q_detail")
	public ModelAndView detail(HttpServletRequest request) {
		// 서비스 객체를 이용해서 글 자세히 보기에 관련된
		// Model 이 request 에 담기게 하고
		QnAService.detail(request);
		// veiw 페이지로 forward 이동해서 응답하기
		return new ModelAndView("community/q_detail");
	}
}
