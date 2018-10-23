<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/product/insertform.jsp</title>
<jsp:include page="../../index/loading.jsp"/>
<style>
	*{
		font-size: 1.4rem;
	}
	body{
		padding-top: 20px;
	}
	h1{
		text-align: center;
		margin-bottom: 10px;
	}
</style>
</head>
<body>
<div class="container">
	<h1>상품 추가 페이지</h1>
	<form action="${pageContext.request.contextPath }/admin/product/insert.do" method="post" enctype="multipart/form-data">
		<div class="row">
			<div class="col-sm-8 col-sm-push-2">
				<label for="file" class="control-label">상품 이미지</label>
				<input type="file" class="form-control" name="file" id="file" /> 		
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-sm-8 col-sm-push-2">
				<label for="name" class="control-label">상품 이름</label> 
				<input type="text" class="form-control" name="name" id="name" /> 
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-sm-8 col-sm-push-2">
				<label for="price" class="control-label">상품 가격</label>
				<input type="text" class="form-control" name="price" id="price" /> 
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-sm-8 col-sm-push-2">
				<label for="stock" class="control-label">상품 재고</label>
				<input type="text" class="form-control" name="stock" id="stock" /> 
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-sm-8 col-sm-push-2">
				<label for="content" class="control-label">상품정보</label> 
				<input type="text" class="form-control" name="content" id="content" /> 
			</div>
		</div>
		<br />
		<div class="row" style="text-align: center;">
			<button class="btn btn-primary btn-lg" style="width: 150px;">올리기</button>
		</div>
		<br />
	</form>
	<jsp:include page="../../index/buttons.jsp"/>
</div>
</body>
</html>