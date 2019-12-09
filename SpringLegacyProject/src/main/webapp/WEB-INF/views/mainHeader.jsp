<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<h2 style="margin-left: 50px;"><a href="/main" style="color: black; text-decoration: none;">CRUD test main  page</a></h2>
	
	<div class="container">
		<a href="#" type="button" class="btn btn-success col-xs-1">게시판</a>
		<button type="button" class="btn btn-secondary col-xs-1" style="margin-left: 5px">menu2</button>
		
		<c:choose>
			<c:when test="${empty login}">
				<a href="/loginCheck" class="btn btn-info" style="float: right;">Login</a>
			</c:when>
			<c:otherwise>
				<a href="/logout" class="btn btn-info" style="float: right;">Logout</a>
			</c:otherwise>
		</c:choose>
	</div>
<hr/>