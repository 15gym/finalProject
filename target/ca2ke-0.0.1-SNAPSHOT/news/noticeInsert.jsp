<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if('${result}' >0){
		alert("공지사항 등록하였습니다.");
		location.href="../main/noticeBoardList";
	}else{
		alert("공지사항 등록을 실패하였습니다.");
		location.href="../admin/admin_main.jsp"
	}
</script>
</head>
<body>

</body>
</html>