<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	//하루동안 안열기 쿠키 저장
	$(function() {
	   var popupClose = $('#popupChk');
	   // 체크박스 id
	
	   popupClose.click(function() {
	      setCookie("popup", "end" , 1);
	      // 하루동안이므로 1을 설정
	      window.close();
	      // 현재 열려있는 팝업은 닫으면서 쿠키값을 저장
	   });
	});
	
	/* setCookie function */
	function setCookie(cname, value, expire) {
	   var todayValue = new Date();
	   // 오늘 날짜를 변수에 저장

	   todayValue.setDate(todayValue.getDate() + expire);
	   document.cookie = cname + "=" + encodeURI(value) + "; expires=" + todayValue.toGMTString() + "; path=/;";
	}

</script>
</head>
<body>
	<img src="../img/popup_notice.jpg" alt="팝업창이미지" width="100%"><br>
	<label for="popupChk">
		<input type="checkbox" value="y" id="popupChk">오늘 하루 이 창 열지 않기</label>
</body>
</html>