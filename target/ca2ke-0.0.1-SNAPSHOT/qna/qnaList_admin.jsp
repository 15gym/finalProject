<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<link rel="stylesheet" href="../assets/css/qnalist.css"/>
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		if (${result != null}){
			if (${result == 1}){
				alert("답변이 등록되었습니다");
			} else{
				alert("답변 등록 실패! 다시 확인해주세요.");
				history.back();
			}
		}
		
		if (${deleteResult != null}){
			if (${deleteResult == 1}){
				alert("해당 글이 삭제되었습니다");
			} else{
				alert("문의글 삭제 실패! 다시 확인해주세요.");
				history.back();
			}
		}
	});
	
	function reply(qna_num, pg){
		location.href="qnaReplyForm?qna_num="+qna_num+"&pg="+pg;		
	}
	
	function check(qna_num, pg){
		location.href="qnaCheck?qna_num="+qna_num+"&pg="+pg;		
	}

</script>
</head>
<body>
	<div id="qnalist_admin">
		<h2>문의 게시판</h2>
			<table class="table-bordered table-hover" id="qnaTabel">
				<thead>
					<tr>
						<th id="col1">번호</th>
						<th id="col2">분류</th>
						<th id="col3">상태</th>
						<th id="col4">제목</th>
						<th id="col5">글쓴이</th>
						<th id="col6">등록일</th>
						<th id="col7">답변</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${maxPage == 0 }">
						<tr>
							<td colspan="7">등록된 글이 없습니다</td>
						</tr>
					</c:if>
					
					<c:if test="${maxPage > 0 }">
						<c:forEach var="dto" items="${qnalist}">
							<tr>
								<td>${dto.qna_num}</td>
								<td class="text">${dto.qna_type }</td>
								
								<c:if test="${dto.qna_result == '답변대기'}">
									<td class="text" style="color: #ff8000;">
											${dto.qna_result }</td>
								</c:if>
								<c:if test="${dto.qna_result == '답변완료'}">
									<td class="text"">
											${dto.qna_result }</td>
								</c:if>
								
								<td id="subject">${dto.qna_subject }
									<c:if test="${dto.qna_public == 'n' }">
										<img src="../img/lock-icon.png" alt="잠금">
									</c:if></td>
								<td>${dto.m_id }</td>
								<td>${dto.qna_logtime }</td>
								<td>
									<c:if test="${dto.qna_result == '답변대기' }">
										<input type="button" value="답변등록" name="replyBtn" id="replyFormBtn" onclick="reply(${dto.qna_num}, ${pg })">
									</c:if>
									<c:if test="${dto.qna_result=='답변완료' }">
										<input type="button" value="내용확인" name="checkBtn" id="checkBtn" onclick="check(${dto.qna_num}, ${pg })">
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<br>
			
			
		<!-- 페이징 처리 -->
		<div class="btn-group" role="group">
			<c:if test="${startPage>3 }">
				<input type="button" value="&lt;" onclick="location.href='qnalist_admin?pg='+${startPage-1}" class="btn btn-secondary paging">
			</c:if>
	
			<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">	
				<c:if test="${pg == i }">
					<input type="button" value="${i }" onclick="location.href='qnalist_admin?pg='+${i}" class="btn btn-secondary currentPaging">
				</c:if>
				<c:if test="${pg != i }">
					<input type="button" value="${i }" onclick="location.href='qnalist_admin?pg='+${i}" class="btn btn-secondary paging">
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage < maxPage }">
				<input type="button" value="&gt;" onclick="location.href='qnalist_admin?pg='+${endPage+1}" class="btn btn-secondary paging">
			</c:if>
		</div>	
		
	</div>
</body>
</html>