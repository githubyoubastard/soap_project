package com.soap.spring.filter;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class FilterLogin {
	@Around("execution(* Filter*(..))")
	public Object LoginFilter(ProceedingJoinPoint joinPoint) throws Throwable {
		Object[] args=joinPoint.getArgs();
		for(Object tmp:args) {
			if(tmp instanceof HttpServletRequest) {
				HttpServletRequest request=(HttpServletRequest)tmp;
				String id=(String)request.getSession().getAttribute("id");
				if(id==null) {
					ModelAndView mav=new ModelAndView();
					String query=request.getQueryString();
					String url=null;
					if(query==null) {
						url=request.getRequestURI();
					}else {
						url=request.getRequestURI()+"?"+query;
					}
					mav.setViewName("redirect:/users/loginform.do?url="+url);
					return mav;
				}
			}
		}
		return joinPoint.proceed();
	}
}
