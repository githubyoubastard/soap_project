<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/info.jsp</title>
<jsp:include page="../index/loading.jsp"/>
<style>



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

.image {
  width: 40%;
transform: translateX(75%) translateY(65%);
  /*animation-name: example;
  animation-duration: 6s;*/

}


.profile {
  width : 150px;
  height: 150px;
  border-radius: 50%;
  overflow: hidden;
  margin-top: 43px;
  margin-left: auto;
  margin-right: auto;
  border:1px solid #ddd;
  cursor:pointer;

}

.name {
  font-family: 'Encode Sans', sans-serif;
  font-weight: 400;
  /* Duane Warner: */
  font-size: 22px;
  color: #0F103D;
  letter-spacing: 0;
  text-align: center;
  text-transform: uppercase;
  margin-bottom: 15px;
}

.designation {
  text-transform: uppercase;
  font-family: 'Encode Sans', sans-serif;
  font-weight: 400;
  /* founder and Ceo: */

  font-size: 14px;
  color: #4A4A4A;
  letter-spacing: 0;
  text-align: center;
}

.description {
  font-family: 'Encode Sans', sans-serif;
  font-weight: 300;
  /* Sandro has worked fo: */
  font-size: 1em;
  line-height: 1.2;
  color: #4A4A4A;
  letter-spacing: 0;
  padding-left: 48px;
  padding-right: 48px;
  text-align: center;
}

.button {
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 43px;
}
.button a{
  width:100px;
  height:20px;
  background-color:#53b5aa;
  border-radius:5px;
  padding:20px 20px;
  display:inline-block;
  color:#fff;
  text-align:center;
  margin:20px;
  font-size:1.1rem;
  line-height:2px;
}
.button a:hover{
box-shadow: 8px 8px 23px -10px  rgba(15,16,61,0.35);
background-color:#2d998c;
transition:all .3s;
}

@keyframes example {
    from {width: 150px;}
    to {width: 170px;}
    }

.table{
    width:70%;
    margin-left: auto;
    margin-right: auto;
    padding:20px;
    font-size:1.2rem;
 }
 .table .twidth{
 	width:60%;
 }
  .table {
  	text-align:center;
 }
 

/* 폼 숨기기 */
#profileForm{
	display: none;
}

.image2{
	width:150%;
}


</style>
</head>
<body>
<jsp:include page="../index/header.jsp"/>

<div id="contentWrap">
	<div id="contentTitle">
	<p class="heading">MEMBER <span><a href="${pageContext.request.contextPath}/users/info.do">Info</a></span> <span><a href="${pageContext.request.contextPath}/users/cart.do">Cart</a></span></p>
	</div>
		
	<div class="container">
		<div class="profile">
		
		<!-- 프로필 이미지 -->
		<c:choose>
			<c:when test="${empty dto.profileImage }">
			<p>${dto.profileImage}</p>
				<img class="image" id="profileImage" src="${pageContext.request.contextPath }/resources/images/camera.png" />
				
			</c:when>
			<c:otherwise>
				<img class="image2" id="profileImage" src="${pageContext.request.contextPath }/upload/${dto.profileImage}">
			</c:otherwise>
		</c:choose>
		
			
		</div>
		<div>
			<h1 class="name">${dto.name}</h1>
		</div>
		<table class="table">
			<tbody>
			<tr>
			<td>아이디</td>
			<td class="twidth">${dto.id}</td>
			</tr>
			<tr>
			<td>이메일</td>
			<td class="twidth">${dto.email}</td>
			</tr>
			<tr>
			<td>번호</td>
			<td class="twidth">${dto.phone}</td>
			</tr>
			<tr>
			<td>주소</td>
			<td class="twidth">${dto.addr}</td>
			</tr>
			</tbody>
		</table>
		
		<form action="profile_upload.do" method="post" 
			enctype="multipart/form-data" id="profileForm">
			<input type="file" name="file" id="file"/>
		</form>
		
		<div class="button">
			<span><a href="updateform.do">수정</a></span>
			<span><a href="javascript:deleteConfirm()">탈퇴</a></span>
		</div>
	</div><!-- container -->
	
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>

	$(".profile").click(function(){
		alert("프로필 이미지를 선택하세요.");
		// type=file 을 강제 클릭 시켜서 이미지를 선택할수 있게한다.
		$("#file").click();
	});
	// 프로필 이미지 폼이 ajax 요청으로 제출되도록 
	$("#profileForm").ajaxForm(function(responseData){
		//저장된 파일명을 얻어온다. 
		var fileName=responseData.fileName;
		//이미지 경로
		var imagePath="${pageContext.request.contextPath }/upload/"+fileName;
		//업로드된 이미지 출력 
		$("#profileImage").attr("src", imagePath);
	});
	// 프로필 이미지를 선택했을때 실행할 함수 등록 
	$("#file").on("input", function(){
		//폼 강제 제출
		$("#profileForm").submit(); 
	});
	
	function deleteConfirm(){
		var isDelete=confirm("정말 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.do";
		}
	}
</script>
</body>
</html>