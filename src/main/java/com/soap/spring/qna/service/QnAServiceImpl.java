package com.soap.spring.qna.service;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.qna.dao.QnADao;
import com.soap.spring.qna.dto.QnADto;

@Service
public class QnAServiceImpl implements QnAService {
	//한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=10;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=5;	
				
		@Autowired
		private QnADao qnaDao;
		
		
	//insertform 답글일 경우 원글 정보 가져가서 보여주기 
	public void formdata(HttpServletRequest request) {
		//1. 파라미터로 전달되는 글 번호 읽어오기 
		String numStr=request.getParameter("num");
		System.out.println("num: "+numStr);
		if( numStr != null ) {
			
			int num = Integer.parseInt(request.getParameter("num"));
			QnADto dto =new QnADto();
			
			//글번호도 dto 에 담는다.
			dto.setNum(num);
			
			QnADto resultDto = qnaDao.getData(dto);
			
			//request 에담고 
			request.setAttribute("dto", resultDto);
		}
		
		

	}
	
	// Q&A 글 디비에 저장하기 
	@Override
	public void insert(HttpServletRequest request, QnADto dto, ModelAndView mav) {
		
		System.out.println("input 값 num "+dto.getNum());
		
		String id=(String)request.getSession().getAttribute("id");
		// 일단 테스트 !! 
		dto.setWriter(id);
		// 저장할 글의 번호를 미리 얻어낸다.
		int seq = qnaDao.getSequence();
		// 글을 DB에 저장
		System.out.println(dto.getTitle());
		dto.setTarget_id("관리자");
		dto.setNum(seq);
		
		
		
		
		// 첫글일 경우와 답글일 경우 구분해서 Qna_group 값을 다르게 지정한다.
		String numStr=request.getParameter("num");
		System.out.println("num값 "+numStr);
		
		if( numStr != null ) {
			
			int num = Integer.parseInt(request.getParameter("num"));
			dto.setQna_group(num);
			System.out.println("답글일 때 월글 번호 :"+num);
			
		}else{
			// 첫글일 경우 seq 넘버를 그룹번호로 저장!! 
			dto.setQna_group(seq);
			System.out.println("첫글일 경우 seq 번호를 "+seq);
		}
		
			
		
		
		// 리뷰글일 경우 첫글의 넘버를 그룹번호로 저장한다. 
		
		qnaDao.insert(dto);
		
	}
	@Override
	public void getList( HttpServletRequest request) {
		
		QnADto dto = new QnADto();
		
		//보여줄 페이지의 번호
		int pageNum=1;
	
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어온다.
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
						
		// 전체 row 의 갯수를 읽어온다 
		int totalRow=0;
		
		totalRow = qnaDao.getCount(dto);
		
		System.out.println("totalRow:" +totalRow);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		// 위에서 만든 CommDto 에 추가정보를 담는다. 
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		///////////////////////
		
		List<QnADto> list=qnaDao.getList(dto);
		
		
		// request 에 담고 
		request.setAttribute("list", list);
		// 페이징 처리에 관려된 값도 request에 담기 
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum",endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		
		// 전체 row 의 갯수도 전달하기 
		request.setAttribute("totalRow", totalRow);

	}
	@Override
	public void detail(HttpServletRequest request) {
		
		//1. 파라미터로 전달되는 글 번호 읽어오기 
		int num = Integer.parseInt(request.getParameter("num"));
		
		QnADto dto =new QnADto();
		
		//글번호도 dto 에 담는다.
		dto.setNum(num);
		
		QnADto resultDto = qnaDao.getData(dto);
		
		//request 에담고 
		request.setAttribute("dto", resultDto);
		
		
		
		// 로그인 여부 확인해서 request 에 담기 
		String id= (String)request.getSession().getAttribute("id");
		boolean isLogin =false;
		if(id!=null) {
			isLogin =true;
		}
		// 로그인 여부
		request.setAttribute("isLogin", isLogin);	
	}
}
