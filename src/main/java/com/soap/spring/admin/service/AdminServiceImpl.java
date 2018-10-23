package com.soap.spring.admin.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.admin.dao.AdminDao;
import com.soap.spring.order.dao.OrderDao;
import com.soap.spring.order.dto.OrderDto;
import com.soap.spring.product.dao.ProductDao;
import com.soap.spring.product.dto.ProductDto;
import com.soap.spring.users.usersDto.UsersDto;

@Repository
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ProductDao productDao;
	
	// 관리자 목록 보여주기
	@Override
	public void getList(ModelAndView mView) {
		List<UsersDto> list = adminDao.getList();
		mView.addObject("adminList",list);
	}

	@Override
	public void insert(UsersDto dto) {
		BCryptPasswordEncoder crypt=new BCryptPasswordEncoder();
		String cryptedPwd=crypt.encode(dto.getPwd());
		dto.setPwd(cryptedPwd);
		adminDao.insert(dto);
	}

	@Override
	public void getOrderList(ModelAndView mView) {
		// 총 주문건수
		int totalOrderNum=orderDao.getTotalOrderNum();
			
		// mView에 담기
		mView.addObject("totalOrderNum",totalOrderNum);
	}

	@Override
	public void getOrderDetail(HttpServletRequest request, ModelAndView mView) {
		// 파라미터로 넘어오는 주문 번호 읽기
		String order_num=request.getParameter("order_num");
		// 주문한 상품 목록
		List<OrderDto> orderList=orderDao.getOrderDetail(order_num);
		// 주문 정보(주문 번호, delivery 정보 등)
		OrderDto orderInfo=orderDao.getOrderInfo(order_num);
		// mView에 담기
		mView.addObject("orderList",orderList);
		mView.addObject("orderInfo",orderInfo);
	}

	@Override
	public void getProductList(ModelAndView mView) {
		List<ProductDto> productList=productDao.getList();
		mView.addObject("productList",productList);
	}

	@Override
	public void newOrderList(ModelAndView mView) {
		List<OrderDto> orderList=orderDao.getOrderList();
		// mView에 담기
		mView.addObject("orderList",orderList);
	}

	@Override
	public void ProductInsert(ProductDto dto, HttpServletRequest request) {
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath=request.getSession().getServletContext().getRealPath("/upload");

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
		productDao.insert(dto);
	}

	@Override
	public void getProductInfo(ProductDto dto, HttpServletRequest request, ModelAndView mav) {
		int num=Integer.parseInt(request.getParameter("num"));
		dto=productDao.detail(num);
		mav.addObject("dto", dto);
	}

	@Override
	public void ProductUpdate(ProductDto dto, HttpServletRequest request) {
		String realPath=request.getSession().getServletContext().getRealPath("/upload");
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
		productDao.update(dto);
	}
}
