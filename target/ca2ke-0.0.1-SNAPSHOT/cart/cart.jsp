<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="../assets/css/common.css"/>
<link rel="stylesheet" href="../assets/css/cart.css"/>


</head>
<body>
	<div class="container">
		<div class="title">장바구니</div>
		<div id="cartNotice">
			<span id="warning">· 상품정보가 변경된 경우 주문이 불가할 수 있습니다. 주문 변경 시 반드시 확인해주시길 바랍니다.</span>
		</div>
		
		<form id="cartTable" method="post" action="orderReady">
		    <input type="hidden" name="m_id" value="${sessionScope.memId }">
		    <input type="hidden" name="m_name" value="${sessionScope.memName }">
			<table class="cart_table">
				<tr>
					<th class="table1" colspan="2">상품 정보</th>
					<th class="table2">수량</th>
					<th class="table3">상품금액</th>
					<th class="table4">픽업날짜</th>
					<th class="table5">주문금액</th>
				</tr>
				
				<c:if test="${cartTotal == 0 }">
					<tr>
						<td colspan="6">장바구니에 추가된 항목이 없습니다.</td>
					</tr>
				</c:if>
				
				<c:if test="${cartTotal > 0 }">
					<c:forEach var="dto" items="${cartList}">
	 					<c:set var="no" value="${no+1}"/>
						<tr id="${no }">
							<td style="width:100px;">
								<img src="../storage/${dto.item_image }" alt="상품이미지">
							</td>
							<td>${dto.item_name }</td>
							<td>
								<input type="text" id="item_qty" value="${dto.item_qty }"><br>
								<input type="button" class="changeBtn" value="개수 수정">
							</td>
							<td><fmt:formatNumber value="${dto.item_price}" groupingUsed="true" />원</td>
							<td>${dto.p_request_date }<br>${dto.p_request_time}</td>
							<td><fmt:formatNumber value="${dto.item_tot}" groupingUsed="true" />원
								<input type="button" class="deleteBtn" value="삭제"> <!--장바구니# 기준으로 삭제  -->
								<input type="hidden"  id="cart_num" value="${dto.cart_num }">
								<input type="hidden"  id="item_num" value="${dto.item_num }">
							</td>
						</tr>
						<c:set var="sum" value="${sum+dto.item_tot }"/>
					</c:forEach>
					
					<tr>
						<td class="sum_cart" colspan="5">결제금액</td>
						<td class="sum_cart"> <fmt:formatNumber value="${sum}" groupingUsed="true" />원</td>
					</tr>
				</c:if>
			</table>
			
			<div id="buttonLine">
				<input type="button" class="btn-primary" value="주문하기">
				<input type="button" class="btn-default" value="홈" onclick="location.href='index.html'">
			</div>
		</form>
	</div>
	
	
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		//주문 수량 - 숫자만 입력 가능
		$('#item_qty').keypress(function (event) {
			if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) {
				alert("숫자만 입력하실 수 있습니다");
				event.preventDefault();
			}
		});
		
		$(".changeBtn").click(function(){
			//alert(${no});
			//var tr_num = $("#tr")
			var tr_id = $(this).closest('tr').attr('id'); //클릭한 버튼의 tr 아이디 추출
			var cart_num = $("#"+tr_id+" #cart_num").val();
			var item_qty = $("#"+tr_id+" #item_qty").val();
			var item_num= $("#"+tr_id+" #item_num").val();
			//alert("cart_num:"+cart_num+" item_qty:"+item_qty+" item_num:"+item_num);
			location.href="changeQty?cart_num="+cart_num+"&item_qty="+item_qty+"&item_num="+item_num;
		});
		
		$(".deleteBtn").click(function(){
			var tr_id = $(this).closest('tr').attr('id'); //클릭한 버튼의 tr 아이디 추출
			var cart_num = $("#"+tr_id+" #cart_num").val();
			location.href="deleteCart?cart_num="+cart_num;
		});
		
		if(${change_result==1}){
			alert("주문 수량이 수정되었습니다.");
		}
		if(${delete_result==1}){
			alert("선택하신 주문이 삭제되었습니다.");
		}
		
		$(".btn-primary").click(function(){
			if(${cartTotal == 0}){
				alert("결제할 항목이 없습니다");
				return false;
			} else{
				$("#cartTable").submit();
			}
		});
	});
</script>
</body>
</html>