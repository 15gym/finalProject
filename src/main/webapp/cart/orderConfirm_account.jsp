<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료 화면 - 무통장 입금</title>
<link rel="stylesheet" href="../assets/css/common.css"/>
<link rel="stylesheet" href="../assets/css/order_confirm.css"/>
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		//backspace 버튼을 통한 뒤로가기 막기
		var killBackSpace = function(e) { 
			e = e ? e : window.event; 
			var t = e.target ? e.target : e.srcElement ? e.srcElement : null; 
			if(t && t.tagName && (t.type && /(password)|(text)|(file)/.test(t.type.toLowerCase())) 
				|| t.tagName.toLowerCase() == 'textarea') { 
				return true; 
			} 
			
			var k = e.keyCode ? e.keyCode : e.which ? e.which : null;
			if(k == 8) { 
				if(e.preventDefault) { 
					e.preventDefault(); 
				} 
				return false; 
			} return true; 
		};
		
		if(typeof document.addEventListener != 'undefined') { 
			document.addEventListener('keydown', killBackSpace, false); 
		}else if(typeof document.attachEvent != 'undefined') { 
			document.attachEvent('onkeydown', killBackSpace); 
		}else { 
			if(document.onkeydown != null) { 
				var oldOnkeydown = document.onkeydown; 
				document.onkeydown = function(e) { 
					oldOnkeydown(e);
					killBackSpace(e); 
				}; 
			}else { 
				document.onkeydown = killBackSpace;
			} 
		}

		
		//브라우저 back 버튼 막기
		history.pushState(null, document.title, location.href); 
		window.addEventListener('popstate', function(event) {
			history.pushState(null, document.title, location.href);
			alert("이전 페이지로 이동하실 수 없습니다.\n홈으로 이동합니다.");
			location.href='index';
		});
	});

</script>
</head>
<body>
	<div class="container">
		<div class="title">결제 완료</div>
		<div class="inner">
			<img src="../img/cart/o_confirm_a.png" alt="결제완료이미지"><br>
			
			<span id="warning">*입금이 완료 후 상품 준비가 시작됩니다.</span>
			<table class="confirm">
				<tr>
					<th class="td1">주문자명</th>
					<td class="td2">${sessionScope.memName }님</td>
				</tr>
				<tr>
					<th class="td1">입금정보</td>
					<td class="td2">
						<span>${bank }</span>&nbsp;&nbsp;
						<span>계좌번호:</span> ${account_num }&nbsp;&nbsp;
						<span>입금액:</span> <fmt:formatNumber value="${sum}" groupingUsed="true" />원
					</td>
				</tr>
			
				<!--
				<c:forEach var="buyItem" items="${buyList }">
					<tr>
						<th class="td1">주문상품</td>
						<td class="td2">${buyItem.item_name}</td>
					</tr>
					<tr>
						<th class="td1">주문금액</td>
						<td class="td2"><fmt:formatNumber value="${buyItem.item_tot}" groupingUsed="true" />원</td>
					</tr>
				</c:forEach>
		
					<tr>
						<td class="td1">총 주문금액</td>
						<td class="td2">${sum }원</td>
					</tr>
				-->	
				
			</table>
			
			<div class="button_group">
				<input type="button" value="주문내역 보기" class="btn-primary"  onclick="location.href='myOrder'">
				<input type="button" value="홈" class="btn-default" onclick="location.href='../main/index.jsp'">
			</div>
			
		</div>
	</div>
</body>
</html>