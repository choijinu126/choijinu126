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
	<h2 style="margin-left: 50px;">CRUD test main  page</h2>
	
	<div class="container">
		<button type="button" class="btn btn-secondary col-xs-1">menu1</button>
		<button type="button" class="btn btn-secondary col-xs-1" style="margin-left: 5px">menu2</button>
		
		<c:choose>
			<c:when test="${empty login}">
				<a href="/loginUI" class="btn btn-info" style="float: right;">Login</a>
			</c:when>
			<c:otherwise>
				<a href="/logout" class="btn btn-info" style="float: right;">Logout</a>
			</c:otherwise>
		</c:choose>
	</div>
<hr/>

<!-- listing -->
<div class='container'>
	<h4>test table</h4>
	
	<!-- search -->
	<form action="/main" method="get">
		<div class="input-group">
			<span class="input-group-addon">
				<select id="searchSel" name="searchType">
						<option disabled>검색 기준</option>
						<option value="id" selected="selected">id</option>
						<option value="name">이름</option>
						<option value="num">번호</option>
				</select>
			</span>
			
			<span class="input-group-text">
				<input type="text" class="form-control from-control-sm" id="keyword" style="width: 400px;" name="keyword">
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
				<th scope="col">id</th>
				<th scope="col">name</th>
				<th scope="col">number</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${vo.list}" var="vo" varStatus="stat">
				<tr>
					<th scope="row">${stat.count}</th>
					<td><a href="/read?id=${vo.id}">${vo.id}</a></td>
					<td>${vo.name}</td>
					<td>${vo.num}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- paging -->
	<div class="container row text-center" style="text-align: center;">
		<ul class="pagination">
			<c:if test="${vo.curPage>1}">
				<li>
					<a href="/main?curPage=${vo.curPage-1}&perPage=${vo.perPage}&searchType=${vo.searchType}&keyword=${vo.keyword}">&laquo;</a>
				</li>
			</c:if>
			<!-- 주소창에서 perPage값을 조절하면서 확인할것 -->
	
			<c:forEach begin="${vo.bpn}" end="${vo.spn}" var="idx">
				<li class="${vo.curPage == idx?'active':''}"><a
					href="/main?curPage=${idx}&perPage=${vo.perPage}&searchType=${vo.searchType}&keyword=${vo.keyword}">${idx}</a></li>
				<!-- li에 클래스를 active로 주면 현재 페이지에 색이 들어간다 -->
			</c:forEach>
	
			<c:if test="${vo.curPage<vo.totalPage}">
				<li><a
					href="/main?curPage=${vo.curPage+1}&perPage=${vo.perPage}&searchType=${vo.searchType}&keyword=${vo.keyword}">&raquo;</a></li>
			</c:if>
		</ul>
		
		<a id="createbtn" href="/insertUI" class="btn btn-success" style="float: right;">create</a>
	</div>
</div>
</div>
</body>
</html>