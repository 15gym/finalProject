<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 상세</title>
<link rel="stylesheet" href="../assets/css/qnalist.css"/>
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		//삭제 버튼 클릭 시
		$("#deleteBtn").click(function(){
			var result = confirm("해당 문의글을 삭제하시겠습니까?");
			if (result){
				location.href="qnaDelete_admin?qna_num=" + $("#qna_num").val();
			}					
		});
		
		//답변 버튼 클릭 시
		$("#replyBtn").click(function(){
			if ($("#qna_reply").val()==""){
 				alert("답변을 입력하세요");
 				$("#qna_reply").focus();
 				return false;
 			}
			$("#qnaReplyForm").submit();			
		});
		
		
	});
</script>
</head>
<body>
		<div id="qnaReply" style="padding : 30px;">
		<h2>Q & A - 답변 등록</h2>
		
		<form id="qnaReplyForm" method="post" action="qnaReply">
			<input type="hidden" value="${dto.qna_num }" name="qna_num" id="qna_num">
			<input type="hidden" value="${pg }" name="pg">
			<table id="qnaReplyTable">
				<tr>
					<th>제목</th>
					<td>${dto.qna_subject }</td>
				</tr>

				<tr>
					<th>문의유형</th>
					<td>${dto.qna_type }</td>
				</tr>
				
				<tr id="content">
					<th>내용</th>
					<td><pre>${dto.qna_content}</pre></td>
				</tr>
				<tr>
					<th>판매자 답변</th>
					<td>
						<textarea name="qna_reply" id="qna_reply" class="form-control" rows="10" cols="15"></textarea>
					</td>
				</tr>
			</table>
		</form>
			
			<div id="btnDiv">
				<input type="button" value="답변 등록" id="replyBtn" class="btn btn-default">
				<input type="button" value="삭제" id="deleteBtn" class="btn btn-default">
				<input type="button" value="목록" class="btn btn-default" onclick="location.href='qnalist_admin?pg=${pg}'">
			</div>
			
		</div>

</body>
</html>