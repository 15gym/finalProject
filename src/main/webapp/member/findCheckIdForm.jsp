<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/font.css" />
<link rel="stylesheet" href="../assets/css/common2.css" />
<link rel="stylesheet" href="../assets/css/style.css" />
<link rel="stylesheet" href="../assets/css/resolution.css" media="only screen and (-webkit-min-device-pixel-ratio: 3)" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>
<script type="text/javascript" src="../assets/js/script/idnpwFind.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	  $('input[type=email]:visible:enabled:first').focus();
	});
</script>
</head>
<body>
<center>
<br /><br />
<h5>ID 찾기</h5>
<div class="mobile-block">
	<form method="post" name="FindCheckId" id="FindCheckId">
		이메일 :<input type="email" name="m_email" id="m_email" class="input l"><br /><br />
		이름    :<input type="text" name="m_name" id="m_name" class="input l"><br /><br />
		<div class="mobile-block">
			<input type="button" value="확인" name="" onclick="idCheckButton()"class="btn l font-l redwine pd-m">
		</div>
	</form>
</div>
</body>
</html>