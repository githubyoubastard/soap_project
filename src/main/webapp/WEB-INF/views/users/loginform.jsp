<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/loginform.do</title>
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
   width:100%;
   padding-top:20px;
   padding-left:1%;
   padding-bottom:20px;
   margin-bttom:15%;
   font-size: 4rem;
   border-bottom: 1px solid #000;

}
.card-container.card {
    max-width: 35%;
    padding: 40px 40px;
   
}
.card-container.card h1{
   text-align:center;
   padding-bottom:30px;
}

.btn {
    font-weight: 700;
    height: 36px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    cursor: default;
}

/*
 * Card component
 */
.card {
    background-color: #F7F7F7;
    /* just in case there no content*/
    padding: 20px 25px 30px;
    margin: 0 auto 25px;
    margin-top: 50px;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

/*
 * Form styles
 */
.profile-name-card {
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    margin: 10px 0 0;
    min-height: 1em;
}

.form-signin #id,
.form-signin #pwd {
    direction: ltr;
    height: 44px;
    font-size: 16px;
}
.form-signin input[type=id],
.form-signin input[type=password],
.form-signin input[type=text],
.form-signin button {
    width: 100%;
    display: block;
    margin-bottom: 10px;
    z-index: 1;
    position: relative;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus {
    border-color: rgb(153, 213, 192);
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
}
.btn.btn-signin {
  
    background-color: rgb(153, 229, 192);
    padding: 10px;
    margin-bottom:10px;
    font-weight: 700;
    font-size: 14px;
    height: 36px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    -o-transition: all 0.218s;
    -moz-transition: all 0.218s;
    -webkit-transition: all 0.218s;
    transition: all 0.218s;
}

.btn.btn-signin:hover,
.btn.btn-signin:active,
.btn.btn-signin:focus {
    background-color: rgb(148, 196, 197);
}

.forgot-password {
   font-size:1.5rem;
    color: rgb(68, 175, 185);
}

.forgot-password:hover,
.forgot-password:active,
.forgot-password:focus{
    color: rgb(104, 145, 162);
}
.Tfont{
   font-size:1.5rem;
}

#clickPwdView1{
   display: none;
}

.pwd_div{
   height: 50px;
}

.pwd_div>i{
   position: relative;
   z-index: 1;
    left: 410px;
    bottom: 42px;
    font-size: 20px;
    cursor: pointer;
}

#joinBtn{
   cursor: pointer;
}

.message{
   margin-bottom: 20px;
}
</style>

</head>
<body>
<jsp:include page="../index/header.jsp"/>

<div class="one">

   <div id="member">
      <p class="heading">Login</p>
   </div>
   <div class="card card-container">
       <h1>Welcome Back!</h1>
          <form action="${pageContext.request.contextPath }/users/login.do" method="post" class="form-signin" id="loginForm">
            <input type="text" name="id" id="id" placeholder="Id" maxlength="15" autofocus/>
            <div class="pwd_div">
                 <input type="password" placeholder="Password" name="pwd" id="pwd" maxlength="16">
                 <i class="far fa-eye" id="clickPwdView1"></i>
               <i class="far fa-eye-slash" id="clickPwdView2"></i>
             </div>
            <div class="message">
               <c:if test="${not empty isSuccess }">
                  <p style="color: red; font-size: 1.3rem">${msg }</p>
               </c:if>
            </div>
               <div id="remember" class="checkbox">
                  <label>
                   <input type="checkbox" name="isRemember"> <span class="Tfont">Remember me</span>
                </label>
             </div>      
             <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Log in</button>
   
      </form><!-- /form -->
      <p><span class="Tfont">아직 가입하지 않으셨어요?</span></p>
      
      <button id="joinBtn" class="btn btn-lg btn-primary btn-block btn-signin" style="color: white;">Sign up</button>
      
       <a href="#" class="forgot-password">
           Forgot the password?
       </a>
   </div><!-- /card-container -->
</div><!-- /one -->

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js" /></script>
<script>

   $("#clickPwdView1").on("click", function(){
      $(this).css("display","none");
      $("#clickPwdView2").css("display", "block");
      $("#pwd").attr("type","password");
   });
   $("#clickPwdView2").on("click", function(){
      $(this).css("display","none")
      $("#pwd").attr("type","text");
      $("#clickPwdView1").css("display", "block");
   });
   $("#joinBtn").click(function(){
      location.href="${pageContext.request.contextPath }/users/insertform.do";
   })
</script>
</body>
</html>