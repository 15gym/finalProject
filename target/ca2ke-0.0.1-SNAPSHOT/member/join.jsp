<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
window.onload=function(){
	if('${result}' > 0){
		alert('${memberDTO.m_name}' + "회원님 회원가입을 진심으로 축하드립니다.");
		location.href="loginForm";
	}else{
		alert("가입중 문제가 발생하였습니다. 잠시후 다시 시도해주세요.");
	}
}
</script>
</head>
<body>
	
</body>
</html>