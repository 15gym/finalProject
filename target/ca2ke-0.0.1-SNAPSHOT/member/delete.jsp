<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function(){
		if('${result}' > 0){
			window.close();
			alert("회원탈퇴를 성공하셨습니다.");
			opener.location.href="index.html";
		}else{
			window.close();
			alert("회원탈퇴를 실패하셨습니다.");
			opener.location.href="myPage";
		}
	}
</script>
</head>
<body>
	
</body>
</html>