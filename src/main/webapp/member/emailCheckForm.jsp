<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../script/deleteScript.js"></script>
<script type="text/javascript" src="../script/modifyViewcScript.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	  $('input:text[value=""]:visible:enabled:first').focus();
	});
	
	
	function check(){
		if(document.authSend.authNum.value == ""){
			alert("인증번호를 입력하세요");
			document.authSend.authNum.focus();
		}else if(document.authSend.authNum.value != '${param.authNum}'){
			alert("틀린 인증번호입니다. 다시 입력해주세요.");
			document.authSend.authNum.value = "";
			document.authSend.authNum.focus();
		}else if(document.authSend.authNum.value == '${param.authNum}'){
			alert("인증완료");
			opener.document.getElementById("hiddenlabel").value = "인증완료";
			if(opener.document.getElementById("hiddenlabel").value != ""){
				if(opener.document.getElementById("modifyForm") != null){
					//이메일 인증 성공 시 이메일 수정 불가 & 이메일 인증 버튼 동작 x
					opener.document.modifyForm.sendCheckEmail.disabled = true;	 //이메일 버튼 동작 x
					opener.document.modifyForm.m_email.setAttribute("readonly", "true"); //이메일 수정 불가
				}
				else{
					opener.document.joinForm.sendCheckEmail.disabled = true;	
					opener.document.joinForm.m_email.setAttribute("readonly", "true"); //이메일 수정 불가
				}
			}
			window.close();
		}
	}
</script>
</head>
<body>
<!-- sub page contents -->
<center>
<br /><br />
<h5>인증번호 7자리를 입력하세요.</h5>
<div>
	<form method="post" name="authSend" id="authSend" >
		<input type="text" name="authNum" id="authNum" autofocus="autofocus"><br /><br />
		<input type="button" value="확인"  onclick="check()">
	</form>
</div>
</body>
</html>