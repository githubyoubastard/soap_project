<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품</title>
<jsp:include page="../index/loading.jsp" />
<style>
#contentWrap {
	position: absolute;
	right: 0;
	left: 6%;
	width: 95%;
	height: 100%;
}
#contentTitle .heading {
	padding:20px 30px 20px 30px;
	font-size: 4rem;
	border-bottom: 1px solid #000;
}

#contentTitle .heading .title{
	padding-right:30px;
}

#contentTitle .heading a {
	font-size: 3rem;
	color: #53b5aa;
	padding-right:20px;
}

#contentTitle .heading a:hover {
	font-size: 3rem;
	color: #2d998c;
	transition: all .3s;
}
.wrap_content{
	width:80%;
	margin:0 auto;
	padding-top:7%;
}
.wrap_content .image_div{
	width:60%;
	float:left;
}

.wrap_content .buy_menu{
	width:40%;
	float:right;
}

.wrap_content .buy_menu .pro_text{
	font-size:1.5rem;
	padding:10px 0;
}

.buy_menu .product_name{
	font-size:3rem;
	padding-bottom:15px;
}

.buy_menu .buy_menu_list:not(first-child) {
	margin:20px;
	font-size:1.5rem;
	
}
.wrap_content .image_div img{
	width:100%;
}
.all_price{
	border-top:1px solid #000;
	border-bottom:1px solid #000;
	float:left;
	width:100%;
	padding:5%;
	margin-top:5%;
}
.qt, .qt-plus, .qt-minus {
	display: block;
	float: left;
}

.qt {
	font-size: 15px;
	line-height:45px;
	width: 70px;
	text-align: center;
}
.qt-plus, .qt-minus {
	background: #fcfcfc;
	border: none;
	font-size: 20px;
	font-weight: 300;
	height: 100%;
	padding:0 20px;
	
	-webkit-transition: background .2s linear;
	-moz-transition: background .2s linear;
	-ms-transition: background .2s linear;
	-o-transition: background .2s linear;
	transition: background .2s linear;
}

.qt-plus:hover, .qt-minus:hover {
	background: #53b5aa;
	color: #fff;
	cursor: pointer;
}

.qt-plus {
	line-height: 45px;
}

.qt-minus {
	line-height: 47px;
}
.buy_button{
 width:100%;
 background-color:#979899;
 text-align:center;
 padding:10px;
 border-radius:5px;
 clear:both;
 
}
.buy_button a{	
	display:block;
	color:#fff;
}

.buy_button:hover {	
	transition:all .3s;
	box-shadow:3px 3px 5px 3px #aaa;

}

.qty_button{
	background-color:red;
	width:100%;
	position:relative;
	left:30%;
	
}
.like_button, .cart_button{
	width:50%;
	float:left;
	text-align:center;
	padding-top:15px;
	padding-bottom:25px;
	font-size:2rem;
}
.like_button a, .cart_button a{
	display:block;
}

.like_button a{
	color:#f954b2;
}

.like_button a:hover{
	color:#d31b6b;
}
.white_content {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
    text-align:center;
}
.white_content:target {
    opacity:1;
    pointer-events: auto;
}
.white_content > div {
	
	position: absolute;
	top: 37%;
	left: 25%;
	width: 50%;
	height: 30%;
	padding-top:5%;
	background-color: white;
	overflow: auto;	
}
.white_content > div > span:first-child{
	position: absolute;
	right:5%;
	top:10%;
}
.modal {
}
.vertical-alignment-helper {
    display:table;
    height: 100%;
    width: 100%;
}
.vertical-align-center {
    /* To center vertically */
    display: table-cell;
    vertical-align: middle;
}
.modal-content {
    /* Bootstrap sets the size of the modal in the modal-dialog class, we need to inherit it */
    width:inherit;
    height:inherit;
    /* To center horizontally */
    margin: 0 auto;
}
</style>
</head>
<body>
<jsp:include page="../index/header.jsp" />

<div id="contentWrap">

	<div id="contentTitle">
		<p class="heading">
			<span class="title">SHOP</span> <span><a
				href="${pageContext.request.contextPath }/product/like.do">Like</a></span>
			<span><a
				href="${pageContext.request.contextPath }/product/cart.do">Cart</a></span>
		</p>
	</div>
	
	<div class="wrap_content">
	
		<div class="image_div">
			<img src="${pageContext.request.contextPath}/upload/${dto.saveFileName}"/>
		</div>
		
		<div class="buy_menu">
			<div class="buy_menu_list">
				<div class="product_name">
					<p><strong >${dto.name }</strong></p>
				</div>
				<div class="product_content pro_text">
					<p>${dto.content }</p>
				</div>
				<div class="product_price pro_text">
					<p>가격: ${dto.price }원</p>
				</div>
				<div class="credits pro_text">
					<p>적립금: 1000원</p>
					<p>배송비: 2500원</p>
				</div>
		
				<div class="qty_button">
					<span class="qt-minus">-</span>
					<!-- 상품 재고 실제 제고를 표시하고 내가 선택한 수량을 다시 가져가야 하나?-->
					
					<span class="qt">${Cdto.quan }</span>
					<span class="qt-plus">+</span>
					<select name="quan" form="cart">
					  <option value="1">1</option>
					  <option value="2">2</option>
					  <option value="3">3</option>
					  <option value="4">4</option>
					</select>
				</div>
				
				<div class="all_price"><!-- 선택한 수량에 맞게 구매 금액 변화 -->
					<div class="total_price_name"> <strong>총 구매 금액 : ${dto.price }</strong></div>
					<div class="three_buttons">
						<form action="product/like.do" method="post">
							<input type="hidden" name="${dto.num }" id="num"/>
							<div class="like_button"><a href=""><i class="glyphicon glyphicon-heart"></i></a></div>
						</form>
						
						<form action="${pageContext.request.contextPath}/product/insertcart.do" method="post" id="cart">
							
							<input type="hidden" value="${dto.num }" name="num" id="num" /> <!-- 상품 번호 -->
							<input type="hidden" value="${dto.name }" name="name" id="name" />
							<input type="hidden" value="${dto.content }" name="content" id="content" />
							<input type="hidden" value="${dto.price }" name="price" id="price" />
							<input type="hidden" value="${dto.saveFileName }" name="img" id="img" />
							
							<div class="cart_button">
								<!-- Button trigger modal -->
							<button>	<i class="glyphicon glyphicon-shopping-cart"></i></button>
						
							</div>
						</form>
							
						<form action="product/buy.do" method="post" >
							<input type="hidden" id="num1" name="product_quantity"/>
							<input type="hidden" name="${dto.num }" id="product_num"/>
							<div class="buy_button"><a href="">바로 구매하기</a></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
	<script>
	 $(".qt-plus").click(function(){
		    $(this).parent().children(".qt").html(parseInt($(this).parent().children(".qt").html()) + 1);
		   
		
	  });
		  
	  $(".qt-minus").click(function(){
	    
	    child = $(this).parent().children(".qt");
	    
	    if(parseInt(child.html()) > 1) {
	      child.html(parseInt(child.html()) - 1);
	    }
	    
	  });
	  
	  
	  /*cart form ajax로 보내기?
	  $("#cart").submit(function(e) {
		  
		    var form = $(this);
		    var url = form.attr('action');

		    $.ajax({
		           type: "POST",
		           url: url,
		           data: form.serialize(), // serializes the form's elements.
		           success: function(data)
		           {
		               alert(data); // show response from the php script.
		           }
		         });

		    e.preventDefault(); // avoid to execute the actual submit of the form.
		});*/
		    
		
	</script>
</body>
</html>