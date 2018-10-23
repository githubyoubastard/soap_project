<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/adminList.jsp</title>
<jsp:include page="../../index/loading.jsp"/>
<style>
	*{
		font-size: 1.5rem;
	}
	
	body{
		margin-top: 20px;
	}
	
	#btnDiv{
		margin-top: 20px;
		margin-bottom: 20px;
	}
</style>
</head>
<body>
<jsp:include page="../../index/header.jsp"/>
	<div class="container">
		<h1>관리자 목록</h1>

		<div class="row" id="btnDiv">
			<div class="col-xs-1 col-xs-offset-11">
				<a href="${pageContext.request.contextPath }/admin/admin/A_insertForm.do">
					<button class="btn btn-primary pull-right" id="addBtn">추가</button>
				</a>
			</div>
		</div>
		
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>	
					<th>이메일</th>
					<th>전화번호</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${adminList }">
					<tr>
						<td>${tmp.id }</td>
						<td>${tmp.name }</td>
						<td>${tmp.email }</td>
						<td>${tmp.phone }</td>
						<td>${tmp.regdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../../index/buttons.jsp"/>
	</div>
</body>
</html>