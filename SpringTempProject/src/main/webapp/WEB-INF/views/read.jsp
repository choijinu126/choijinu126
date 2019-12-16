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
	<h3 style="margin-left: 50px;">read test page</h3>
	<div class="container">
			<div class="form-group">
				<label for="id">id</label>
				<input readonly="readonly"
					type="text" class="form-control" id="id" name="id"
					value="${vo.id}"> 
			</div>
			<div class="form-group">
				<label for="name">name</label>
				<input readonly="readonly"
					type="text" class="form-control" id="name" name="name"
					value="${vo.name}">
			</div>
			<div class="form-group">
				<label for="num">number</label>
				<input readonly="readonly"
					type="text" class="form-control" id="num" name="num"
					value="${vo.num}">
			</div>
			<a id="deletebtn" href="/delete?id=${vo.id}" class="btn btn-danger" style="float: right;" onclick="return Confirm('삭제하시겠습니까?');">delete</a>
			<a id="updatebtn" href="/updateUI?id=${vo.id}" class="btn btn-success" style="float: right; margin-right: 10px">update</a>
			<a id="listbtn" href="/main" class="btn btn-primary" style="float: right; margin-right: 10px">list</a>
	</div>
</div>

<script type="text/javascript">
	function Confirm(msg) {
		var result = confirm(msg);
		if(result){
			$(this).parent().click()
		}else{
			return false;
		}
	}
</script>
</body>
</html>