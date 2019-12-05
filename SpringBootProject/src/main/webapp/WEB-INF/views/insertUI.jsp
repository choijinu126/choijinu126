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
	<h3>New member insert test in Spring Boot</h3>
	<div class="container">
		<form action="/insert" method="post">
			<div class="form-group">
				<label for="id">id</label>
				<input
					type="text" class="form-control" id="id" name="id"
					aria-describedby="id" placeholder="Enter id" oninput="checkId()"> <small
					class="form-text text-muted">Enter your own id. We'll never share your id with anyone else.</small><br/>
					<small id="id_check"></small>
			</div>
			<div class="form-group">
				<label for="pw">password</label> <input required="required"
					type="password" class="form-control" id="pw" name="pw"
					placeholder="password">
			</div>
			<div class="form-group">
				<label for="name">name</label>
				<input
					type="text" class="form-control" id="name" name="name"
					aria-describedby="name" placeholder="Enter name"> <small
					id="name" class="form-text text-muted">Enter your name.</small>
			</div>
			<div class="form-group">
				<label for="num">number</label>
				<input
					type="text" class="form-control" id="num" name="num"
					aria-describedby="num" placeholder="Enter phone number"> <small
					id="num" class="form-text text-muted">Enter your phone number without hipen(-).</small>
			</div>
			<input id="reg_submit" type="submit" class="btn btn-primary" value="Submit">
		</form>
	</div>
</div>

</body>
</html>