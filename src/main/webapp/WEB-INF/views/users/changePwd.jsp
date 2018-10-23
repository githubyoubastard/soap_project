<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../index/loading.jsp"/>
<style>
	.form-control{height: 40px;border-radius: 0px;}
	.btn{}
	.btn:hover{opacity:0.9;}
	.help-block{display:none;margin-left:20px;padding-left: 75px;}
</style>
</head>
<body>
<jsp:include page="../index/header.jsp"/>
<div class="container">
					<div class="wrapper" style="margin-top: -100px;margin-bottom: 100px;">
						<div class="changePwd_viewPage_header">
							<div class="row">
								<div class="col-sm-5 col-sm-push-3" style="text-align: center;margin-top: 15%;">
									<img src="${pageContext.request.contextPath }/resources/images/login_img_passwordreissue.png" alt="" style="padding-bottom: 20px;"/>
								</div>
							</div>
						</div>
						<div class="changePwd_viewPage_body">
							<form action="resetPwd.do" method="post" class="form-group" id="myForm">
								<div class="row">
									<div class="col-sm-5 col-sm-push-3">
										<label for="currentPwd"></label>
										<input type="password" name="currentPwd" id="currentPwd" class="form-control" maxlength="16" placeholder="현재 비밀번호"/>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="col-sm-5 col-sm-push-3">
										<label for="resetPassword"></label>
										<input type="password" name="resetPassword" id="resetPassword" class="form-control" maxlength="16" placeholder="새 비밀번호"/>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-8 col-sm-push-2">
										<p id="pwdError1" class="help-block">특수문자 한 개 이상, 비밀번호를 10자리 이상 16자리 이하로 입력하세요</p>
										<p id="pwdError2" class="help-block">아래와 동일한지 비밀번호를 확인하세요</p>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="col-sm-5 col-sm-push-3">
										<label for="reconfirmPwd"></label>
										<input type="password" name="reconfirmPwd" id="reconfirmPwd" class="form-control" maxlength="16" placeholder="비밀번호 확인"/>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="col-sm-5 col-sm-push-3">
										<button type="submit" class="btn btn-block" style="background-color: #129bdb;color:#fff;margin-top:20px;height: 40px;font-size:20px;border-radius: 0px;">변경</button>
									</div>
								</div>
							</form>
							<br />
							<div class="changePwd_viewPage_footer">
								<div class="row">
									<div class="col-sm-5  col-sm-push-3" style="text-align: center;color:#999;font-size:10px;">
										<span id="copyright">Copyright © Holamarket Inc. All Rights Reserved.</span>
									</div>
								</div>
							</div>
						</div>	
					</div><!-- wrapper -->
</div><!-- container -->
<jsp:include page="../index/footer.jsp"/>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js" /></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script>
	/* 비밀번호 숫자와 영문자 특수문자 조합으로 10~16자리 */
	var pwdReg=/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}/;
/* 비밀번호 정규식  */
$("#resetPassword, #reconfirmPwd").on("input", function(){
	var inputPwd1=$("#resetPassword").val();
	var inputPwd2=$("#reconfirmPwd").val();
	var isPwdEqual= inputPwd1 == inputPwd2;
	var result=pwdReg.test(inputPwd1);
	pwdValid=true;
	$("#pwdError1, #pwdError2").hide();
	if(!isPwdEqual){
		$("#pwdError2").show();
		pwdValid=false;
	}
	if(!result){
		$("#pwdError1").show();
		pwdValid=false;
	}
});


	var resetpwd=$("#resetPassword").val();
	var reconfirmPwd=$("#reconfirmPwd").val();
	
	$(".form-control").on("mouseover", function(){
		$(this).css("border","2px solid #129bdb")
	});
	$(".form-control").on("mouseout", function(){
		$(this).css("border","2px solid #cecece")
	});
	
	$("#myForm").on("submit",function(){
		if(resetpwd != reconfirmPwd){
			return false;
		}
	});
</script>
</body>
</html>