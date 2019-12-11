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
<style type="text/css">
	#id_check{
		color: red;
	}
</style>
</head>
<body>
<div class="container-fluid">
	<%@include file="mainHeader.jsp" %>
	<h3 style="margin-left: 50px;">New member insert test</h3>
	<div class="container">
		<form action="/insert" method="post">
			<div class="form-group">
				<label for="id">id</label>
				<input
					type="text" class="form-control" id="id" name="id"
					aria-describedby="id" placeholder="Enter id" oninput="checkId()" required="required"> <small
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
					aria-describedby="name" placeholder="Enter name" required="required"> <small
					id="name" class="form-text text-muted">Enter your name.</small>
			</div>
			<div class="form-group">
				<label for="num">number</label>
				<input
					type="text" class="form-control" id="num" name="num"
					aria-describedby="num" placeholder="Enter phone number" required="required"> <small
					id="num" class="form-text text-muted">Enter your phone number without hipen(-).</small>
			</div>
			<input id="reg_submit" type="submit" class="btn btn-primary" value="Submit">
		</form>
	</div>
</div>

<script>
$("#reg_submit").prop("disabled", true);
function checkId() {
    var inputed = $('#id').val();
    var idCheck=0;
    
    $.ajax({
        data : {
            id : inputed
        },
        url : "/checkId",
        success : function(data) {
            if(inputed=="") {
                $("#reg_submit").prop("disabled", true);
                $("#id_check").text("아이디를 입력해주세요.");
                idCheck = 0;
            } else if (data == '0') {
                idCheck = 1;
                $("#reg_submit").prop("disabled", false);
                $("#reg_submit").css("background-color", "#4CAF50");
                $("#id_check").text("사용 가능한 아이디입니다.");
            } else if (data == '1') {
                $("#reg_submit").prop("disabled", true);
                $("#reg_submit").css("background-color", "#aaaaaa");
                $("#id_check").text("입력하신 아이디가 이미 존재합니다.");
                idCheck = 0;
            } 
        }
    });
}
</script>
</body>
</html>