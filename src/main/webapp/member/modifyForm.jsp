<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/font.css" />
<!-- <link rel="stylesheet" href="../assets/css/common.css" />   -->
<link rel="stylesheet" href="../assets/css/style.css" />
<link rel="stylesheet" href="../assets/css/resolution.css" media="only screen and (-webkit-min-device-pixel-ratio: 3)" />
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/> -->
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/script/modifyScript.js"></script>
<script type="text/javascript">


</script>
<!--
<script type="text/javascript">
	$(document).on('click','#sendCheckEmail', function(){
		var m_email = $("#m_email").val();
		$.ajax({
			async: true,
			url:"authSend",
			type: "POST",
			data:{'m_email' : m_email},
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			dataType : "json",
			
			success : function(data){
				if(data.result == true){
					alert("사용불가능한 이메일입니다.");
				}else{
					alert("사용가능한 이메일입니다.");
					window.open("emailCheckForm?authNum=" + data.authNum ,"", "width=530 height=260 left=500 top=200");
					emailck = 1;
				}
				
			},
			error: function(XMLHttpRequest, textStatus,errorThrown){
				alert("서버와의 통신이 원활하지 않습니다.\n 다시 시도해주세요. "+XMLHttpRequest.status);
			}
		});
	});
	
	function eventSuccess(data){
		w.location.href ="../member/emailCheckForm";
	}
</script>
 -->


<style>
.form-select-sign {
    display: inline-block;
    vertical-align: middle;
    box-sizing: border-box;
    border: 1px solid #ccc;
    width: 20%;
    min-width: 115px;	
}
table.form-table{
	width: 100%;
	background-color: white;
}
#m_id:focus, #m_id:hover{
	border: 1px solid #ccc;
}
input[type=password]:focus, input[type=password]:hover{
	border: 2px solid #ffb497;
}
#m_email:focus, #m_email:hover{
	border: 2px solid #ffb497;
}
button#cancelBtn{
	background-color: #eee;
}
</style>
</head>
<body>
<form action="modify" name="modifyForm" id="modifyForm" method="post">
<!-- sub page contents -->
<div class="sub-contents-container-사용안함">
	<div class="global-section sub-contents-사용안함">
		<div class="sub-contents-box">
			<h3 class="contents-title">회원정보 수정</h3>
            <div class="form-box">
            	<p class="essential-text t-green">* 필수 입력 사항입니다.</p>
           
            <table class="form-table">
           		<tbody>
                	<tr>
               			<th scope="row"><label for="memberId">아이디</label> <span class="t-green">*</span></th>
                    	<td>
		                    <div class="input-box">
								<input type="text" id="m_id" name="m_id" class="input l" readonly value="${memberDTO.m_id }"/>
								<span class="input-guide-text inline t-green">&nbsp;&nbsp;&nbsp;아이디는 수정하실 수 없습니다.</span>
		                    </div>
                        </td>
                    </tr>
                    <tr>
                    	<th scope="row"><label for="memberPass">비밀번호</label> <span class="t-green">*</span></th>
                        <td>
                        	<div class="input-box">
                        	
								<div class="mobile-block">
                                	<input type="password" id="m_pwd" name="m_pwd" class="input l" placeholder="비밀번호를 입력해주세요."/>
                                </div>
                                
								<div class="mobile-block">
									<span class="input-guide-text inline t-gray"></span>
								</div>
								
							</div>
                        </td>
                    </tr>
                    <tr>
                    	<th scope="row"><label for="memberPassConfirm">재입력</label> <span class="t-green">*</span></th>
                        <td>
                        	<div class="input-box">
                        	
									<div class="mobile-block">
                                    	<input type="password" id="m_repwd" name="m_repwd" class="input l" />
                                    </div>
                                    
									<div class="mobile-block">
										<span class="input-guide-text inline t-green">비밀번호를 한번 더 입력해 주세요.</span>
									</div>
                        	</div>
                        </td>
                    </tr>
                    <tr>
                    	<th scope="row">이름 <span class="t-green">*</span></th>
                        <td><input type="text" name="m_name" class="input l" placeholder="성함을 입력해주세요." value="${memberDTO.m_name }"></td>
                    </tr>
                    <tr>
                    	<th scope="row">휴대폰번호 <span class="t-green">*</span></th>
                    	<td><input type="text" name="m_phone" id="m_phone" placeholder="휴대폰번호 입력시 '-'를 제외하고 입력해주세요." class="input l" value="${memberDTO.m_phone }"></td>
                    </tr>
                    <tr>
                    	<th scope="row">이메일 <span class="t-green">*</span></th>
  						<td><input type="email" name="m_email" id="m_email" class="input l" placeholder="이메일 형식에 맞춰주세요." value="${memberDTO.m_email }">
  							<input type="hidden" name="m_email2" id="m_email2" value="${memberDTO.m_email }">
  							<button type="button"  class="btn l font-l redwine pd-m" id="sendCheckEmail" name="sendCheckEmail" >이메일인증</button>
  							<label id="hiddenlabel"></label>
  						</td>
                    </tr>
         		 </tbody>
      		</table>
  		</div>
			<div class="form-btn-box">
				<button type="button" class="btn l font-l redwine pd-m" onclick="modifyCheck()">정보수정완료</button>
				<button type="button" class="btn l font-l nobg pd-m" id="cancelBtn" onclick="location.href='modifyViewForm'">취소</button>
			</div>	
		</div>
	</div>
</div>
</form>
</body>
</html>