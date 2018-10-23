package com.soap.spring.qna.dto;
 
public class QnADto {
	private int num; // 글번호 
	private String writer; // 작성자 
	private String title; // 글제목 
	private String content; // 글내용 
	private String target_id; // 답글의 대상이 되는 아이디 
	private int qna_group; // 원글의 번호를 답변의 그룹번호로 지정 
	private int viewCount; // 글 조회수 
	private boolean passwdok; // 비밀글 설정 인지 아닌지 
	private String passwd; // 글 비밀번호 설정 
	private int isDeleted; // 삭제여부  1이면 삭제 된 글 
	private String regdate; // 댓글등록일 
	
	// 페이징 처리 할 때 필요한 값
	private int startRowNum;
	private int endRowNum;
	
	private int prevNum; // 이전글의 글번호
	private int nextNum; // 다음글의 글번호
	
	public QnADto(){}

	public QnADto(int num, String writer, String title, String content, String target_id, int qna_group, int viewCount,
			boolean passwdok, String passwd, int isDeleted, String regdate, int startRowNum, int endRowNum, int prevNum,
			int nextNum) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.target_id = target_id;
		this.qna_group = qna_group;
		this.viewCount = viewCount;
		this.passwdok = passwdok;
		this.passwd = passwd;
		this.isDeleted = isDeleted;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
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

	public String getTarget_id() {
		return target_id;
	}

	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}

	public int getQna_group() {
		return qna_group;
	}

	public void setQna_group(int qna_group) {
		this.qna_group = qna_group;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public boolean isPasswdok() {
		return passwdok;
	}

	public void setPasswdok(boolean passwdok) {
		this.passwdok = passwdok;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public int getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
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

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

	

}
