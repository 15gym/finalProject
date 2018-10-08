<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/font.css" />
<link rel="stylesheet" href="../assets/css/common.css" />
<link rel="stylesheet" href="../assets/css/style.css" />
<link rel="stylesheet" href="../assets/css/resolution.css" media="only screen and (-webkit-min-device-pixel-ratio: 3)" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/script/modifyViewcScript.js"></script>
<script type="text/javascript">
	function editSubmit(){
		opener.document.modifyEditCheck.m_pwd.value = $("#m_pwd").val();
		opener.document.modifyEditCheck.submit();
		window.close();
	}
</script>
<style>
.form-select-sign {
    display: inline-block;
    vertical-align: middle;
    box-sizing: border-box;
    border: 1px solid #ccc;
    width: 20%;
    min-width: 115px;	
}
#divcenter > button{
margin-left: 180px;
margin-top: 35px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	  $('input[type=password]:visible:enabled:first').focus();
	});
</script>
</head>

<body>
<!-- sub page contents -->
<div class="sub-contents-container">
	<div class="global-section sub-contents">
		<div class="sub-contents-box">
            <div class="form-box">  
            	<center>
				<label>현재비밀번호 입력 </label><span class="t-green"></span>
            <div class="input-box">
                    	
				<div class="mobile-block">
                	<input type="password" id="m_pwd" name="m_pwd" class="input l"/>
                </div>
                
				<div class="mobile-block">
					<span class="input-guide-text inline t-gray"></span>
				</div>
			</div>
  			</div>
  			<div id="divcenter">
  				<button type="button" class="btn l font-l redwine pd-m"  onclick="editSubmit()">확인</button>
  			</div>
		</div>
	</div>
</div>
</body>
</html>