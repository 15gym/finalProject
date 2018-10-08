<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title></title>
<script type="text/javascript" src="/ca2ke/assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/ca2ke/assets/js/script/snsScript.js"></script>
<style>
#glayLayer {
	position: fixed; left: 0; top:0;
	height: 100%; width:100%; background: black;
	filter: alpha(opacity=60); opacity: 0.60;
}	

#overLayer {
	position:fixed; top:50%; left:20%; 
	margin-top: -200px; margin-left: 13%;
        height:400px; width: 400px;
        background: white;
        border-radius: 2px;
}    

label {
        display: block;
        font-size: 2em;
        color: #333;
        padding: 30px;
        text-align: center;
}

input {
        width: 100%;
        box-sizing: border-box;
        padding: 12px 20px;
        margin: 8px 0;
        font-size: 1em;
}

input[type='submit'] {
        border: none;
        color: white;
        background: #ffb497;
        cursor: pointer;
}
input[type='button'] {
        border: none;
        color: white;
        background: #bbb;
        cursor: pointer;
}

input[type='text'] {
        border: 2px solid #bbb;
        cursor: pointer;
        margin-bottom: 80px;
}

input[type='text']:focus {
        border: 2px solid #ffb497;
}

span {
        display: block;
        font-size: 0.8em; 
        text-align: right;
}
</style>
</head>
<body>
	<div id="glayLayer"></div>
	<div id="overLayer">
		<form action="/ca2ke/snsJoin" method="post" name="snsJoinForm" id="snsJoinForm">
			<input type="hidden" name="m_id" value="${sns_id}"/>
			<input type="hidden" name="m_name" value="${m_name}"/>
			<input type="hidden" name="m_email" value="${m_email}"/>
	  		<label for="m_phone">휴대폰번호</label>
          		<span>*휴대폰번호를 입력하여야 가입이 가능합니다.</span>
			<input type="text" name="m_phone" id="m_phone" placeholder="휴대폰번호 입력시 '-'를 제외하고 입력해주세요."/>
			<input type="button" value="가입하기" onclick="joinButton();"/>
			<input type="button" value="취 소" 
			  onclick="location.href='/ca2ke/main/index.html'"/>
		</form>
	</div>
</body>
</html>
