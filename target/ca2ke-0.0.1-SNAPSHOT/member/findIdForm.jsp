<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/translateelement.css">
<link rel="stylesheet" href="../assets/css/colorbox.css">
<link rel="stylesheet" href="../assets/css/common2.css">
<link rel="stylesheet" href="../assets/css/font.css">
<link rel="stylesheet" href="../assets/css/style.css">
<link rel="stylesheet" href="../assets/css/resolution.css" media="only screen and (-webkit-min-device-pixel-ratio: 3)" />
<script type="text/javascript" src="../assets/js/script/idnpwFind.js"></script>
<style type="text/css">
.icon-cer-phone {
    display: inline-block;
    width: 144px;
    height: 144px;
    background-image: url(../img/googleEmail.jpg);
    background-repeat: no-repeat;
    vertical-align: top;
}
.sub-navigation-box.nav02 {
    background-image: url(../img/img_nav02.png);
}
.tab-list-box {
    font-size: 0;
    word-spacing: 0;
    letter-spacing: 0;
    position: relative;
    z-index: 20;
    margin-top: -27px;
}
.tab-list-box.sub-lnb {
    margin-top: -78px;
}
.tab-list-box li {
    display: inline-block;
}
.tab-list-box.column2 li {
    width: 50%;
}
.tab-list-box.column3 li {
    width: 33.333%;
}
.tab-list-box.column3 li:nth-child(2) {
    width: 33.334%;
}
.btn-tab-item {
    display: inline-block;
    font-size: 24px;
    letter-spacing: -0.025em;
    color: #916e4b;
    background-color: #fff;
    height: 72px;
    line-height: 72px;
    border: 1px solid #e4e4e4;
    box-sizing: border-box;
    width: 100%;
    text-align: center;
	background: url(../img/tab-img-off.png);
}

.tab-list-box.column3 li:first-child .btn-tab-item {
    border-right: 0;
}
.tab-list-box.column3 li:last-child .btn-tab-item {
    border-left: 0;
}
.btn-tab-item:hover,
.btn-tab-item.on {
	  background-color: #916e4b;
    color: #fff;
    border: 1px solid #7b5937;
    background: url(../img/tab-img.png);
}

.tab-list-box.sub-lnb .btn-tab-item {
    font-size: 20px;
    height: 62px;
    line-height: 62px;
    vertical-align: top;
}
.sub-contents-box{
	margin-top: 100px;
}
</style>
</head>
<body>
<div class="sub-contents-container">
		
	<div class="global-section sub-contents">
	    <div class="sub-navigation-box nav02">
	        <h2 class="sub-nav-title">ID/PW 찾기</h2>
		    <div class="sub-nav-loc">
		    	<!--  
			    <span class="sub-nav-item home">홈</span>
			    <span class="sub-nav-item">아이디/비밀번호 찾기</span>
			    -->
			</div>
		</div>

		<div class="sub-contents-box">
			<ul class="tab-list-box column2">
			    <li><button type="button" class="btn-tab-item on">아이디 찾기</button></li>
			    <li><button type="button" class="btn-tab-item" onclick="location.href='findPwForm'">비밀번호 찾기</button></li>
			</ul>
			<div class="tab-contents">
			    <div class="find-idpw-box">
			        <p class="find-idpw-top-text">
			            본인 명의의 이메일로 <span class="t-gray">본인 인증을 통해,</span><br /><span class="t-gray">아이디를 확인</span>하실 수 있습니다.
			        </p>
			        <i class="icon-cer-phone"></i>
			        <div class="icon-btn-box">
			            <a href="" onclick="idFind(); return false;" class="btn xl font-l black pd-xl">이메일 인증하기</a>
			        </div>
			    </div>
			</div>
		</div>
	</div>
</div>

</body>
</html>