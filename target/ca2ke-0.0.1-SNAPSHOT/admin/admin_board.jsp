<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.card {
		display: inline-block;
	}
</style>
</head>
<body>

	<div class="card" style="width: 20rem;">
			  <div class="card-body">
				<h4 class="card-title">공지사항 등록</h4>
				<p class="card-text"> 공지사항 등록<br/>
				  <br/></p>
				<a href="../admin/noticeInsertForm" class="btn btn-info">바로가기</a>
			  </div>
	</div>
	<div class="card" style="width: 20rem;">
		  <div class="card-body">
			<h4 class="card-title">공지사항 삭제</h4>
			<p class="card-text"> 공지사항 목록 및 삭제<br/>
			  <br/></p>
			<a href="../admin/noticeDeleteForm" class="btn btn-info">바로가기</a>
		  </div>
	</div>
	
	<div class="card" style="width: 20rem;">
		  <div class="card-body">
			<h4 class="card-title">FAQ 등록</h4>
			<p class="card-text">FAQ 등록<br/>
			  <br/></p>
			<a href="../admin/faqInsertForm" class="btn btn-info">바로가기</a>
		  </div>
	</div>
	
	<div class="card" style="width: 20rem;">
		  <div class="card-body">
			<h4 class="card-title">FAQ 삭제</h4>
			<p class="card-text">FAQ 목록 및 삭제<br/>
			  <br/></p>
			<a href="../admin/faqDeleteForm" class="btn btn-info">바로가기</a>
		  </div>
	</div>
	
	<div class="card" style="width: 20rem;">
		  <div class="card-body">
			<h4 class="card-title">Q&A 게시판 관리</h4>
			<p class="card-text"> 문의글 확인 및 답변 등록<br/>
			  <br/></p>
			<a href="qnalist_admin" class="btn btn-info">바로가기</a>
		  </div>
	</div>
</body>
</html>
