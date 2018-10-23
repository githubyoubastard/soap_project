<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row">
	<button class="btn btn-default" id="goBackBtn" style="margin-left: 15px;">뒤로</button>
</div>
<script>
	$("#goBackBtn").click(function(){
		history.back();
	})
</script>
