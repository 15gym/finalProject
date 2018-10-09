<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="/ca2ke/assets/css/bootstrap.min.css"> -->
<script type="text/javascript" src="../assets/js/script/noticeScript.js"></script>
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
	 .form-control {
		width: 90%;
	}
	.container2{
		width: 1000px;
		min-width: min-content;
		margin-left: auto;
		margin-right: auto;
		background-color: white;
		/*height: 1000px;*/
		padding: 30px 0;
	}
</style>
</head>
<body>
<div class="container2"> 
	<form action="noticeInsert" method="post" name="noticeForm" id="noticeForm">  
		<div class="form-group"> 
			<label for="subject">공지사항 제목</label> 
			<input type="text" class="form-control" name ="notice_subject" id="notice_subject" placeholder="Enter title"> 
		</div> 
		<div class="form-group"> 
			<label for="content">공지사항 내용</label> 
			<textarea class="form-control" rows="10" name="notice_content" id="notice_content"></textarea> 
		</div> 
	<center>
	<div class="center-block" style='width:200px'> 
		<input type="reset" value="다시쓰기">
		<input type="button" value="저장" onclick="noticeInsert();"> 
	</div>
	</form>
</div>

</body>
</html>