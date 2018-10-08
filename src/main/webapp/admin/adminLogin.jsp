<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function(){
		if('${memName}'){
			alert('${memName}'+ "관리자님 혼저옵서예");
			location.href ="../main/index.html";
		}else{
			alert("로그인에 실패하였습니다.다시 시도해주세요.");
			location.href="loginForm";
		}
	}
	
</script>
</head>
<body>
	
</body>
</html>