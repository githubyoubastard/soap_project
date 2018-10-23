package com.soap.spring.order.dto;

public class OrderDto {
	private String order_num; // 주문 번호
	private String user_id; // 주문자 아이디
	private int order_totalPrice; // 상품 번호
	private String order_regdate; // 배송 주소
	private String contact_name; // 받는사람 이름
	private String contact_phone; // 받는사람 연락처
	private String contact_addr; // 받는사람 주소
	private String order_requirement; // 주문 요구사항
	private int product_num; // 주문 번호
	private String product_name; // 상품 이름
	private int product_price; // 상품 가격
	private int product_quantity; // 상품 수량
	private int product_totalPrice; // 상품 총 금액
	private String product_saveFileName; // 사진 이미지 파일 경로
	private int userTotalProNum; // 회원의 한 주문당 총 상품 수
	 
	public OrderDto() {}

	public OrderDto(String order_num, String user_id, int order_totalPrice, String order_regdate, String contact_name,
			String contact_phone, String contact_addr, String order_requirement, int product_num, String product_name,
			int product_price, int product_quantity, int product_totalPrice, String product_saveFileName,
			int userTotalProNum) {
		super();
		this.order_num = order_num;
		this.user_id = user_id;
		this.order_totalPrice = order_totalPrice;
		this.order_regdate = order_regdate;
		this.contact_name = contact_name;
		this.contact_phone = contact_phone;
		this.contact_addr = contact_addr;
		this.order_requirement = order_requirement;
		this.product_num = product_num;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_quantity = product_quantity;
		this.product_totalPrice = product_totalPrice;
		this.product_saveFileName = product_saveFileName;
		this.userTotalProNum = userTotalProNum;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getOrder_totalPrice() {
		return order_totalPrice;
	}

	public void setOrder_totalPrice(int order_totalPrice) {
		this.order_totalPrice = order_totalPrice;
	}

	public String getOrder_regdate() {
		return order_regdate;
	}

	public void setOrder_regdate(String order_regdate) {
		this.order_regdate = order_regdate;
	}

	public String getContact_name() {
		return contact_name;
	}

	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}

	public String getContact_phone() {
		return contact_phone;
	}

	public void setContact_phone(String contact_phone) {
		this.contact_phone = contact_phone;
	}

	public String getContact_addr() {
		return contact_addr;
	}

	public void setContact_addr(String contact_addr) {
		this.contact_addr = contact_addr;
	}

	public String getOrder_requirement() {
		return order_requirement;
	}

	public void setOrder_requirement(String order_requirement) {
		this.order_requirement = order_requirement;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_quantity() {
		return product_quantity;
	}

	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}

	public int getProduct_totalPrice() {
		return product_totalPrice;
	}

	public void setProduct_totalPrice(int product_totalPrice) {
		this.product_totalPrice = product_totalPrice;
	}

	public String getProduct_saveFileName() {
		return product_saveFileName;
	}

	public void setProduct_saveFileName(String product_saveFileName) {
		this.product_saveFileName = product_saveFileName;
	}

	public int getUserTotalProNum() {
		return userTotalProNum;
	}

	public void setUserTotalProNum(int userTotalProNum) {
		this.userTotalProNum = userTotalProNum;
	}
}
