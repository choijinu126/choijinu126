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
<style type="text/css">
.media-body {
	display: inline;
}
</style>
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
			<a id="deletebtn" href="/board/delete?bnum=${vo.bnum}" class="btn btn-danger" style="float: right;" onclick="return Confirm('삭제하시겠습니까?');">delete</a>
			<a id="updatebtn" href="/board/updateUI?bnum=${vo.bnum}" class="btn btn-success" style="float: right; margin-right: 10px">update</a>
		</c:if>
		<a id="listbtn" href="/board/list" class="btn btn-primary" style="float: right; margin-right: 10px">list</a>
	</div>
	
	<div class="container reply">
		<hr/>
		<h5>댓글 테스트</h5>
		
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
								<button class="btn btn-default" type="submit" onclick="alert('등록되었습니다.')">Reply</button>
							</span>
						</div>
					</div>
				</div>
			</form>
		</div>
		
		<div class="container replyList" style="margin-top: 15px;">
			<c:choose>
				<c:when test="${not empty reply.list}">
					<c:forEach items="${reply.list}" var="vo" varStatus="stat">
						<div class="media-body">
							<div class="well well-lg">
								<h4 class="text-uppercase" style="float: left; display: inline-block;">${vo.writer}</h4>
								<p style="float: right; display: inline-block; margin-top: -10px;">${vo.writedate}<br/>
								<a href="/board/replyUpdateUI?rnum=${vo.rnum}" class="btn btn-info" style="float: right; display: inline-block; margin-top: 5px; margin-left: 5px;" 
								onclick="window.open(this.href, '팝업창', 'width=800, height=130'); return false;">수정/삭제</a>
								</p>
								<p style="display: inline-block;width: 80%;margin-left: 20px;margin-top: 10px; word-break: break-all;">${vo.content}</p>
							</div>
						</div>
					</c:forEach>
					
					<%-- <table class="table table-sm">
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
									<td>
										<c:choose>
											<c:when test="${vo.writer eq login.id}">
												<a href="/board/replyUpdateUI?rnum=${vo.rnum}" onclick="window.open(this.href, '팝업창', 'width=800, height=130'); return false;">${vo.content}</a>
											</c:when>
											<c:otherwise>
												${vo.content}
											</c:otherwise>
										</c:choose>
									</td>
									<td>${vo.writedate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table> --%>
					
					<!-- paging -->
					<div class="container row text-center" style="text-align: center;">
						<ul class="pagination">
							<c:if test="${reply.curPage>1}">
								<li>
									<a href="/board/read?bnum=${reply.list[0].bnum}&curPage=${reply.curPage-1}&perPage=${reply.perPage}&searchType=${reply.searchType}&keyword=${reply.keyword}">&laquo;</a>
								</li>
							</c:if>
							<!-- 주소창에서 perPage값을 조절하면서 확인할것 -->
					
							<c:forEach begin="${reply.bpn}" end="${reply.spn}" var="idx">
								<li class="${reply.curPage == idx?'active':''}"><a
									href="/board/read?bnum=${reply.list[0].bnum}&curPage=${idx}&perPage=${reply.perPage}&searchType=${repky.searchType}&keyword=${reply.keyword}">${idx}</a></li>
								<!-- li에 클래스를 active로 주면 현재 페이지에 색이 들어간다 -->
							</c:forEach>
					
							<c:if test="${reply.curPage<reply.totalPage}">
								<li><a
									href="/board/read?bnum=${reply.list[0].bnum}&curPage=${reply.curPage+1}&perPage=${reply.perPage}&searchType=${reply.searchType}&keyword=${reply.keyword}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</div>
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