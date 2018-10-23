package com.soap.spring.users.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.users.usersDto.UsersDto;

public interface UsersService {
	public boolean canUseId(HttpServletRequest request, String id);
	public void insert(UsersDto dto);
	public void login(UsersDto dto, HttpSession session, ModelAndView mav);
	public void detail(ModelAndView mav, HttpSession session);
	public void update(UsersDto dto, HttpSession session);
	public void delete(HttpSession session);
	public void resetPwd(HttpSession session, String resetPassword, String currentPwd, ModelAndView mav);
	public void info(UsersDto dto, HttpSession session, ModelAndView mav);
	public void loginForm(HttpServletRequest request, ModelAndView mView);
	public String profileUpdate(HttpServletRequest request, MultipartFile mFile, ModelAndView mav);
}
