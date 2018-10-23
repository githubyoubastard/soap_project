package com.soap.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/about")
	public ModelAndView AboutController(ModelAndView mView){
		mView.setViewName("about");
		return mView;
	}
	
}


