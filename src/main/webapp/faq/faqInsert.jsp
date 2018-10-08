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
			alert("FAQ등록 성공하였습니다.");
			location.href="../main/faqBoardList";
		}else{
			alert("오류발생하였습니다. 다시시도해주세요.");
			location.href="../admin/admin_main.jsp";
		}
	}
</script>
</head>
<body>

</body>
</html>