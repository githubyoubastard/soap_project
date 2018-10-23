<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/order/newORderList.jsp</title>
<jsp:include page="../../index/loading.jsp"/>
<style>
	*{
		font-size: 1.5rem;
	}
	body{
		margin-top: 20px;
	}
	.order_div{
		height: 200px;
		border: 1px solid black;
		text-align: center;
		margin-top: 10px;
	}
	table{
		margin-top: 20px;
	}

</style>

</head>
<body>
<jsp:include page="../../index/header.jsp"/>
<div class="container">
	<h1>새 주문 리스트</h1>
	
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문자아이디</th>
				<th>상품이름</th>
				<th>수량</th>
				<th>가격</th>
				<th>주문일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${orderList }">
				<tr>
					<td><a href="${pageContext.request.contextPath}/admin/order/orderDeatil.do?order_num=${tmp.order_num}">
						${tmp.order_num }</a></td>
					<td>${tmp.user_id }</td>
					<td>${tmp.product_name }</td>
					<td>${tmp.product_quantity}</td>
					<td>${tmp.order_totalPrice }</td>
					<td>${tmp.order_regdate }</td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
	<jsp:include page="../../index/buttons.jsp"/>
</div>
</body>
</html>