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
<div class="container">
	<h3>Reply update test</h3>
	<hr/>
	<div class="row">
		<div class="col-xs-12">
			<div class="input-group">
				<span class="input-group-addon">@ &nbsp ${login.id}</span>
				<input type="text" class="form-control content" value="${vo.content}" name="content">
				<input type="hidden" name="rnum" value="${vo.rnum}">
				<input type="hidden" name="bnum" value="${vo.bnum}">
				<input type="hidden" name="writer" value="${login.id}">
				<span class="input-group-btn">
					<button class="btn btn-default submitBtn">Update</button>
					<button class="btn btn-danger deleteBtn" onclick="replyDelete('${vo.rnum}')">Delete</button>
				</span>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$(".submitBtn").on("click", function(){
		var content = $(".content").val();
		var rnum = ${vo.rnum};

		$.ajax({
			type: 'post',
			url: '/board/replyUpdate',
			data: {
				content: content,
				rnum: rnum
			},
			success: function(data){
				alert("수정이 완료되었습니다.");
			},
			error: function(error){
				alert("오류가 발생했습니다. 관리자의 수정이 필요합니다.");
			},
			complete: function(complete){
				window.opener.location.reload();
				self.close();
			}
		});
	});

	$(".deleteBtn").on("click", function(){
		var rnum = ${vo.rnum};
		$.ajax({
			type: 'get',
			url: '/board/replyDelete',
			data: {
				rnum: rnum
			},
			success: function(data){
				alert("삭제가 완료되었습니다.");
			},
			error: function(error){
				alert("오류가 발생했습니다. 관리자의 수정이 필요합니다.");
			},
			complete: function(complete){
				window.opener.location.reload();
				self.close();
			}
		});
	});
});
</script>
</body>
</html>