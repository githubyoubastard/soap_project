<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 사이드 네비   -->
<div id="side_nav">
	
	<div id="nav_out">
		<div class="nav_text">
			<ul>
				<li><a href="${pageContext.request.contextPath}/about.do"><b>About</b></a></li>
				<li><a href="${pageContext.request.contextPath}/product/list.do"><b>Shop</b></a></li>
        		<li><a href="${pageContext.request.contextPath}/community/q_list.do"><b>Community</b></a></li>
       			<li><a href="lookbook.do"><b>Lookbook</b></a></li>
			</ul>
		</div>
	</div>

	<div id="nav_in">
		<div id="nav_btn">
			<div class="logo-container" style="position:absolute;width: 100%;text-align: center;top: 20px;">
				<img id="logoImg" src="${pageContext.request.contextPath}/resources/images/soapsoap_logo.png"
					 style="width: 50px; cursor:pointer;"/>
				<script>
					$("#logoImg").click(function(){
						location.href="${pageContext.request.contextPath}/";
					})
				</script>
			</div>
			<div class="menu-container">
			  <div class="menu"></div>
			</div>
		</div>
		<div id="nav_users">
			<!-- 로그인 한 상태이면 -->
			<c:choose>	
				<c:when test="${not empty id || admin}">
					<a href="${pageContext.request.contextPath}/users/logout.do"><i class="fas fa-sign-out-alt"></i></a><br />
					<c:if test="${!admin }">
						<a href="${pageContext.request.contextPath}/users/info.do"><i class="fas fa-user"></i></a>
					</c:if>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/users/loginform.do"><i class="fas fa-sign-in-alt"></i></a>
				</c:otherwise>
			</c:choose>
		<!-- 	<img class="nav_icon_size"  src="images/icon_logout.png" alt="로그아웃"> -->
			<c:if test="${admin }">
				<a href="${pageContext.request.contextPath}/admin/index.do"><i class="fas fa-unlock-alt"></i></a><br />
			</c:if>
		</div>
	</div>

</div>

<div class="backdrop"></div>
<script>

   var nav_open = false;
   
   $(".backdrop").on("click",function(){
      
      nav_open = true;
      if(nav_open==true){ // 메뉴 열려있을때  닫기 누르면 
      
       $("#nav_out").animate({
           // 숫자로 표현할수 있는 것들 만 적용 가능~
           left:"-220px"
         }, 600);
       $(".backdrop").fadeOut(500);
      }
      
      $(".menu").trigger("click");  

   });
   
</script>
	