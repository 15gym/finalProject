<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="stylesheet" href="../assets/css/contact_faq.css">
<!-- <link rel="stylesheet" href="../assets/css/index2.css?ver=5"> -->
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/script/faqScript.js"></script>
<style type="text/css">
	#faqListTable{
		width: 100%;
		border-collapse: collapse;
	}


</style>

</head>
<body>

<div id="section2">
	<div class="title">FAQ</div>
	<div class="board_list faq">
		<table id="faqListTable">
			<colgroup>
				<col width="60px">
				<col width="55px">
				<col>
				<col width="75px">
				<col width="60x">
			</colgroup>
			<tbody>
				<c:forEach var="faqDTO" items="${list}">
					<tr class="faq_question  set_odd " >
						<!-- 글번호 -->
						<td class="faq_num">${faqDTO.faq_num}</td>
						<!-- 카테고리 -->
						<td class="category_name">${faqDTO.category_name}</td>
						<!-- 제목 -->
						<td class="faq_subject"><a>
						${faqDTO.faq_subject}</a></td>
						<!-- 등록일 -->
						<td class="faq_logtime" width="150px;" >${faqDTO.faq_logtime}</td>
					</tr>
					
					<!-- 내용 -->
					<tr id="faq29" class="faq_content">
						<td colspan="5" class="faqContent"><pre>${faqDTO.faq_content}</pre></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>			
	</div>





</body>
</html>