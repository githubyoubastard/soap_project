<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="${pageContext.request.contextPath }/upload/${dto.saveFileName}" alt="" />
<form action="update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" id="num" value="${dto.num }"/>
		<input type="file" name="file" id="file"/> 
		<br /> 
		<label for="name">상품이름</label> 
		<input type="text" name="name" id="name" value="${dto.name }" /> 
		<br /> 
		<label for="price">상품 가격</label>
		<input type="text" name="price" id="price" value="${dto.price }" /> 
		<br /> 
		<label for="stock">상품 재고</label>
		<input type="text" name="stock" id="stock" value="${dto.stock }"/> 
		<br /> 
		<label for="content">상품 정보</label> 
		<input type="text" name="content" id="content" value="${dto.content }" /> 
		<br />
		<button>올리기</button>
</form>
</body>
</html>