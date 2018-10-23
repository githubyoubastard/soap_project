package com.soap.spring.product.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.product.dao.ProductDao;
import com.soap.spring.product.dto.ProductDto;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDao dao;

	@Override
	public void insert(ProductDto dto, HttpServletRequest request) {
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath=request.getSession().getServletContext().getRealPath("/upload");
		//콘솔에 경로 출력해보기
		System.out.println("ItemServiceImple Insert메소드");
		//MultipartFile 객체의 참조값 얻어오기
		//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
		MultipartFile mFile=dto.getFile();
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//파일 사이즈
		long fileSize=mFile.getSize();
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		//디렉토리를 만들 파일 객체 생성
		File file=new File(filePath);
		if(!file.exists()){//디렉토리가 존재하지 않는다면
			file.mkdir();//디렉토리를 만든다.
		}
		//파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
		String saveFileName=System.currentTimeMillis()+orgFileName;
		try{
			//upload 폴더에 파일을 저장한다.
			mFile.transferTo(new File(filePath+saveFileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		dto.setOrgFileName(orgFileName);
		dto.setSaveFileName(saveFileName);
		dao.insert(dto);
	}

	@Override
	public void update(ProductDto dto, HttpServletRequest request) {
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath=request.getSession().getServletContext().getRealPath("/upload");
		//콘솔에 경로 출력해보기
		System.out.println("ItemServiceImple Insert메소드");
		//MultipartFile 객체의 참조값 얻어오기
		//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
		MultipartFile mFile=dto.getFile();
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//파일 사이즈
		long fileSize=mFile.getSize();
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		//디렉토리를 만들 파일 객체 생성
		File file=new File(filePath);
		if(!file.exists()){//디렉토리가 존재하지 않는다면
			file.mkdir();//디렉토리를 만든다.
		}
		//파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
		String saveFileName=System.currentTimeMillis()+orgFileName;
		try{
			//upload 폴더에 파일을 저장한다.
			mFile.transferTo(new File(filePath+saveFileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		dto.setSaveFileName(saveFileName);
		dao.update(dto);
	}

	@Override
	public void delete(int num) {
		dao.delete(num);
	}
	
	@Override
	public void getList(ModelAndView mav) {
		List<ProductDto> list=dao.getList();
		mav.addObject("list", list);
	}

	@Override
	public void detail(ProductDto dto, HttpServletRequest request, ModelAndView mav) {
		int num=Integer.parseInt(request.getParameter("num"));
		dto=dao.detail(num);
		mav.addObject("dto", dto);
	}
}
