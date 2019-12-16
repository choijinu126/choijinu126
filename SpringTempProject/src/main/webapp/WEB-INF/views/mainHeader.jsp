<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<h2 style="margin-left: 50px;"><a href="/board/list" style="color: black; text-decoration: none;">CRUD test page</a></h2>
	
	<div class="container">
		<a href="/board/list" type="button" class="btn btn-warning col-xs-1">게시판</a>
		<a href="/main" type="button" class="btn btn-warning col-xs-1" style="margin-left: 5px">회원목록</a>
		
		<c:choose>
			<c:when test="${empty login}">
				<a href="/loginCheck" class="btn btn-info" style="float: right;">Login</a>
			</c:when>
			<c:otherwise>
				<a href="/logout" class="btn btn-info" style="float: right;">Logout</a>
				<p style="float: right; position: relative; top: 8px;">안녕하세요, ${login.name}님! &nbsp&nbsp&nbsp</p>
			</c:otherwise>
		</c:choose>
	</div>
<hr/>