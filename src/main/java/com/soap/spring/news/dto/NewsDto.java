package com.soap.spring.news.dto;

public class NewsDto {
	private int num; //번호
	private String writer; //작성자
	private String title; //제목
	private String content; //내용
	private int viewCount; // 조회수
	private String regdate; // 작성날짜
	private int startRowNum;
	private int endRowNum;
	private int prevnum; // 이전글의 글번호
	private int nextnum; // 다음글의 글번호
	
	//디폴트 생성자
	public NewsDto() {}

	public NewsDto(int num, String writer, String title, String content, int viewCount, String regdate, int startRowNum,
			int endRowNum, int prevnum, int nextnum) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.viewCount = viewCount;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevnum = prevnum;
		this.nextnum = nextnum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getPrevnum() {
		return prevnum;
	}

	public void setPrevnum(int prevnum) {
		this.prevnum = prevnum;
	}

	public int getNextnum() {
		return nextnum;
	}

	public void setNextnum(int nextnum) {
		this.nextnum = nextnum;
	}


	
}
