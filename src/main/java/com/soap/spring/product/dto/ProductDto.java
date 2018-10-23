package com.soap.spring.product.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDto {
	private int num;					//상품번호
	private String name;			//상품이름
	private String price;			//상품 가격
	private String stock;			//상품 재고
	private String content;		//상품 내용
	private String description;	//상품 상세 내용
	private String regdate;		//상품 출시 날짜
	private String orgFileName;
	private String saveFileName;
	private String fileSize;
	private String startRowNum;	
	private String endRowNum;
	private MultipartFile file;
	public ProductDto() {}
	public ProductDto(int num, String name, String price, String stock, String content, String description,
			String regdate, String orgFileName, String saveFileName, String fileSize, String startRowNum,
			String endRowNum, MultipartFile file) {
		super();
		this.num = num;
		this.name = name;
		this.price = price;
		this.stock = stock;
		this.content = content;
		this.description = description;
		this.regdate = regdate;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.file = file;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getOrgFileName() {
		return orgFileName;
	}
	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(String startRowNum) {
		this.startRowNum = startRowNum;
	}
	public String getEndRowNum() {
		return endRowNum;
	}
	public void setEndRowNum(String endRowNum) {
		this.endRowNum = endRowNum;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
