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
	<h3 style="margin-left: 50px;">게시글 작성 테스트 페이지</h3>
	<div class="container">
		<form action="/board/update" method="post">
			<div class="form-group">
				<input type="hidden" id="bnum" name="bnum" value="${vo.bnum}">
			</div>
			<div class="form-group">
				<label for="title">제목</label>
				<input
					type="text" class="form-control" id="title" name="title"
					aria-describedby="title" placeholder="Enter title" value="${vo.title}"><br/>
			</div>
			<div class="form-group">
				<input type="hidden" id="writer" name="writer" value="${vo.writer}">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea style="width: 100%" rows="15" name="content" id="content">${vo.content}</textarea> <!-- 가로 조절하려면 cols="60"으로 고정밖에 안되는듯 -->
			</div>
			<div class="form-group">
				<input type="submit" onclick="submitContents()" class="btn btn-primary" value="Submit" style="float: right;">
			</div>
		</form>
	</div>
</div>

<!-- Smart Editor -->
<script type="text/javascript">
 
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});
 
//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
  
    try {
        elClickedObj.form.submit();
    } catch(e) {
     
    }
}
 
// textArea에 이미지 첨부
function pasteHTML(filepath){
    var sHTML = '<img src="/upload/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}
 
</script>
</body>
</html>