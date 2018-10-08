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
			if (${sessionScope.memId != null}){
				var result = confirm("해당 문의글을 삭제하시겠습니까?");
				if (result){
					location.href="qnaDelete_admin?qna_num=" + $("#qna_num").val();
				}
			}
		});

	});
	
</script>
</head>
<body>
		<div id="qnaDetail" style="padding : 30px;">
		<h2 id="qnaDetail_admin">Q & A</h2>
		
			<table id="qnaDetailTable">
				<tr>
					<th>제목</th>
					<td>${dto.qna_subject } <input type="hidden" value="${dto.qna_num }" id="qna_num"></td>
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
						<c:if test="${dto.qna_result == '답변완료' }">
							${dto.qna_redate } 답변 등록<br><br>
							${dto.qna_reply }
						</c:if>
						<c:if test="${dto.qna_result == '답변대기' }">
							판매자 답변을 기다리는 중입니다.
						</c:if>
					</td>
				</tr>
			</table>
			
			<div id="btnDiv">
				<input type="button" value="삭제" id="deleteBtn" class="btn btn-default">
				<input type="button" value="목록" class="btn btn-default" onclick="location.href='qnalist_admin?pg=${pg}'">
			</div>
			
		</div>

</body>
</html>