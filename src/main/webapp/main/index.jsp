<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/ca2ke/assets/css/index.css"/>
<link rel="stylesheet" href="/ca2ke/assets/css/carousel.css"/>
<title>CA2KE</title>
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		/* 팝업창 설정 */
		var result = getCookie('popup');
		if (result == 'end') {
			//alert(result);
		   return false;
		}
		else {
		   window.open("popup.jsp", "a", "width=400, height=590, left=100, top=50");
		}
	});
	
	// Get cookie function
	function getCookie(name) { 
	   var cookieName = name + "=";
	   var x = 0;
	   while ( x <= document.cookie.length ) { 
	      var y = (x+cookieName.length); 
	      if ( document.cookie.substring( x, y ) == cookieName) { 
	         if ((lastChrCookie=document.cookie.indexOf(";", y)) == -1) 
	            lastChrCookie = document.cookie.length;
	         return decodeURI(document.cookie.substring(y, lastChrCookie));
	      }
	      x = document.cookie.indexOf(" ", x ) + 1; 
	      if ( x == 0 )
	         break; 
	      } 
	   return "";
	}
	
	
</script>
</head>
<body>
    <div id="header">
    	<div class="member">
			<ul>
				<c:if test="${sessionScope.admin != null}">
					<li><a href="../admin/tab_member" style="color: white">${sessionScope.admin}관리자페이지바로가기</a></li>
					<li> | </li>
					<li><a href="logOut"><span>LOGOUT</span></a></li>
				</c:if>	
				<c:if test="${sessionScope.memId == null && sessionScope.admin == null}">
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
		<img src="../img/main_title.png" alt="로고이미지" style="width:300px; height: 200px; margin-top: 100px;">
		<ul>
		    <li><a href="#about"><span>ABOUT</span></a></li>
		    <li><a href="#nav"><span>CAKE &amp;</span></a></li>
		    <li><a href="#store"><span>STORE</span></a></li>
		    <li><a href="boardMain"><span>CONTACT</span></a></li>
		</ul>
    </div>
    
    
    
    
    
    
    
    
    
    <div id="nav">
  		<div class="jcarousel">
			<ul  class="nav_ul">
				<c:forEach var="categorydto" items="${categorylist}">
					<c:if test="${categorydto.category_ongoing == 0}">
						<li><a href="../main/itemList?category=${categorydto.i_category}"><span>
							<img src="../storage/${categorydto.category_image}" alt="cake" style="width: 60px; height: 90px;"/>
							<br/>${categorydto.category_name}
						</span></a></li>
					</c:if>
				</c:forEach>
			</ul>			
            <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
            <a href="#" class="jcarousel-control-next">&rsaquo;</a>
		</div>
    </div>
  
  
  
  
  
  
  
  
  
  
    <div id="section">
	    	<div id="about">
	    		<div class="about_title">
	    			<img src="../img/contents_logo1.png" alt="logo1"/><br /><br />
	    			<span class="about_logo2">
	    				<img src="../img/contents_logo2.png" alt="logo2" style="width: 300px; height: 60px;"/>
	    			</span>
	    		</div>
	    		<div class="about_content">
	    			<div class="detail1">
	    				<img src="../img/content1.png" alt="1" />
	    				<h3>진심이 담긴 건강한 디저트를 연구합니다.</h3>
	    			</div>
	    			<div class="detail2">
	    				<img src="../img/content2.png" alt="2" />
	    				<h3>재료에 충실하고 그 고유의 개성을 살려<br> 
	    				최상의 맛을 내기 위해 연구합니다.</h3>
	    			</div>
	    			<div class="detail3">
	    				<img src="../img/content3.png" alt="3" />
	    				<h3>만드는 사람의 진심과 정성을 담고 <br>
	    				'HIGH QUALITY'를 지향합니다.</h3>
	    			</div>
	    		</div>
	   </div>
	    
    
    	
		<div id="store">
			<div class="store_title">
				<ul class="menu">
					<li>
						<img src="../img/img_map.png" alt="maptitle" style="width: 300px; height: 70px;"/>
						<ul class="sub">
							<li>종로점</li>
							<li>강남점</li>
							<li>가산점</li>
						</ul>
					</li>	
				</ul>






			</div>
			<div id="map" style="width:auto;height:400px;"></div>
			<div class="map_btn"> 
		        <span onclick="zoomIn()" class="map_btn1">+</span>  
		        <span onclick="zoomOut()" class="map_btn2">-</span>
		    </div>
		</div>
    </div>
    
    
    
    
    
    
    
    
    
       
     <div id="footer">
	     <div class="foot_nav">
	        <ul class="foot_menu" style="min-width: 1600px;">
	            <li class="foot_menu01"><a href="#about" class="link_about"><span>ABOUT</span></a></li>
	            <li class="foot_menu02"><a href="#nav" class="link_cake"><span>CAKE &amp;</span></a></li>
	            <li class="foot_menu03"><a href="#store" class="link_store"><span>STORE</span></a></li>
	            <li class="foot_menu04"><a href="boardMain"><span>CONTACT</span></a></li>
	        </ul>
	    </div>
	   	<div class="foot_info">
	        <div class="foot_info_shop">
			            통신판매업신고번호 2018-서울-1285
			            제조영업신고 제2017-0033997호
			            <br>
			            생산지주소 서울시 종로구 돈화문로 26길 16-7, 지층(단성사) CA2KE
			            연락처 010-1111-2222
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
    
    
    
    
    
