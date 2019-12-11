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
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
</head>
<body>
<div class="container-fluid">
	<%@include file="../mainHeader.jsp" %>
	<h3 style="margin-left: 50px; margin-bottom: 25px;">게시글 상세 테스트 페이지</h3>
	<div class="container">
		<form action="/board/insert" method="post">
			<div class="form-group">
				<label for="title">제목</label>
				<input
					type="text" class="form-control" id="title" name="title"
					aria-describedby="title" value="${vo.title}" readonly="readonly"><br/>
			</div>
			
			<div class="form-group row" style="margin-bottom: 25px;">
				<label for="writer" class="col-sm-1 col-form-label" style="margin-top: 5px;">작성자: </label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="writer" value="${vo.writer}" readonly="readonly">
				</div>
			
				<label for="readcnt" class="col-sm-1 col-form-label" style="margin-left: 10%; margin-top: 5px;">조회수: </label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="readcnt" value="${vo.readcnt}" readonly="readonly">
				</div>
			</div>
			
			<div class="form-group">
				<label for="content">내용</label>
				<div id="content" style="overflow: scroll; width: 100%; height: 300px; border: 1px solid grey; border-radius: 10px; padding: 10px;">${vo.content}</div> <!-- 가로 조절하려면 cols="60"으로 고정밖에 안되는듯 -->
			</div>
		</form>
		
		<c:if test="${login.id eq vo.writer}">
			<a id="deletebtn" href="/board/delete?bnum=${vo.bnum}" class="btn btn-danger" style="float: right;" onclick="confirm('삭제하시겠습니까?')">delete</a>
			<a id="updatebtn" href="/board/updateUI?bnum=${vo.bnum}" class="btn btn-success" style="float: right; margin-right: 10px">update</a>
		</c:if>
		<a id="listbtn" href="/board/list" class="btn btn-primary" style="float: right; margin-right: 10px">list</a>
	</div>
	
	<div class="container replyInsert" style="margin-top: 15px;">
		<form action="/board/replyInsert" method="post">
			<div class="row">
				<div class="col-xs-12">
					<div class="input-group">
						<span class="input-group-addon">@ &nbsp ${login.id}</span>
						<input type="text" class="form-control" placeholder="Reply content..." name="content">
						<input type="hidden" name="bnum" value="${vo.bnum}">
						<input type="hidden" name="writer" value="${login.id}">
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit">Reply</button>
						</span>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div class="container replyList" style="margin-top: 15px;">
		<c:choose>
			<c:when test="${not empty reply}">
				<table class="table table-sm">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">작성자</th>
							<th scope="col" style="width: 50%">내용</th>
							<th scope="col" style="width: 20%">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reply.list}" var="vo" varStatus="stat">
							<tr>
								<th scope="row">${stat.count}</th>
								<td>${vo.writer}</td>
								<td>${vo.content}</td>
								<td>${vo.writedate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				
			</c:otherwise>
		</c:choose>
	</div>
</div>
</body>
</html>