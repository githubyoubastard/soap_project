<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/detail.jsp</title>
<jsp:include page="../index/loading.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	.content{
		border: 1px solid #888888;
		box-shadow: 5px 5px 5px #888888;
	}
	.content img{
		max-width: 100%;
	}


</style>
</head>
<body>
<jsp:include page="../index/header.jsp"/>
<div class="container">
	<c:if test="${not empty keyword }">
		<p> 검색어 : <strong>${keyword }</strong> 에 대한 자세히 보기</p>
	</c:if>
	<a href="list.do">글 전체 목록보기</a>

	<h3>글 자세히 보기 페이지</h3>
	<c:if test="${sessionScope.id eq dto.writer }">
		<a href="n_updateform.do?num=${dto.num }">수정</a>
		<a href="javascript:deleteConfirm()">삭제</a>
		<script>
			function deleteConfirm(){
				var isDelete=confirm("글을 삭제 하시겠습니까?");
				if(isDelete){
					location.href="delete.do?num=${dto.num}";
				}
			}
		</script>
	</c:if>
	
<!-- mj -->
	<a href="n_updateform.do?num=${dto.num }">수정</a>
<!-- mj -->
	
	<table>
		<tr>
			<th>글번호</th>
			<td>${dto.num }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
	</table>
	<div class="content">${dto.content }</div>
				
</div>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	//로그인 했는지 여부
	var isLogin=${isLogin};

	

</script>
</body>
</html>
