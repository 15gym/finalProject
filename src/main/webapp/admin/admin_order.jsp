<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function move(){
	    location.replace("currentOrder");
	}
</script>
<style type="text/css">
	.card {
		display: inline-block;
	}
</style>
</head>
<body>
	<div class="card" style="width: 20rem;">
			  <div class="card-body">
				<h4 class="card-title">주문 목록</h4>
				<p class="card-text">진행 중인 주문 목록<br/>
				<br/></p>
				<a href="currentOrder" class="btn btn-info" onclick="move();">바로가기</a>
			  </div>
	</div>
</body>
</html>
