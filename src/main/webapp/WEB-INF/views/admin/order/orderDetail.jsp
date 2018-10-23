<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/order/orderDetail.jsp</title>
<jsp:include page="../../index/loading.jsp"/>
<style>
	body{
		padding-top: 50px;
		font-size: 1.5rem;
	}
	.productsInfo{
		border: 1px solid #cecece;
		border-bottom: none;
	}
	.productInfo{
		height: 150px;
		display: flex;
		align-items: center;
		text-align:center;
		border-bottom: 1px solid #cecece;
	}
	.productTitle{
		display: flex;
		align-items: center;
		text-align: center;
		border-bottom: 1px solid #cecece;
	}
	.product_img>img{
		border-radius: 50%;
		height: 100px;
    	width: 120px;
	}
	.productTitle b{
		font-size: 1.7rem;
	}
	.productInfo b{
		font-size: 1.6rem;
	}

	.orderInfo ul{
		display: flex;
	}
	
	.orderInfo ul>li, .deliverDiv ul>li{
		font-weight:bold;
		padding-right: 50px;
		font-size: 2.5rem;
	}
	    
	.orderInfo{
		margin-bottom: 10px;
	}
	
	.deliverTb th{
		text-align: center;
		background-color: #cecece;
		width: 20%;
	}
	
	.deliverTb td{
		padding-left: 20px;
	}
	
	.deliverDiv{
		margin-top: 30px;
	}
</style>
</head>
<body>
<jsp:include page="../../index/header.jsp"/>
<div class="container">
	<div class="row orderDiv">
		<div class="orderInfo">
			<ul>
				<li>주문일자 : ${orderInfo.order_regdate}</li>
				<li style="color: #cecece;">|</li>
				<li>주문번호 : ${orderInfo.order_num}</li>
			</ul>
		</div>
		<div class="productsInfo">
			<div class="productTitle">
				<div class="col-xs-2">
					<b>상품 번호</b>
				</div>
				<div class="col-xs-3">
					<b>상품 이미지</b>
				</div>
				<div class="col-xs-3">
					<b>상품명</b>
				</div>
				<div class="col-xs-2">
					<b>수량</b>
				</div>
				<div class="col-xs-2">
					<b>가격</b>
				</div>
			</div>
			<c:forEach var="tmp" items="${orderList }">
				<div class="productInfo">
					<div class="col-xs-2 product_num">
						<b>${tmp.product_num }</b>
					</div>
					<div class="col-xs-3 product_img">
						<!--  <img src="${tmp.product_saveFileName }"/> -->
						<img src="${pageContext.request.contextPath}/upload/${tmp.product_saveFileName }"/>
					</div>
					<div class="col-xs-3 product_name">
						<b>${tmp.product_name }</b>
					</div>
					<div class="col-xs-2 product_quantity">
						<p>${tmp.product_quantity}개</p>
					</div>
					<div class="col-xs-2 product_totalNum">
						<p>${tmp.product_price}원 x ${tmp.product_quantity}개 = ${tmp.order_totalPrice}원</p>
					</div>
				</div>
			</c:forEach>
		</div>	
	</div>
	<div class="row deliverDiv">
		<div class="orderInfo">
			<ul>
				<li>배송지 정보</li>
			</ul>
		</div>
		<div class="deliverInfo">
			<table class="table table-bordered deliverTb">
				<tr>
					<th>수령인</th>
					<td>${orderInfo.contact_name }</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${orderInfo.contact_phone }</td>
				</tr>
				<tr>
					<th>배송지</th>
					<td>${orderInfo.contact_addr }</td>
				</tr>
				<tr>
					<th>배송메모</th>
					<td>${orderInfo.order_requirement }</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="../../index/buttons.jsp"/>
</div>
</body>
</html>