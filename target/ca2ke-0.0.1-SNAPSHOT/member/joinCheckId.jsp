<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkIdClose() {
		opener.joinForm.m_id.value = '${id }';
		window.close();
		opener.joinForm.m_pwd.focus();
	}
</script>
</head>
<body>
<form action="joinCheckId" method="post" name="">
	<c:if test="${exist}">
		<p>${id }는(은) 사용중입니다.</p>
		아이디  <input type="text" name="id">
			 <input type="submit" value="중복 체크">
	</c:if>
	<c:if test="${!exist}">
		<p>${id }는(은) 사용가능한 아이디 입니다.</p>
		<input type="button" value="사용" onclick="checkIdClose()">
	</c:if>
</form>
</body>
</html>