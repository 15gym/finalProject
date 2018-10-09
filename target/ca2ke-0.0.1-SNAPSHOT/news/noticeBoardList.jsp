<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<!--  <link rel="stylesheet" href="../assets/css/index2.css">    -->
<link rel="stylesheet" href="../assets/css/contact_notice.css">
<script type="text/javascript" src="../assets/js/script/noticeScript.js"></script>
<style type="text/css">
	#noticeListTable{
		width: 100%;
		border-collapse: collapse;
	}
	#noticeListTable tr#noticeContent td{
		font-size: 1em;
	}

</style>

 </head> 
<body>

<div id="section">
	<div class="title">공지사항</div>
	<div class="notice" align="center">
		<table id="noticeListTable">
			<colgroup>
				<col style="width: 88px;">
				<col>
				<col style="width: 145px;">
			</colgroup>
			<tbody>
				<c:forEach var="noticeDTO" items="${list}">
					<tr class="news_tit">
						<!-- 글번호 -->
						<td class="notice_num">${noticeDTO.notice_num}</td> 
						<!-- 제목 -->
						<td class="notice_subject">
		      				 <strong>${noticeDTO.notice_subject}</strong></a></td>
		      			 <!-- 등록일 --> 
						<td class="notice_logtime">${noticeDTO.notice_logtime}</td>
					</tr>
						<!-- 내용 -->
					<tr id="noticeContent"> 
						<td colspan="3" class="notice_content"><pre>${noticeDTO.notice_content}</pre></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

</body>
</html>