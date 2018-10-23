package com.soap.spring.cart.dto;

public class CartDto {
	
	private int num;           
	private String id;
	private String regdate;   
	private String name;
	private int price;
	private int quan;
	private String content;
	private String img;
	
	public CartDto() {}

	public CartDto(int num, String id, String regdate, String name, int price, int quan, String content, String img) {
		super();
		this.num = num;
		this.id = id;
		this.regdate = regdate;
		this.name = name;
		this.price = price;
		this.quan = quan;
		this.content = content;
		this.img = img;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuan() {
		return quan;
	}

	public void setQuan(int quan) {
		this.quan = quan;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}
