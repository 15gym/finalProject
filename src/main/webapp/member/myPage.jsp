<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../assets/css/common.css"/>
<link rel="stylesheet" href="../assets/css/myPage.css"/>
<script type="text/javascript" src="../assets/js/script/deleteScript.js"></script>

<script type="text/javascript">
	window.onload=function(){
		if (${display == null}){
			location.href="myOrder";
		}
	} 
</script>

</head>
<body>
    <div class="container">
    <div class="title">마이페이지</div>
    	<div id="myPage_menu" class="menu">
			<ul>
			    <li><a href="modifyViewForm">회원정보수정</a></li>
			    <li><a href="myOrder">구매내역</a></li>
			    <li><a href="cart">장바구니</a></li>
			    <li><a href="" onclick="deleteButton(); return false;">회원탈퇴</a></li>
			    <li><a href="index">메인 화면</a></li>
			</ul>
	    </div>
	
	
		<!--  
		<div class="content">	
		    <div id="thum">
				<ul>
				    <li><a href="#">
				    	<div>
				    		<img src="../img/myPage_icon1.png" alt="" style="width:120px; height:120px;"/><br />
				    		<span class="thum_detail"> <br /> 주문리스트<br /></span>
				    	</div>
				    </a></li>
				    
				    
				    <li><a href="myOrder">
				  		<div>
				   	 		<img src="../img/myPage_icon2.png" alt="" style="width:120px; height:120px;"/><br />
				   	 		<span class="thum_detail"> <br /> 구매내역<br /></span>
				  	    </div>
				    </a></li>
				    
				    
				    <li><a href="#">
				    	<div>
				    		<img src="../img/myPage_icon3.png" alt="" style="width:120px; height:120px;"/><br />
				    		<span class="thum_detail"> <br /> 장바구니<br /></span>
				    	</div>
				    </a></li>
				    
				    
				    <li><a href="" onclick="deleteButton(); return false;">
				    	<div>
				    		<img src="../img/myPage_icon4.png" alt="" style="width:120px; height:120px;"/><br />
				    		<span class="thum_detail" > <br /> 회원탈퇴<br /></span>
				    	</div>
				    </a></li>
				</ul>	
		    </div>
    </div>
		     -->

		    <div id="detail" style="padding-top: 3%">
				<c:if test="${display != null}">
					<jsp:include page="${display}"/>
				</c:if>
		    </div>

	    </div>
	    	    
</body>
</html>