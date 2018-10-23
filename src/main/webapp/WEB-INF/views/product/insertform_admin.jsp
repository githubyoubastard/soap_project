<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insert.do" method="post" enctype="multipart/form-data">
		<input type="file" name="file" id="file" /> 
		<br /> 
		<label
			for="name">상품이름</label> 
		<input type="text" name="name" id="name" /> 
		<br /> 
		<label for="price">상품 가격</label>
		<input type="text" name="price" id="price" /> 
		<br /> 
		<label for="stock">상품 재고</label>
		<input type="text" name="stock" id="stock" /> 
		<br /> 
		<label for="content">상품정보</label> 
		<input type="text" name="content" id="content" /> 
		<br />
		<button>올리기</button>
	</form>
</body>
</html>