<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#pd_left_zero{
		padding-left: 0;
	}
</style>
<div class="col-lg-3" id="pd_left_zero">
   <div class="list-group">
      <h1 class="my-4 list-group-text">커뮤니티</h1>
      <a href="${pageContext.request.contextPath }/community/list.do" class="list-group-item">최신글</a>
      <a href="${pageContext.request.contextPath }/community/list.do?cate=1" class="list-group-item">후기</a>
      <a href="${pageContext.request.contextPath }/community/list.do?cate=0" class="list-group-item">수다하기</a>
  </div>
 </div>

