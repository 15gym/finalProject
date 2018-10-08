<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if('${result}' > 0){
		alert('${adminDTO.a_name}' + "님 관리자가입을 축하드립니다.");
		location.href="../admin/tab_member";
	}else{
		alert("가입도중 문제가 발생하였습니다. 잠시후 다시 시도해주세요");	
	}
</script>
</head>
<body>

</body>
</html>