<script type="text/javascript" src="/ca2ke/assets/js/jquery.js"></script>
<script type="text/javascript" src="/ca2ke/assets/js/jcarousel/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="/ca2ke/assets/js/jcarousel/jcarousel.responsive.js"></script>
<script type="text/javascript" src="/ca2ke/assets/js/index.js"></script>
<script type="text/javascript" 
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=117d1f1a8f683da7edfa43ace732ffd0"></script>
<script type="text/javascript" 
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=117d1f1a8f683da7edfa43ace732ffd0&libraries=services,clusterer,drawing">
</script>
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), 
	mapOption = { 
	    center: new daum.maps.LatLng(37.571008, 126.992385),
	    level: 7
	};
	
	var map = new daum.maps.Map(mapContainer, mapOption);
	map.setZoomable(false);
	var points = [
	    new daum.maps.LatLng(37.571008, 126.992385),
	    new daum.maps.LatLng(37.496669, 127.030146),
	    new daum.maps.LatLng(37.476828, 126.885760)
	];
		
	var bounds = new daum.maps.LatLngBounds();    
		
	var i, marker;
	var store = ["종로점", "강남점", "가산점"];
	
	for (i = 0; i < points.length; i++) {
	    marker =     new daum.maps.Marker({ position : points[i] });
	    marker.setMap(map);
		    
		bounds.extend(points[i]);
		var iwContent = '<div style="padding:5px;"><span style="text-align:center; font-weight:bold">' + store[i] + '</span></div>';
		var infowindow = new daum.maps.InfoWindow({
		    position : points[i], 
		    content : iwContent 
		});
		infowindow.open(map, marker); 
	}
		
	function setBounds() {
		map.setBounds(bounds);
	}
	
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    var latlng = mouseEvent.latLng;
	    panTo(latlng.getLat(), latlng.getLng());

	});
	
	function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	}

	function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	}
</script>
<script type="text/javascript">
	var xdata = new Array(3);
	xdata[0] = 37.571008;
	xdata[1] = 37.496669;
	xdata[2] = 37.476828;
	var ydata = new Array(3);
	ydata[0] = 126.992385;
	ydata[1] = 127.030146;
	ydata[2] = 126.885760;
	$(".sub>li").click(function() {
		var i = $(".sub>li").index(this);
		panTo(xdata[i], ydata[i]);
	});
</script>
</body>
</html>
