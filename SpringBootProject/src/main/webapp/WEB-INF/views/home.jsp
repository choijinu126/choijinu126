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
<div class='container-fluid'>
	<h2>CRUD test main page using String Boot</h2>
	<button type="button" class="btn btn-secondary col-xs-1 col-xs-push-1">menu1</button>
	<button type="button" class="btn btn-secondary col-xs-1 col-xs-push-1" style="margin-left: 5px">menu2</button>
</div>

<div class='container'>
	<h4>test table</h4>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">id</th>
				<th scope="col">name</th>
				<th scope="col">number</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="vo" varStatus="stat">
				<tr>
					<th scope="row">${stat.count}</th>
					<td><a href="/read?id=${vo.id}">${vo.id}</a></td>
					<td>${vo.name}</td>
					<td>${vo.num}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<a id="createbtn" href="/insertUI" class="btn btn-success" style="float: right;">create</a>
</div>

</body>
</html>