package com.soap.spring.users.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.users.usersDao.UsersDao;
import com.soap.spring.users.usersDto.UsersDto;

@Repository
public class UsersServiceImpl implements UsersService{
	@Autowired
	private UsersDao dao;

	@Override
	public boolean canUseId(HttpServletRequest request, String id) {
		// 관리자가 아니면 아이디에 admin으로 시작할 수 X
		if(request.getSession().getAttribute("admin")==null) {
			if(id.startsWith("admin")) {
				return false;
			}
		}
			return dao.canUseId(id);	
	}
	@Override
	public void insert(UsersDto dto) {
		BCryptPasswordEncoder crypt=new BCryptPasswordEncoder();
		String cryptedPwd=crypt.encode(dto.getPwd());
		dto.setPwd(cryptedPwd);
		dao.insert(dto);
	}
	@Override
	public void login(UsersDto dto, HttpSession session, ModelAndView mav) {
		boolean isSuccess=false;
		UsersDto DBdto=dao.getData(dto.getId());
		if(DBdto != null) {
			isSuccess=BCrypt.checkpw(dto.getPwd(), DBdto.getPwd());
		} else {
		}
		
		// 로그인 정보가 맞은 경우
		if(isSuccess) {
			// 관리자라면
			if(DBdto.getIsAdmin()==1) {
				session.setAttribute("admin", true);
				session.setAttribute("id", dto.getId());
			}
			// 그냥 회원이라면
			else {
				session.setAttribute("id", dto.getId());
			}		
		}else {
			mav.addObject("msg", "로그인 정보가 맞지 않습니다. 다시 확인해주세요.");
		}
		mav.addObject("isSuccess", isSuccess);
	}
	@Override
	public void detail(ModelAndView mav, HttpSession session) {
		String id=(String)session.getAttribute("id");
		UsersDto dto=dao.getData(id);
		mav.addObject("dto", dto);
	}
	@Override
	public void update(UsersDto dto, HttpSession session) {
		String id=(String)session.getAttribute("id");
		dto.setId(id);
		dao.update(dto);
	}
	@Override
	public void delete(HttpSession session) {
		String id=(String)session.getAttribute("id");
		dao.delete(id);
	}
	@Override
	public void resetPwd(HttpSession session, String resetPassword, String currentPwd, ModelAndView mav) {
		String id=(String)session.getAttribute("id");
		UsersDto DBdto=dao.getData(id);
		boolean isValid=BCrypt.checkpw(currentPwd, DBdto.getPwd());
		if(!isValid) {
			mav.addObject("msg", "입력하신 비밀번호가 틀립니다.");
		}else {
			String cryptPwd=new BCryptPasswordEncoder().encode(resetPassword);
			UsersDto dto=new UsersDto();
			dto.setId(id);
			dto.setPwd(cryptPwd);
			dao.resetPwd(dto);
			mav.addObject("msg", "비밀번호가 변경 되었습니다.");
		}
	}
	@Override
	public void info(UsersDto dto, HttpSession session, ModelAndView mav) {
		String id=(String)session.getAttribute("id");
		UsersDto dbDto=dao.getData(id);
		mav.addObject("dto", dbDto);
	}
	@Override
	public void loginForm(HttpServletRequest request, ModelAndView mView) {
		String msg=request.getParameter("msg");
		String isSuccessStr=request.getParameter("isSuccess");
		if(msg!=null && isSuccessStr!=null) {
			boolean isSuccess=Boolean.parseBoolean(isSuccessStr);
			mView.addObject("msg",msg);
			mView.addObject("isSuccess",isSuccess);	
		}
	}
	@Override
	public String profileUpdate(HttpServletRequest request, MultipartFile mFile, ModelAndView mav) {
		 //로그인된 아이디
	      String id=(String)request.getSession().getAttribute("id");
	      
	      // upload 폴더의 실제 경로 
	      String realPath=
	            request.getServletContext().getRealPath("/upload");
	      String orgFileName=mFile.getOriginalFilename();
	      // 저장할 파일의 상세 경로
	      String filePath=realPath+File.separator;
	      
	      // 파일 시스템에 저장할 파일명을 만든다.
	      String saveFileName=System.currentTimeMillis()+orgFileName;
	      // 업로드 폴더가 존재 하지 않으면 만든다. 
	      File uploadFolder=new File(filePath);
	      if(!uploadFolder.exists()) {
	         uploadFolder.mkdir();
	      }
	      try {
	         //업로드 폴더에 파일을 저장한다.
	         mFile.transferTo(new File(filePath+saveFileName));
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      
	      //수정할 정보를 Dto 에 담기
	      UsersDto dto=new UsersDto();
	      dto.setId(id);
	      dto.setProfileImage(saveFileName);
	      System.out.println("saveFileName:"+saveFileName);
	      
	      //Dao 를 이용해서 수정하기 
	      dao.updateProFile(dto);
	      
	      mav.addObject("dto", dto);
	      
	      return saveFileName;
	}
}
