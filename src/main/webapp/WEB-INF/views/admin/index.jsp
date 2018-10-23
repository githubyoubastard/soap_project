<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/index.jsp</title>
<jsp:include page="../index/loading.jsp"/>
<style>
	body{
		margin-top: 20px;
	}
	
	*{
		font-size: 1.7rem;
	}
	
	#listUl{
		margin-left: 20px;
	}
	
	#listUl>li>a{
		color:black;
		text-decoration: none;
	}
	
	.far{
		margin-right: 5px;
	}
	
	.listDiv {
	    margin-top: 20px;
	}
	
	.bms-cust-mypage-call-s{
	  font:600 30px 'nbgL';
	  position:relative;
	  margin-bottom: 15px;
	  display: block;
	}

	.bms-cust-mypage-call-s:after{
	  position:absolute;
	  content:"";
	  width: 108px;
	  height:1px;
	  background: #ffd736;
	  left:0;
	  bottom:-3px;
	}
		
</style>
</head>
<body>
<jsp:include page="../index/header.jsp"/>
<div class="container">
	<h1>관리자 페이지</h1>
	<div class="row listDiv">
		<ul id="listUl">
			<li>
				<a href="${pageContext.request.contextPath}/admin/admin/adminList.do">
					관리자 목록보기
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/admin/product/productList.do">
					상품 목록보기
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/admin/order/orderIndex.do">
					주문 목록보기
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/admin/order/orderIndex.do">
					Q&A 목록보기
				</a>
			</li>		
		</ul>
	</div>
</div>
<script>
	$("#listUl li").on("mouseover",function(){
		$(this).addClass("bms-cust-mypage-call-s");
	})
	$("#listUl li").on("mouseout",function(){
		$(this).removeClass("bms-cust-mypage-call-s");
	})
</script>
</body>
</html>