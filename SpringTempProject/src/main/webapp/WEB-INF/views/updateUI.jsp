<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
	<%@include file="mainHeader.jsp" %>
	<h3 style="margin-left: 50px;">New member insert test</h3>
	<div class="container">
		<form action="/update" method="post">
			<div class="form-group">
				<label for="id">id</label>
				<input readonly="readonly"
					type="text" class="form-control" id="id" name="id"
					value="${vo.id}">
			</div>
			<div class="form-group">
				<label for="pw">password</label> <input required="required"
					type="password" class="form-control" id="pw" name="pw">
			</div>
			<div class="form-group">
				<label for="name">name</label>
				<input
					type="text" class="form-control" id="name" name="name"
					aria-describedby="name" value="${vo.name}" placeholder="Enter name"> <small
					id="name" class="form-text text-muted">Enter your name.</small>
			</div>
			<div class="form-group">
				<label for="num">number</label>
				<input
					type="text" class="form-control" id="num" name="num"
					aria-describedby="num" value="${vo.num}" placeholder="Enter phone number"> <small
					id="num" class="form-text text-muted">Enter your phone number without hipen(-).</small>
			</div>
			<input type="submit" class="btn btn-primary" value="Update">
		</form>
	</div>
</div>
</body>
</html>