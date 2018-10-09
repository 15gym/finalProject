<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>

<link rel="stylesheet" href="../assets/css/common.css" />
<link rel="stylesheet" href="../assets/css/order_ready.css" />

<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		//결제방법 선택
		$("input[type='radio']:eq(0)").change(function(){
			$("#paymentDetail").empty();
		    $("#paymentDetail").load("../cart/paymentDetail.jsp #card", function(){
		    	$(this).show();
		    	//한글 깨질 경우 server.xml의 Connector connectionTimeout라인에 URIEncoding="UTF-8" 추가할 것
		    });
		});
		
		$("input[type='radio']:eq(1)").change(function(){
			$("#paymentDetail").empty();
		    $("#paymentDetail").load("../cart/paymentDetail.jsp #account", function(){
		    	$(this).show();
		    });
		});
		
		
		//결제하기 버튼 클릭 시 입력값 검사
		$("input[type='button']:eq(1)").click(function(){
			if (!$("input[name='paymentType']").is(":checked")){
				alert("결제 방법을 선택해주세요.");
				$("input[name='paymentType']:eq(0)").focus();
				return false;
			}
			if ($("#paymentDetail input[name='cardType'").length){
				
				if (!$("#paymentDetail input[name='cardType']").is(":checked")){
					alert("카드 구분을 선택해주세요.");
					$("#paymentDetail input[name='cardType']:eq(0)").focus();
					return false;
				}
			}
			if ($("#paymentDetail select option:selected").index()==0){
				alert("세부사항을 선택해주세요.");
				$("#paymentDetail select option:eq(0)").focus();
				return false;
			} else if ($("#paymentDetail select option:selected").index()>0){ //카드/은행명 전달
				var bank = $("#paymentDetail select option:selected").text();
				$("#bank").val(bank);
			}
			
			if (!$("input[type='checkbox']:eq(0)").is(":checked")){
				alert("결제 진행을 동의해주세요.");
				$("input[type='checkbox']:eq(0)").focus();
				return false;
			}
			
			$("#orderReady").submit();
		});
	});
</script>
</head>

<body>
	<div class="container">
		<div class="title">주문/결제</div>
		<div id="cart" class="inner">
		
		<h2>주문 목록</h2>
		
		<table class="cart_table">
			<tr>
				<th class="table1" colspan="2">상품 정보</th>
				<th class="table2">수량</th>
				<th class="table3">상품금액</th>
				<th class="table4">픽업날짜</th>
				<th class="table5">주문금액</th>
			</tr>
			
			<c:forEach var="dto" items="${cartList}">
				<tr>
					<td style="width:100px;">
						<img src="../storage/${dto.item_image }" alt="상품이미지">
					</td>
					<td>${dto.item_name }</td>
					<td>${dto.item_qty }개<br>
					</td>
					<td><fmt:formatNumber value="${dto.item_price}" groupingUsed="true" />원</td>
					<td>${dto.p_request_date }<br>${dto.p_request_time}</td>
					<td><fmt:formatNumber value="${dto.item_tot}" groupingUsed="true" />원
					</td>
				</tr>
				<c:set var="sum" value="${sum+dto.item_tot }"/>
			</c:forEach>
			
			<tr>
				<td class="sum_cart" colspan="5">결제금액</td>
				<td class="sum_cart"> <fmt:formatNumber value="${sum}" groupingUsed="true" />원</td>
			</tr>
		</table>

		
	<br><hr><br>
		<h2>주문자 정보
		<input type="button" value="정보수정" class="btn-bordered" onclick="location.href='modifyViewForm'">
		</h2>
		
		<div id="orderInfo">
			<label>회원이름</label><span>${memberDTO.m_name }</span><br>
			<label>핸드폰번호</label><span>${memberDTO.m_phone }</span><br>
		</div>  <!-- #orderInfo 끝  -->
		
	<br><hr><br>
		
		<h2>결제 방법</h2>
		<div id="payment">
			<form id="orderReady" method="post" action="orderConfirm">
				<input type="hidden" name="m_id" value="${sessionScope.memId }">
				<input type="hidden" name="sum" value="${sum }">
				<label><input type="radio" name="paymentType" id="paymentType" value="card">&nbsp;&nbsp;신용카드</label>
				<label><input type="radio" name="paymentType" id="paymentType" value="account">&nbsp;&nbsp;무통장입금</label>
			
			<div id="paymentDetail"><label id="default"></label></div>  <!--jquery로 출력  -->
			<input type="hidden" name="bank" id="bank" value="">
			
			<label id="orderCheck"><input type="checkbox" name="orderOk" id="orderOk">&nbsp;결제 진행 동의</label>
	
			</form>
		</div><!-- #payment div 끝-->
			
	<div class="button_group">
		<input type="button" value="결제하기" class="btn-primary">
		<input type="button" value="홈" onclick="" class="btn-default" onclick="location.href='index.jsp'">
	</div> <!-- .button_group div 끝 -->
	</div> <!-- .inner div 끝 -->
	</div> <!-- .container div 끝 -->
	
	
</body>
</html>