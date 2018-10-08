<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				alert("작성하신 글이 등록되었습니다");
			} else{
				alert("문의글 등록 실패! 다시 확인해주세요.");
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
	
	
	//글 제목 클릭 시 작성자 검사
	function idCheck(m_id, qna_public, qna_num, pg){
		if (qna_public == "y"){ //공개글인 경우
			//alert("1:");
			location.href="qnaDetail?qna_num="+qna_num+"&pg="+pg;
		} else{
			if (${sessionScope.memId != null}){ //비공개 & 로그인 한 경우
				if ("${sessionScope.memId}" == m_id){ //비공개 & 작성자가 클릭한 경우
					//alert("2:");
					location.href="qnaDetail?qna_num="+qna_num+"&pg="+pg;
				} else{ // 비공개 & 작성자가 아닌 경우
					alert("작성자만 확인 가능합니다.");
				}
			} else{ //비공개 & 로그인 안한 경우
				alert("로그인 후 확인 가능합니다.");
			}
		}
	}
	
	//[문의글 등록] 버튼 클릭 시 로그인 검사
	function qnaForm(){
		if (${sessionScope.memId == null} || ${sessionScope.admin != null}){ 
			alert("문의글은 회원 로그인 후 작성 가능합니다.");
			location.href="loginForm";
		} else {
			location.href="qnaForm";
		}
	}
	
</script>
</head>
<body>
	<div id="qnalist">
		<div class="title">문의 게시판</div>
			<input type="button" class="btn btn-primary" value="문의글 등록" onclick="qnaForm()">
			<table class="table-bordered table-hover" id="qnaTabel">
				<thead>
					<tr>
						<th id="col1">번호</th>
						<th id="col2">분류</th>
						<th id="col3">상태</th>
						<th id="col4">제목</th>
						<th id="col5">글쓴이</th>
						<th id="col6">등록일</th>
						<th id="col7">조회수</th>
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
								
								<c:if test="${dto.qna_result == '답변완료'}">
									<td class="text" style="color: #0080ff;">
											${dto.qna_result }</td>
								</c:if>
								<c:if test="${dto.qna_result == '답변대기'}">
									<td class="text"">
											${dto.qna_result }</td>
								</c:if>
								
								<td id="subject">
									<a href="#" onclick="idCheck('${dto.m_id}', '${dto.qna_public}', ${dto.qna_num }, ${pg })">${dto.qna_subject }
									<c:if test="${dto.qna_public == 'n' }">
										<img src="../img/lock-icon.png" alt="잠금">
									</c:if>
									</a></td>
								<td>${dto.m_id }</td>
								<td>
									<c:set var="date" value="${dto.qna_logtime}"/>
									${fn:substring(date,0,10) }
								</td>
								<td>${dto.hit }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			
			
		<!-- 페이징 처리 -->
		<div class="btn-group" role="group">
			<c:if test="${startPage>3 }">
				<input type="button" value="&lt;" onclick="location.href='qnalist?pg='+${startPage-1}" class="btn btn-secondary paging">
			</c:if>
	
			<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">	
				<c:if test="${pg == i }">
					<input type="button" value="${i }" onclick="location.href='qnalist?pg='+${i}" class="btn btn-secondary currentPaging">
				</c:if>
				<c:if test="${pg != i }">
					<input type="button" value="${i }" onclick="location.href='qnalist?pg='+${i}" class="btn btn-secondary paging">
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage < maxPage }">
				<input type="button" value="&gt;" onclick="location.href='qnalist?pg='+${endPage+1}" class="btn btn-secondary paging">
			</c:if>
		</div>	
		
	</div>
</body>
</html>