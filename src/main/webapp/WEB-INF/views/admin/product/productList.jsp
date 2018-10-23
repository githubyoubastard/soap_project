<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../index/loading.jsp"/>
<style>
	*{
		font-size: 1.4rem;
	}
	
	body{
		margin-top: 20px;
	}
	
	table{
		text-align: center;
	}
	
	table>thead>tr>th{
		text-align: center;
		font-size: 1.6rem;
	}
	
	table>tbody>tr>td{
		padding-top: 45px !important;
	}
	
	.productTr:hover{
		cursor: pointer;
	}
	
	#btnDiv{
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	td>img{
		width: 100px;
		height: 100px;
	}
</style>
</head>
<body>
<jsp:include page="../../index/header.jsp"/>
	<div class="container">
		<h1>상품목록 페이지</h1>
		
		<div class="row" id="btnDiv">
			<div class="col-xs-1 col-xs-offset-11">
				<button class="btn btn-primary pull-right" id="addBtn">추가</button>
			</div>
		</div>
		
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>이미지</th>
					<th>가격</th>
					<th>등록일</th>
					<th>수정</th>
				</tr>	
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${productList }">
					<tr class="productTr">
						<td>${tmp.num }</td>
						<td><a href="${pageContext.request.contextPath }/product/detail.do?num=${tmp.num }">${tmp.name }</a></td>
						<td style="padding-top: 0 !important;"><img src="${pageContext.request.contextPath }/upload/${tmp.saveFileName }"/></td>
						<td>${tmp.price }원</td>
						<td>${tmp.regdate }</td>
						<td><a href="${pageContext.request.contextPath }/admin/product/updateform.do?num=${tmp.num }">수정</a></td>
					</tr>		
				</c:forEach>			
			</tbody>
		</table>
		<jsp:include page="../../index/buttons.jsp"/>
	</div>
<script>
	$("#addBtn").click(function(){
		location.href="${pageContext.request.contextPath }/admin/product/insertform.do";
	})
</script>
</body>
</html>