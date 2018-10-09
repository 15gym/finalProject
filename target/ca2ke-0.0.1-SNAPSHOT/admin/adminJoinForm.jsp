<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/font.css" />
<!--  <link rel="stylesheet" href="../assets/css/common2.css" /> -->
<link rel="stylesheet" href="../assets/css/style.css" />
<!-- <link rel="stylesheet" href="../assets/css/resolution.css" media="only screen and (-webkit-min-device-pixel-ratio: 3)" /> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>  -->
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/script/adminJoinScript.js"></script>
<script type="text/javascript" src="../assets/js/jsbn.js"></script>
<script type="text/javascript" src="../assets/js/rsa.js"></script>
<script type="text/javascript" src="../assets/js/prng4.js"></script>
<script type="text/javascript" src="../assets/js/rng.js"></script>	
<style>
.form-select-sign {
    display: inline-block;
    vertical-align: middle;
    box-sizing: border-box;
    border: 1px solid #ccc;
    width: 20%;
    min-width: 115px;	
}
.form-table{
	 width: 100%;
	 

}
</style>
</head>
<body>
<form action="adminJoin" name="adminjoinForm" id="adminjoinForm" method="post" class="adminForm">
<input type="hidden" id="RSAModulus" value="${RSAModulus}" />
<input type="hidden" id="RSAExponent" value="${RSAExponent}" />
<!-- sub page contents -->
<div class="sub-contents-container-사용안함">
	<div class="global-section sub-contents-사용안함">
		
		<div class="sub-contents-box">
			<h3 class="contents-title">관리자 가입</h3>
            <div class="	">
            	<p class="essential-text t-green">* 필수 입력 사항입니다.</p>
           
            <table class="form-table">
           		<tbody>
                	<tr>
               			<th scope="row"><label for="a_id">아이디</label> <span class="t-green">*</span></th>
                    	<td>
		                    <div class="input-box">
								<input type="text" id="a_id" name="a_id" placeholder="아이디를 입력해주세요." class="input l" />
								 <button type="button" onclick="checkId()"  class="btn l font-l redwine pd-m" name="joincheckbutton" id="joincheckbutton">중복확인</button>
								 
		                    </div>
                        </td>
                    </tr>
                    <tr>
                    	<th scope="row"><label for="a_pwd">비밀번호</label> <span class="t-green">*</span></th>
                        <td>
                        	<div class="input-box">
                        	
								<div class="mobile-block">
                                	<input type="password" id="a_pwd" name="a_pwd" class="input l" placeholder="비밀번호를 입력해주세요."/>
                                </div>
                                
								<div class="mobile-block">
									<span class="input-guide-text inline t-gray"></span>
								</div>
								
							</div>
                        </td>
                    </tr>
                    <tr>
                    	<th scope="row"><label for="a_repwd">재입력</label> <span class="t-green">*</span></th>
                        <td>
                        	<div class="input-box">
                        	
									<div class="mobile-block">
                                    	<input type="password" id="a_repwd" name="a_repwd" class="input l" />
                                    </div>
                                    
									<div class="mobile-block">
										<span class="input-guide-text inline t-green">비밀번호를 한번 더 입력해 주세요.</span>
									</div>
                        	</div>
                        </td>
                    </tr>
                    <tr>
                    	<th scope="row">이름 <span class="t-green">*</span></th>
                        <td><input type="text" name="a_name" class="input l" placeholder="성함을 입력해주세요."></td>
                    </tr>
         		 </tbody>
      		</table>
  		</div>
			<div class="form-btn-box">
				<button type="button" class="btn l font-l redwine pd-m" onclick="amdinjoinCheck();">
				완&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;료</button>
				<button type="reset" class="btn l font-l nobg pd-m">다시작성</button>
			</div>	
		</div>
	</div>
</div>
</form>
</body>
</html>
