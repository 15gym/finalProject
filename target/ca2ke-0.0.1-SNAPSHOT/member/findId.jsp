<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if('${authNum}' != ""){
		alert("이메일을 전송하였습니다. 확인해주세요.");
		window.close();
	}else{
		alert("주신정보가 맞지 않습니다. 다시 확인해주세요.");
		window.close();
	}
</script>
</head>
<body>
	
</body>
</html>