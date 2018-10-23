<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/order/orderIndex.jsp</title>
<jsp:include page="../../index/loading.jsp"/>
<style>
	*{
		font-size: 1.5rem;
	}
	#showNum{
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
	#showNum a{
		font-size: 4rem;
		color: #008B8B;
	}
	#showNum>div{
		width: 32.4%;
		padding: 0;
		display: flex;
	    align-items: center;
	    justify-content: center;
	    flex-direction: column;
	}
	#newOrder{
		margin-left: 15px;
	}
	#goBackBtn{
		margin-top: 20px;
	}
</style>

</head>
<body>
<jsp:include page="../../index/header.jsp"/>
<div class="container">
	<h1>주문 관리 페이지</h1>
	
	<div class="row" id="showNum">
		<div class="col-xs-4 order_div" id="newOrder">
			<h3>새주문</h3>
			<p><a href="${pageContext.request.contextPath}/admin/order/newOrderList.do">${totalOrderNum }</a></p>	
		</div>
		<div class="col-xs-4 order_div" id="deliver">
			<h3>배달중</h3>
			<p><a href="">0</a></p>
		</div>
		<div class="col-xs-4 order_div" id="pastOrder">
			<h3>주문완료</h3>
			<p><a href="">0</a></p>
		</div>
	</div>
	
	<jsp:include page="../../index/buttons.jsp"/>
</div>
</body>
</html>