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
		if('${result}' > 0){
			alert("회원정보 수정을 완료하였습니다. 다시 로그인 부탁드립니다.");
			location.href="modifyEditOklogout";
		}else{
			alert("회원정보가 맞지않습니다. 다시 시도해주세요.");
			location.href="index.html";
		}
	}
</script>
</head>
<body>
</body>
</html>