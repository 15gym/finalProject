<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../assets/css/contact_notice.css?ver=3"> -->
<!-- <link rel="stylesheet" href="../assets/css/bootstrap.css">-->
<!--<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">-->
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/script/noticeScript.js"></script>
<style type="text/css">
.notice_content > td{
	border: 2px dotted #CC723D;
}
.deleteButton{
 color: red;
}
</style>
</head>
<body>

<div id="section">
	<div class="notice" align="center">
		<form action="noticeDelete" method="post" id="deleteForm" name="deleteForm">
			<table class="table table-striped">
				<caption></caption>
				<!--<colgroup>
					<col style="width: 88px;">
					<col>
					<col style="width: 145px;">
				</colgroup> -->
					<c:forEach var="noticeDTO" items="${list}">
						<tr class="news_tit">
							<!-- 글번호 -->
							<td class="notice_num"><input type="hidden" id="notice_num" name="notice_num" value="${noticeDTO.notice_num}">${noticeDTO.notice_num}</td>	
							<!-- 제목 -->
							<td class="notice_subject">
			      				 <strong><a style="text-decoration: none; " id="animation" >${noticeDTO.notice_subject}</a></strong></td>
			      			 <!-- 등록일 --> 
							<td class="notice_logtime">${noticeDTO.notice_logtime}</td>	
							<td><a style="text-decoration: none; cursor: pointer;" class="deleteButton" >삭제</a></td>
						</tr>
							<!-- 내용 -->
						<tr class="notice_content" id="noticeContent"> 
							<td colspan="4"><pre>${noticeDTO.notice_content}</pre></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>	
	</div>
</div>
	
</body>
</html>