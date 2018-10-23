package com.soap.spring.users.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.users.service.UsersService;
import com.soap.spring.users.usersDto.UsersDto;

@Controller
public class UsersController {
	@Autowired
	private UsersService service;
	
	/*회원가입 폼*/  
	@RequestMapping("/users/insertform")
	public ModelAndView insertform() {
		return new ModelAndView("users/insertform");
	}
	/*jackson 이용한 아이디 중복체크*/
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(HttpServletRequest request, @RequestParam String inputId){
		boolean canUse=service.canUseId(request, inputId);
		Map<String, Object> map=new HashMap<>();
		map.put("canUse", canUse);
		return map;
	}
	@RequestMapping("/users/insert")
	public ModelAndView insert(@ModelAttribute UsersDto dto) {
		service.insert(dto);
		return new ModelAndView("redirect:/users/loginform.do");
	}
	/*로그인 폼*/
	@RequestMapping("/users/loginform")
	public ModelAndView loginform(HttpServletRequest request, ModelAndView mView){	
		service.loginForm(request, mView);
		mView.setViewName("users/loginform");
		return mView;
	}
	/*로그인 처리 후 인덱스페이지로 전환*/
	@RequestMapping("/users/login")
	public ModelAndView login(@ModelAttribute UsersDto dto, HttpSession session, ModelAndView mav, HttpServletRequest request) {
		service.login(dto, session, mav);
		boolean isSuccess=(boolean)mav.getModel().get("isSuccess");
		if(isSuccess) {
			mav.setViewName("redirect:/home.do");
		}else {
			mav.setViewName("redirect:/users/loginform.do");
		}
		return mav;
	}
	/*회원정보 업데이트*/
	@RequestMapping("/users/updateform")
	public ModelAndView FilterUpdateform(HttpServletRequest request, HttpSession session) {
		ModelAndView mav=new ModelAndView();
		service.detail(mav, session);
		mav.setViewName("users/updateform");
		return mav;
	}
	
	@RequestMapping("/users/update")
	public ModelAndView update(@ModelAttribute UsersDto dto, HttpSession session) {
		ModelAndView mav=new ModelAndView();
		service.update(dto, session);
		mav.setViewName("redirect:/users/info.do");
		return mav;
	}
	@RequestMapping("/users/delete")
	public ModelAndView Filterdelete(HttpServletRequest request, HttpSession session) {
		service.delete(session);
		session.invalidate();
		return new ModelAndView("redirect:/home.do");
	}
	/*로그아웃*/
	@RequestMapping("/users/logout")
	public ModelAndView logout(HttpSession session, @ModelAttribute UsersDto dto) {
		session.invalidate();
		return new ModelAndView("redirect:/home.do");
	}
	/*비밀번호 변경 뷰페이지*/
	@RequestMapping("/users/changePwd")
	public ModelAndView changePwd() {
		return new ModelAndView("users/changePwd");
	}
	/*비밀번호 변경 로직처리*/
	@RequestMapping("/users/resetPwd")
	public ModelAndView FilterresetPwd(@RequestParam String resetPassword, @RequestParam String currentPwd ,HttpServletRequest request, HttpSession session, ModelAndView mav) {
		service.resetPwd(session, resetPassword, currentPwd, mav);
		mav.setViewName("users/chagePwdComplete");
		return mav;
	}
	@RequestMapping("/users/info")
	public ModelAndView Filterinfo(HttpSession session, ModelAndView mav, UsersDto dto) {
		service.info(dto, session, mav);
		mav.setViewName("users/info");
		return mav;
	}
	//지향
	@RequestMapping("/users/cart")
	public ModelAndView showCart() {
		return new ModelAndView("users/cart");
	}
	//지향
	@RequestMapping("/users/signupform")
		public ModelAndView showsignupform() {
		return new ModelAndView("users/signupform");
	}
		   //프로필 이미지 업데이트 요청 처리
	@RequestMapping("/users/profile_upload")
	@ResponseBody
		public Map<String, Object> authProfileUpdate(HttpServletRequest request, @RequestParam MultipartFile file, ModelAndView mav){
		 //upload폴더에 저장된 파일명
		 String fileName=service.profileUpdate(request, file, mav);
		 //upload 
		 Map<String, Object> map=new HashMap<>();
		 map.put("fileName", fileName);
		 return map;
	}
}
