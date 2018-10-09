<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	
	window.onload=function(){
		if('${m_pwd}' == '${memPwd}'){
			alert("비밀번호가 맞습니다. 회원정보수정페이지로 이동합니다.");
			location.href="modifyForm";
		}else{
			alert("비밀번호가 틀립니다.");
			location.href="modifyViewForm"
		}
	}
</script>
</head>
<body>

</body>
</html>