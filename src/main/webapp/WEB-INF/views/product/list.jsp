<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../index/loading.jsp"/>
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

img {
  height: auto;
  max-width: 100%;
  vertical-align: middle;
}
.btn {
  background-color: white;
  border: 1px solid #cccccc;
  color: #696969;
  padding: 0.5rem;
  text-transform: lowercase;
}
.btn--block {
  display: block;
  width: 100%;
}
.cards {
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  padding: 0;
  width:77%;
  margin:3% auto;
}
.cards__item {
  display: flex;
  padding: 3rem;
  margin-top:6%;
}
@media (min-width: 40rem) {
  .cards__item {
    width: 50%;
  }
}
@media (min-width: 56rem) {
  .cards__item {
    width: 33.3333%;
  }
}
.card {
  background-color: white;
  border-radius: 0.25rem;
  box-shadow: 0 20px 40px -14px rgba(0, 0, 0, 0.25);
  display: flex;
  flex-direction: column;
  overflow: hidden;
}
.card:hover .card__image {
  -webkit-filter: contrast(100%);
          filter: contrast(100%);
}
.card__content {
  display: flex;
  flex: 1 1 auto;
  flex-direction: column;
  padding: 1rem;
}
.card__image {
  background-position: center center;
  background-repeat: no-repeat;
  background-size: cover;
  border-top-left-radius: 0.25rem;
  border-top-right-radius: 0.25rem;
  -webkit-filter: contrast(70%);
          filter: contrast(70%);
  overflow: hidden;
  position: relative;
  transition: -webkit-filter 0.5s cubic-bezier(0.43, 0.41, 0.22, 0.91);
  transition: filter 0.5s cubic-bezier(0.43, 0.41, 0.22, 0.91);
  transition: filter 0.5s cubic-bezier(0.43, 0.41, 0.22, 0.91), -webkit-filter 0.5s cubic-bezier(0.43, 0.41, 0.22, 0.91);
}

@media (min-width: 40rem) {
  .card__image::before {
    padding-top: 66.6%;
  }
}

.card__title {
  color: #696969;
  font-size: 2rem;
  font-weight: 300;
  letter-spacing: 2px;
  text-transform: uppercase;
  padding-bottom:10px;
}
.card__text {
  flex: 1 1 auto;
  font-size: 1.5rem;
  line-height: 1.5;
  margin-bottom: 1rem;
}
.cartIcon{
	font-size:2rem;
	color:pink;
}
</style>
</head>
<body>
<jsp:include page="../index/header.jsp"/>


<div id="contentWrap">
	<div id="contentTitle">
		<p class="heading">
			<span class="title">SHOP</span> <span><a
				href="${pageContext.request.contextPath }/product/like.do">Like</a></span>
			<span><a
				href="${pageContext.request.contextPath }/product/cart.do">Cart</a></span>
		</p>
	</div>
	
	<ul class="cards">
	
		<c:forEach var="tmp" items="${list }">
		<li class="cards__item">
			<div class="card">
				<div class="card__image">
				<a href="detail.do?num=${tmp.num }">
					<img src="${pageContext.request.contextPath }/upload/${tmp.saveFileName}" />
				</a>
				</div>
				<div class="card__content">
					<div class="card__title">${tmp.name }</div>
					<p class="card__text">${tmp.content}</p>
					<p class="card__text">가격:${tmp.price}</p>
					<a href=""><i class="fab fa-gratipay cartIcon card__btn"></i></a>
					<a href=""><i class="fas fa-shopping-cart cartIcon card__btn"></i></a>
					
				</div>
			</div>
		</li>
		</c:forEach>
	</ul>	
	

</div>	

</body>
</html>