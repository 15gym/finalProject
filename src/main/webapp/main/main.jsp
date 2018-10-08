<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../assets/css/main.css"/>
<link rel="stylesheet" href="../assets/css/carousel.css"/>
<title></title>
</head>
<body>
	<c:if test="${display1 == null}">
		<div class="member" style="position: relative;">
			<ul>
				<c:if test="${sessionScope.admin != null}">
					<li><a href="../admin/tab_member" style="color: white">${sessionScope.admin}관리자페이지바로가기</a></li>
					<li> | </li>
					<li><a href="logOut"><span>LOGOUT</span></a></li>
				</c:if>	
				<c:if test="${sessionScope.memId == null && sessionScope.admin== null}">
					<li><a href="loginForm"><span>LOGIN</span></a></li>
					<li> | </li>
					<li><a href="joinForm"><span>JOIN</span></a></li>
				</c:if>
				<c:if test="${sessionScope.memId != null && sessionScope.admin == nul}">
					<li><a href="logOut"><span>LOGOUT</span></a></li>
					<li> | </li>
					<li><a href="cart"><span>CART</span></a></li>
					<li> | </li>
					<li><a href="myPage"><span>MyPage</span></a></li>
				</c:if>
				<li> | </li>
				<li><a href="index"><span>HOME</span></a></li>
			</ul>
		</div>
	</c:if>




	<c:if test="${display2 == null}">
	    <%-- <div class="member">
			<ul>
				<c:if test="${sessionScope.admin != null}">
					<a href="../admin/tab_member" style="color: white">${sessionScope.admin}관리자페이지바로가기</a>
				</c:if>	
				<c:if test="${sessionScope.memId == null}">
					<li><a href="loginForm"><span>LOGIN</span></a></li>
					<li> | </li>
					<li><a href="joinForm"><span>JOIN</span></a></li>
				</c:if>
				<c:if test="${sessionScope.memId != null}">
					<li><a href="logOut"><span>LOOUT</span></a></li>
					<li> | </li>
					<li><a href="cart"><span>CART</span></a></li>
					<li> | </li>
					<li><a href="myPage"><span>MyPage</span></a></li>
				</c:if>
			</ul>
		</div> --%>
	
	    <div id="nav">
	    	<div class="jcarousel">
				<ul  class="nav_ul">
					<c:forEach var="categorydto" items="${categorylist}">
						<c:if test="${categorydto.category_ongoing == 0}">
						<li><a href="/ca2ke/main/itemList?category=${categorydto.i_category}"><span>
							<img src="/ca2ke/storage/${categorydto.category_image}" alt="cake" style="width: 60px; height: 90px;"/>
							<br/>${categorydto.category_name}
						</span></a></li>
						</c:if>
					</c:forEach>
				</ul>				
	            <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
	            <a href="#" class="jcarousel-control-next">&rsaquo;</a>
			</div>
	    </div>
    </c:if>
  
  
  
  
  
  
  
  
  
  
    <div id="section">
		<c:if test="${display != null}">
			<jsp:include page="${display}"/>
		</c:if>
		
		<c:if test="${display2 != null }">
			<jsp:include page="${display2}"/>
		</c:if>
    </div>
    
    
    
    
    
    
    
    
    
       
     <div id="footer">
	     <div class="foot_nav">
	        <ul class="foot_menu" style="min-width: 1600px;">
	            <li class="foot_menu01"><a href="index#about" class="link_about"><span>ABOUT</span></a></li>
	            <li class="foot_menu02"><a href="index#cake" class="link_cake"><span>CAKE &amp;</span></a></li>
	            <li class="foot_menu03"><a href="index#store" class="link_store"><span>STORE</span></a></li>
	            <li class="foot_menu04"><a href="boardMain"><span>CONTACT</span></a></li>
	        </ul>
	    </div>
	   	<div class="foot_info">
	        <div class="foot_info_shop">
			            통신판매업신고번호 2017-서울용산-1285
			            제조영업신고 제2017-0033997호
			            <br>
			            생산지주소 서울시 용산구 이태원로26길 16-7, 지층(이태원동) CA2KE
			            연락처 010-4400-3441
			            <br>
			            대표자 윤창석
			            사업자등록번호 651-23-00530
			        상호명 케2크
	              @2015  CAFE CA2KE ALL RIGHTS RESERVED.
	              <br>
	              <br>
	        </div>
        </div>
     </div>
     
<script type="text/javascript" src="../assets/js/jquery.js"></script>
<script type="text/javascript" src="../assets/js/jcarousel/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="../assets/js/jcarousel/jcarousel.responsive.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>
