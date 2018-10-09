<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/font.css" />
<!-- <link rel="stylesheet" href="../assets/css/common2.css" /> -->
<link rel="stylesheet" href="../assets/css/style.css" />
<link rel="stylesheet" href="../assets/css/resolution.css" media="only screen and (-webkit-min-device-pixel-ratio: 3)" /> 
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/> -->
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/script/deleteScript.js"></script>
<script type="text/javascript" src="../assets/js/script/modifyViewcScript.js"></script>
<style>
table.form-table{
	width: 100%;
	background-color: white;
}
button#deleteBtn{
	background-color: #eee;
}
input[type=text]:focus, input[type=text]:hover{
	border: 1px solid #ccc;
}
</style>
</head>
<body>
<form action="modifyEditCheck" name="modifyEditCheck" id="modifyEditCheck" method="post" class="modifyViewFormClass">
<!-- sub page contents -->
<div class="sub-contents-container-사용안함">
	<div class="global-section sub-contents-사용안함">	
		<div class="sub-contents-box">
			<h3 class="contents-title">회원정보</h3>
            <div class="form-box">
            	<!--  <p class="essential-text t-green">* 필수 입력 사항입니다.</p> -->
            	
            <table class="form-table">
           		<tbody>
                	<tr>
               			<th scope="row"><label for="memberId">아이디</label> <span class="t-green" ></span></th>
                    	<td>
		                    <div class="input-box">
								<input type="text" id="m_id" name="m_id"  class="input l" value="${memberDTO.m_id }" readonly/>	
								<input type="hidden" id="m_pwd" name="m_pwd" class="input l" />    	 
		                    </div>
                        </td>
                    </tr>   		        
                    <tr>
                    	<th scope="row">이름</th>
                        <td><input type="text" name="m_name" class="input l" readonly value="${memberDTO.m_name }"></td>
                    </tr>
                    <tr>
                    	<th scope="row">휴대폰번호</th>
                    	<td><input type="text" name="m_phone" id="m_phone"  class="input l" readonly value="${memberDTO.m_phone }"></td>
                    </tr>
                    <tr>
                    	<th scope="row">이메일</th>
  						<td><input type="email" name="m_email" class="input l" readonly value="${memberDTO.m_email }">
  						
                    </tr>
         		 </tbody>
      		</table>
  		</div>
			<div class="form-btn-box">
				<button type="button" class="btn l font-l redwine pd-m" id="modifyId" onclick="modifyEdit()" >회원정보수정</button>
				<button type="button" class="btn l font-l nobg pd-m" id="deleteBtn" onclick="deleteButton()">회원탈퇴</button>
			</div>	
		</div>
	</div>
</div>
</form>
</body>
</html>