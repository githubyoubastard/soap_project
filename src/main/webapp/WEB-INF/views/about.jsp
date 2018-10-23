<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>about.jsp</title>
<jsp:include page="./index/loading.jsp"/>
</head>
<body>
	<jsp:include page="./index/header.jsp" />

	<div style="z-index: 2;" id="contentWrap">
		<div id="contentTitle">
			<p class="heading">ABOUT</p>

		</div>
	</div>
	<div style="">
		<img style="width: 100%; position: absolute; left: 3%;"
			src="${pageContext.request.contextPath }/resources/images/about.png" />
		
	</div>
		
	

</body>
</html>