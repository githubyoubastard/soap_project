<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ndetail.jsp</title>

<script
	src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>

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

.border {
	border: 1px #ddd solid;
}

#contentTitle .com_content .row {
	font-size: 1.5rem;
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
					<label>NEWS</label>

					<div class=row>
						<p class="info">NEWS 페이지 입니다</p>
						<!-- detail -->
							<table class="table table-bordered">
								<colgroup>
									<col style="width:20%;"/>
									<col style="width:80%;"/>
								</colgroup>
								<tbody>
									<tr style="border-top: 0px;">
										<th>Title</th>
										<td>${dto.title }</td>
									</tr>
									<tr>
										<th>Writer</th>
										<td>${dto.writer }</td>
									</tr>
									<tr>
										<td colspan="2">
											<ul style="border-bottom: 1px #ddd solid;padding-bottom: 10px;">
												<li>
													<strong>Date</strong>
													<span>${dto.regdate }</span>
												</li>
												
											</ul>
											<div>
											 ${dto.content }
											</div>
										</td>
									</tr>
									
									
								</tbody>
							</table>
							<div>
								<a  href="${pageContext.request.contextPath }/community/q_list.do"><button style="margin:10px;">목록</button></a>
							</div>
						<!-- /detail -->
					</div>
				</div>
			</div>
			<!-- /com_comtent -->
		</div>
	</div>

	<script>
		
	</script>
</body>
</html>