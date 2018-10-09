<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  <link rel="stylesheet" href="../assets/css/bootstrap.css">-->
<!--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">-->
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/script/faqScript.js"></script>
<style type="text/css">
	.faq_content > td{
		border: 2px dotted #CC723D;
	}
	.deleteButton{
	 color: red;
	}
</style>
</head>
<body>
<div id="section2">	
	<div class="board_list faq">
	<form action="faqDelete" method="post" id="deleteForm" name="deleteForm">
		<table class="table table-striped">
				<!--<colgroup>
				<col width="60px">
				<col width="55px">
				<col>
				<col width="75px">
				<col width="60x">
			</colgroup> -->
			<tbody>
				<c:forEach var="faqDTO" items="${list}">
					<tr class="faq_question  set_odd " >
						<!-- 글번호 -->
						<td class="faq_num"><input type="hidden" id="faq_num" name="faq_num" value="${faqDTO.faq_num}"> ${faqDTO.faq_num}</td>
						<!-- 카테고리 -->
						<td class="category_name">${faqDTO.category_name}</td>
						<!-- 제목 -->
						<td class="faq_subject"><a>
						${faqDTO.faq_subject}</a></td>
						<!-- 등록일 -->
						<td class="faq_logtime" >${faqDTO.faq_logtime}</td>
						<td><a style="text-decoration: none; cursor: pointer; border-left: 1px solid #D9E5FF;" class="deleteButton" >삭제</a></td>
					</tr>
					<!-- 내용 -->
					<tr id="faq29" class="faq_content">
						<td colspan="5"  class="faqContent"><pre>${faqDTO.faq_content}</pre></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</form>
		</div>			
	</div>
</body>
</html>