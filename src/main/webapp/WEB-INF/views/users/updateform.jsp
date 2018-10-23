<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/updateform.jsp</title>

<jsp:include page="../index/loading.jsp"/>
<style>
	.one{
  position:absolute;
  right:0;
  left:6%;
  width:95%;
  height:100%;
}
#member .heading{
  padding-top:20px;
  padding-bottom:20px;
  font-size: 4rem;
  border-bottom: 1px solid #000;
}
#member a{
	font-size:3rem;
	color:#53b5aa;
}
#member a:hover{
	font-size:3rem;
	color:#2d998c;
	transition:all .3s;
}
.container {
  display: flex;
  flex-direction: column;
  margin: auto;
  margin-top: 10vh;
  margin-bottom:10vh;
  height: 80%;
  width : 45%;
  /* Rectangle 6: */
  background-image: linear-gradient(-182deg,  #FFFFFF 0%, #F5F5F5 100%);
  box-shadow: 8px 8px 23px -10px  rgba(15,16,61,0.35);
  border-radius: 4px;
  justify-content: space-between;
}
.btn{
background-color:#53b5aa;
color:#fff;
margin-top:40px;
}

.btn:hover{
box-shadow: 8px 8px 23px -10px  rgba(15,16,61,0.35);
background-color:#2d998c;
transition:all .3s;
color:#fff;
}
label{
	font-size:1.2rem;
	padding-top:10px;
}


</style>
</head>

<body>

<jsp:include page="../index/header.jsp"/>

<div class="one">

	<div id="member">
		<p class="heading">MEMBER <span><a href="${pageContext.request.contextPath}/users/info.do">Info</a></span> <span><a href="${pageContext.request.contextPath}/users/cart.do">Cart</a></span></p>
	</div>
	
	<div class="container">
		<div class="profile">
			<form action="update.do" method="post" class="form-group">
	
			<br />
			<div class="row">
				<div class="col-sm-2 col-sm-push-2">
					<label for="id" class="label-control">아이디</label>			
				</div>
				<div class="col-sm-5 col-sm-push-2">
					<input type="hidden" name="id" class="form-control"/>
					<input type="text" name="id" value="${dto.id }" class="form-control" disabled/>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-sm-2 col-sm-push-2">
					<label for="email" class="label-control">이메일</label>			
				</div>
				<div class="col-sm-5 col-sm-push-2">
					<input type="text" name="email" value="${dto.email }" class="form-control"/>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-sm-2 col-sm-push-2">
					<label for="phone" class="label-control">핸드폰 번호</label>			
				</div>
				<div class="col-sm-5 col-sm-push-2">
					<input type="text" name="phone" value="${dto.phone }" class="form-control"/>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-sm-2 col-sm-push-2">
					<label for="addr" class="label-control">주소</label>			
				</div>
				<div class="col-sm-5 col-sm-push-2">
					<input type="text" name="addr" value="${dto.addr }" class="form-control"/>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-sm-7 col-sm-push-2">
					<button type="submit" class="btn btn-block">수정</button>
				</div>
			</div>
		</form>
		</div>
	</div>
</div>
</body>
</html>