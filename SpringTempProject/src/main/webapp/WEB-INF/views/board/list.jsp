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
	<%@include file="../mainHeader.jsp" %>
	<div class="container">
		<h4>test board list</h4>
		<!-- search -->
		<form action="/board/list" method="get">
			<div class="input-group">
				<span class="input-group-addon">
					<select id="searchSel" name="searchType">
							<option disabled>검색 기준</option>
							<option value="title" selected="selected">제목</option>
							<option value="writer">작성자</option>
					</select>
				</span>
				
				<span class="input-group-text">
					<input type="text" class="form-control from-control-sm" id="keyword" style="width: 400px;" name="keyword" placeholder="검색어가 없을 경우 전체 게시글을 조회합니다.">
				</span>
		
				<span class="input-group-append">
					<input type="submit" class="btn btn-primary" value="Submit">
				</span>
			</div>
		</form>
		
		<table class="table">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${vo.list}" var="vo" varStatus="stat">
					<tr>
						<th scope="row">${stat.count}</th>
						<td style="width: 550px;"><a href="/board/read?bnum=${vo.bnum}">${vo.title}</a></td>
						<td style="width: 100px;">${vo.writer}</td>
						<td>${vo.readcnt}</td>
						<td>${vo.writedate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- paging -->
		<div class="container row text-center" style="text-align: center;">
			<ul class="pagination">
				<c:if test="${vo.curPage>1}">
					<li>
						<a href="/board/list?curPage=${vo.curPage-1}&perPage=${vo.perPage}&searchType=${vo.searchType}&keyword=${vo.keyword}">&laquo;</a>
					</li>
				</c:if>
				<!-- 주소창에서 perPage값을 조절하면서 확인할것 -->
		
				<c:forEach begin="${vo.bpn}" end="${vo.spn}" var="idx">
					<li class="${vo.curPage == idx?'active':''}"><a
						href="/board/list?curPage=${idx}&perPage=${vo.perPage}&searchType=${vo.searchType}&keyword=${vo.keyword}">${idx}</a></li>
					<!-- li에 클래스를 active로 주면 현재 페이지에 색이 들어간다 -->
				</c:forEach>
		
				<c:if test="${vo.curPage<vo.totalPage}">
					<li><a
						href="/board/list?curPage=${vo.curPage+1}&perPage=${vo.perPage}&searchType=${vo.searchType}&keyword=${vo.keyword}">&raquo;</a></li>
				</c:if>
			</ul>
			
			<c:if test="${not empty login}">
				<a id="createbtn" href="/board/insertUI" class="btn btn-success" style="float: right;">create</a>
			</c:if>
		</div>
	</div>
</div>
</body>
</html>