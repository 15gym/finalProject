<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function(){
	if(${result}==1){
		alert("상품이 등록되었습니다.");
		location.href="../main/itemList?category=${category}";
	}else{
		alert("상품 등록에 실패하였습니다.");
	}
}
</script>
</head>
<body>
</body>
</html>