<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/insertform.jsp</title>
<jsp:include page="../index/loading.jsp"/>
   <style>
      .form-control{height: 40px;border-radius: 0px;}
      .btn{height: 40px;font-size:20px;border-radius: 0px;background-color:#129bdb;}
      .btn:hover{opacity:0.9;}
   </style>
</head>
<body ng-app="soap">
<div class="container">
   <form action="${pageContext.request.contextPath }/users/insert.do" method="post" ng-controller="insertformCtrl" name="insertForm" id="joinForm" novalidate>
      <div class="row">
         <div class="col-sm-8 col-sm-push-2 form-group has-feedback"
             ng-class="{'has-success':insertForm.id.$valid && canUseId, 'has-error': (insertForm.id.$invalid || !canUseId) && insertForm.id.$dirty }">
            <label for="id" class="control-label">아이디</label>
            <input type="text" name="id" class="form-control" ng-model="id" ng-required="true" ng-minlength="5" ng-maxlength="15" ng-pattern="/^[a-zA-z][a-zA-Z0-9]*$/" ng-change="checkId()"/>   
            <p class="help-block" ng-show="insertForm.id.$valid && insertForm.id.$dirty">{{idMsg}}</p>
            <p class="help-block" ng-show="insertForm.id.$error.pattern">아이디에 특수문자는 허용하지 않으며, 첫 문자는 영문자만 허용합니다.</p>
            <p class="help-block" ng-show="(insertForm.id.$error.minlength || insertForm.id.$error.maxlength) && insertForm.id.$dirty">5 글자 이상 15 글자 이하로 입력하세요</p>
         </div>
      </div>
      <br />
      <div class="row">
         <div class="col-sm-8 col-sm-push-2 form-group has-feedback"
             ng-class="{'has-success':insertForm.name.$valid, 'has-error': insertForm.name.$invalid && insertForm.name.$dirty }">
            <label for="name" class="control-label">이름</label>
            <input type="text" name="name" class="form-control" ng-model="name" ng-required="true" ng-pattern="/^[가-힣]+$/"/>   
            <p class="help-block" ng-show="insertForm.name.$error.pattern">이름은 한글만 입력해주세요.</p>
            <p class="help-block" ng-show="insertForm.name.$dirty && insertForm.name.$invalid">이름은 필수값입니다.</p>
         </div>
      </div>
      <br />
      <div class="row">
         <div class="col-sm-8 col-sm-push-2 form-group has-feedback"
             ng-class="{'has-success':insertForm.pwd.$valid, 'has-error': insertForm.pwd.$invalid && insertForm.pwd.$dirty }">
            <label for="pwd" class="control-label">비밀번호</label>
            <input type="password" name="pwd" id="pwd" class="form-control" ng-model="pwd" ng-pattern="/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,16}$/" ng-required="true"/>
         </div>
      
         <div class="col-sm-8 col-sm-push-2">
            <p class="help-block" ng-show="insertForm.pwd.$error.pattern">비밀번호를 10자리 이상 16자리 이하로 영문자, 숫자, 특수문자를 혼합하여 입력하세요.</p>
            <p class="help-block" ng-show="!pwdSame && insertForm.pwd2.$dirty ">아래와 동일한지 비밀번호를 확인하세요</p>
         </div>
      </div>
      <br />
      <div class="row">
         <div class="col-sm-8 col-sm-push-2 form-group has-feedback"
             ng-class="{'has-success':insertForm.pwd2.$valid && pwdSame, 'has-error': (insertForm.pwd2.$invalid || !pwdSame) && insertForm.pwd2.$dirty }">
            <label for="pwd2" class="control-label">비밀번호 재확인</label>
            <input type="password" name="pwd2" id="pwd2" class="form-control" ng-model="pwd2" ng-change=checkPwd() ng-required="true"/>   
         </div>
      </div>
      <br />
      <div class="row">
         <div class="col-sm-8 col-sm-push-2 form-group has-feedback"
              ng-class="{'has-success':insertForm.email.$valid , 'has-error': insertForm.email.$invalid && insertForm.email.$dirty }">
            <label for="email" class="control-label">이메일</label>
            <input type="text" name="email" id="email" class="form-control" ng-model="email" ng-required="true" ng-pattern="/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/" ng-required="true"/>      
         </div>   
         <div class="col-sm-8 col-sm-push-2">
            <p class="help-block" ng-show="insertForm.email.$invalid && insertForm.email.$dirty">이메일은 필수값입니다.</p>
            <p class="help-block" ng-show="insertForm.email.$error.pattern">이메일 양식에 맞게 작성해주세요</p>
         </div>
      </div>
      <br />
      <div class="row">
         <div class="col-sm-8 col-sm-push-2 form-group has-feedback"
             ng-class="{'has-success':insertForm.phone.$valid , 'has-error': insertForm.phone.$invalid && insertForm.phone.$dirty }">
            <label for="phone">핸드폰 번호</label>
            <input type="text" name="phone" id="phone" class="form-control" ng-model="phone" ng-required="true"/>
            <p class="help-block" ng-show="insertForm.phone.$invalid && insertForm.phone.$dirty">핸드폰은 필수값입니다.</p>                  
         </div>
      </div>
      <br />
      <div class="row">
         <div class="col-sm-8 col-sm-push-2 form-group has-feedback"
               ng-class="{'has-success':insertForm.addr.$valid , 'has-error': insertForm.addr.$invalid && insertForm.addr.$dirty }">
            <label for="addr">주소</label>
            <input type="text" name="addr" id="addr" class="form-control" ng-model="addr" ng-required="true"/>   
            <p class="help-block" ng-show="insertForm.addr.$invalid && insertForm.addr.$dirty">주소는 필수값입니다.</p>
         </div>
      </div>
      <br />
      <div class="row">
         <div class="col-sm-8 col-sm-push-2" style="padding-bottom:30px;">
            <button type="submit" class="btn btn-block" style="color:#fff;" ng-disabled="insertForm.$invalid">회원가입</button>
         </div>
      </div>
   </form>
</div>   
<script src="${pageContext.request.contextPath }/resources/js/angular.js" /></script>
<script>
   
   $(".form-control").on("mouseover", function(){
      $(this).css("border","2px solid #129bdb")
   });
   $(".form-control").on("mouseout", function(){
      $(this).css("border","2px solid #cecece")
   });

   var app=angular.module("soap",[]);
   app.controller("insertformCtrl",function($scope, $http){
      $scope.pwdSame=false;
      // 비밀번호와 비밀번호 확인란을 같게 입력했는지 확인
      $scope.checkPwd=function(){
         var pwd=$scope.pwd;
         var pwd2=$scope.pwd2;
         
         if(pwd == pwd2){
            $scope.pwdSame=true;
         } else{
            $scope.pwdSame=false;
         }
      }
   
      $scope.canUseId=false;
      // id input 란에 입력 이벤트가 발생할 경우 실행할 함수
      
      // 아이디 정규식 
      var idReg1=/^[a-zA-Z0-9]+$/;
      var idReg2=/^[a-zA-z]/;
      $scope.checkId=function(){
         // 아이디 valid 체크
         $http({
            method:"post",
            url:"${pageContext.request.contextPath}/users/checkid.do",
            data:"inputId="+$scope.id,
            headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
         }).success(function(data){
            if(data.canUse){
               $scope.idMsg="사용 가능한 아이디입니다.";
               $scope.canUseId=true;
            } else{
               $scope.idMsg="사용 불가능한 아이디입니다.";
               $scope.canUseId=false;
            }
         })
      }
      
      $("#joinForm").submit(function(){
         alert($scope.id+"님 회원가입에 감사드립니다:)");
      })
   });
</script>
</body>
</html>