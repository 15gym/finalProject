<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(${result} == 0) {
		alert("등록실패");
	} else {
		alert("등록성공");
	}
	location.href = '../admin/admin_main.jsp';
</script>
</head>
<body>

</body>
</html>