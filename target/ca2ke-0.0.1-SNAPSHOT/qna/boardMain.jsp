<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<link rel="stylesheet" href="../assets/css/common.css"/>
<link rel="stylesheet" href="../assets/css/index.css">
<style type="text/css">
	div#boardDisplay{
		background-color: f9f3ec;
		margin: 0 auto;
		width: 1200px;
		min-width: 800px;
		height: 1000px;
	}
</style>

<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		if(${boardDisplay == null}){
			location.href = '../main/noticeBoardList';			
		}
		
	}
</script>
</head>
<body>

	<div id="nav">
		<ul>
			<li><a href="noticeBoardList"><span class="nav01">
				<img src="../img/board/notice.png" alt="notice" style="width: 60px; height: 70px;" />
				<br>공지사항</span></a></li>
				
			<li><a href="faqBoardList"><span class="nav02">
				<img src="../img/board/qnawrite.png" alt="faq" style="width: 60px; height: 70px;" />
				<br>FAQ</span></a></li>
				
			<li><a href="qnalist"><span class="nav03">
				<img src="../img/board/questions.png" alt="questions" style="width: 60px; height: 70px;"/>
				<br>문의게시판</span></a></li>
		</ul>
		<br>		
	</div>
	
	
	<div id="boardDisplay">
		<c:if test="${boardDisplay != null}">
			<jsp:include page="${boardDisplay}"/>
		</c:if>
	</div>

</body>
</html>
