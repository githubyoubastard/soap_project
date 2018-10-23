<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community</title>

<jsp:include page="../index/loading.jsp" />
</head>
<style>
#insertform {
	width: 70%;
	margin: 0 auto;
	font-size: 1.5rem;
}

#insertform .innerdiv {
	margin-top: 20px;
}

#contentWrap {
	position: absolute;
	right: 0;
	left: 6%;
	width: 95%;
	height: 100%;
}

#contentTitle .heading {
	padding-top: 20px;
	padding-bottom: 20px;
	font-size: 4rem;
	border-bottom: 1px solid #000;
}

#contentTitle .heading a {
	font-size: 3rem;
	color: #53b5aa;
}

#contentTitle .heading a:hover {
	font-size: 3rem;
	color: #2d998c;
	transition: all .3s;
}

#contentTitle .com_content {
	padding-top: 7%;
	width: 70%;
	margin: 0 auto;
	font-size: 2rem;
	
}
#contentTitle .table {
	font-size: 1.5rem;
}


.com_content .table a{
	color: black;
}
</style>
<body>
	<jsp:include page="../index/header.jsp" />

	<div id="contentWrap">
		<div id="contentTitle">
			<p class="heading">
				COMMUNITY <span><a
					href="${pageContext.request.contextPath }/community/n_list.do">NEWS</a></span>
				<span><a
					href="${pageContext.request.contextPath }/community/q_list.do">Q&A</a></span>
			</p>
			<div class="com_content">

				<div>
					<label>Q&A</label>

					<div>
						<p class="info">궁금하신 점이 있으면 자유롭게 물어보세요</p>
						<a href="${pageContext.request.contextPath }/community/q_insertform.do"><button>write</button></a>
						<table class="table">
							<colgroup>
								<col style="width:10%;"/>
								<col style="width:40%;"/>
								<col style="width:20%;"/>
								<col style="width:20%;"/>
								<col style="width:10%;"/>
							</colgroup>
							<thead>
							
								<tr>
									<th scope="col">No</th>
									<th scope="col">Title</th>
									<th scope="col">Writer</th>
									<th scope="col">Date</th>
									<th scope="col">delete</th>
								</tr>
							</thead>
							<tbody >
								<c:forEach var="tmp" items="${list }">
									<tr>
										<td>${tmp.num }</td>
										<td><a href="q_detail.do?num=${tmp.num }"> <c:if
													test="${tmp.num ne tmp.qna_group}">
													<img style="margin-top: -3px;width: 24px;"
														src="${pageContext.request.contextPath }/resources/images/comment_img.gif"
														alt="댓글 이미지 " />
												</c:if> ${tmp.title }
										</a></td>
										<td>${tmp.writer }</td>
										<td>${tmp.regdate }</td>
										<td><c:if test="${tmp.writer eq id }">
												<a href="javascript:deleteConfirm(${tmp.num })">삭제</a>
											</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script>
		//삭제 확인을 하는 함수 
		function deleteConfirm(num) {
			var isDelete = confirm("파일을 삭제 하시겠습니까?");
			if (isDelete) {
				location.href = "delete.do?num=" + num;
			}
		}
	</script>
</body>
</html>