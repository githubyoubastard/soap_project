<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/order/order.do">
	<div class="product">
		<input type="hidden" name="product_num" value="${Pdto.product_num }"/>
		<input type="hidden" name="product_name" value="${Pdto.product_name }"/>
		<input type="hidden" name="product_saveFileName" value="${Pdto.product_saveFileName }"/>
		<input type="hidden" name="product_price" value="${Pdto.product_price }"/>
		<input type="hidden" name="product_quantity" value="${Pdto.product_quantity }"/>
		<p>${Pdto.product_name }</p>
		<img src="${pageContext.request.contextPath }/upload/${Pdto.product_saveFileName }" alt="" />
		<p>${Pdto.product_price }</p>
		<p>${Pdto.product_quantity }</p>
	</div>
	<div class="delivery">
		<label for="contact_name">받는 사람</label>
		<input type="text" name="contact_name" value="${Udto.contact_name }"/>
		<label for="contact_phone">받는 사람 연락처</label>
		<input type="text" name="contact_phone" value="${Udto.contact_phone }"/>
		<label for="contact_addr">받는 사람 주소</label>
		<input type="text" name="contact_addr" value="${Udto.contact_addr }"/>
		<label for="order_requirement">요구사항</label>
		<textarea name="order_requirement" cols="30" rows="10"></textarea>
	</div>
	<button type="submit">구입</button>
</form>
</body>
</html>