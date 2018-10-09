<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<%
response.setHeader("Content-Type", "application/vnd.ms-xls");
response.setHeader("Content-Disposition", "inline; filename=orderlist.xls");
%>

<meta charset="UTF-8">
<title>주문 관리 (픽업 완료되기 전의 주문만 출력됨) </title>
<link rel="stylesheet" href="../assets/css/orderlist.css"/>
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


<script type="text/javascript">
	$(function(){
		//주문 현황 변경 (select option 선택 시 바로 변경)
		/*
		$("#o_status").change(function(){
			var select = $("#o_status option:selected").val();
			var o_num = $("#o_num").text();
			//alert("select: "+select+"o_num:"+o_num);
			if (select>0){
				location.href="orderUpdate?o_status="+select+"&o_num="+o_num+"&pg=${pg}";				
			}
		});
		*/
		
		//업데이트버튼 클릭 시 - 주문현황 업데이트
		$(".updateBtn").click(function(){
			var tr_id = $(this).closest('tr').attr('id'); //클릭한 버튼의 tr 아이디 추출
			var select = $("#"+tr_id+" #o_status option:selected").val();
			var o_num = $("#"+tr_id+" #o_num").text();
			//alert("select: "+select+"o_num:"+o_num);
			if (select != 10){
				if (select ==6){ //픽업완료: 픽업시간 업데이트 & 주문 종료
					location.href="pickup?o_num="+o_num+"&pg=${pg}";		
				} else if (select==0){ //주문취소: 아이템수량 & 총액 0으로 변경
					location.href="orderCancel?o_num="+o_num+"&pg=${pg}";
					//if (${c_result ==1})	alert("주문 취소");
				} else{
					location.href="orderUpdate?o_status="+select+"&o_num="+o_num+"&pg=${pg}";		
					// if (${result==1}) alert("주문현황 업데이트");
				}
			}
			if (select == 10){
				alert("업데이트 항목을 선택해주세요");
			}
		});
		
		if (${o_num != 0}){
			if (${p_result==1}) alert(${o_num}+"번 - 주문 종료");			
			if (${c_result ==1})	alert(${o_num}+"번 - 주문 취소");
			if (${result==1}) alert(${o_num}+"번 - 주문현황 업데이트");			
		}
		
		
		
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
			alert("관리 페이지 - 주문관리 항목으로 이동합니다.");
			location.href='tab_order';
		});

	});
	
	
</script>
</head>
<body>
	<div id="orderlist">
		<h2>주문 관리</h2>

		<!-- 엑셀 다운로드 -->		
		<form name="excel_form" id="excel_form" action="excelDown_orderlist" method="post" target="_blank">
			<input type="submit" value="Excel 다운로드" id="excelBtn" class="btn btn-success" style="margin-left:0">
			<input type="hidden" name="orderlist" id="orderlist" value="${orderlist }">
		</form>
			
		<table class="table-bordered table-hover" id="orderlistTable">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>주문일</th>
					<th>주문자명</th>
					<th>연락처</th>
					<!--<th>카테고리</th>  -->
					<th>상품명</th>
					<th>수량</th>
					<th>금액</th>
					<th>픽업요청일</th>
					<th>픽업요청시간</th>
					<th>픽업매장</th>
					<th colspan="2">주문준비현황</th>
					<th>현황변경</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="dto" items="${orderlist }">
					<c:set var="no" value="${no+1 }"/>
					<tr id="${no }" align="center">
						<td id="o_num">${dto.o_num }</td>
						<td>${dto.o_date }</td>
						<td>${dto.m_name }</td>
						<td>${dto.m_phone }</td>
						<!-- <td>${dto.i_category }</td> -->
						<td>${dto.item_name }</td>
						<td>${dto.item_qty }</td>
						<td><fmt:formatNumber value="${dto.item_tot}" groupingUsed="true" />원</td>
						<td>${dto.p_request_date }</td>
						<td>${dto.p_request_time }</td>
						<td>${dto.p_store }</td>
						<td>
							<select id="o_status">
								<option value="10" class="s_option">--업데이트--</option>
								<option value="1"  class="s_option">입금대기</option>
								<option value="2"  class="s_option">입금완료</option>
								<option value="3"  class="s_option">준비 중</option>
								<option value="4"  class="s_option">준비완료</option>
								<option value="5"  class="s_option">픽업대기</option>
								<option value="6"  class="s_option">픽업완료</option>
								<option value="0"  class="s_option">주문취소</option>
							</select>
						</td>
						<td>${dto.o_comment }</td>
						<td>
							<!--<input type="text" id="p_actual_time" class="p_actual_time">-->
							<input type="button" value="업데이트" class="updateBtn">
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>	

		
		<!-- 페이징 처리 -->
		<div class="btn-group" role="group">
			<c:if test="${startPage>3 }">
				<input type="button" value="&lt;" onclick="location.href='currentOrder?pg='+${startPage-1}" class="btn btn-secondary paging">
			</c:if>
	
			<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">	
				<c:if test="${pg == i }">
					<input type="button" value="${i }" onclick="location.href='currentOrder?pg='+${i}" class="btn btn-secondary currentPaging">
				</c:if>
				<c:if test="${pg != i }">
					<input type="button" value="${i }" onclick="location.href='currentOrder?pg='+${i}" class="btn btn-secondary paging">
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage < maxPage }">
				<input type="button" value="&gt;" onclick="location.href='currentOrder?pg='+${endPage+1}" class="btn btn-secondary paging">
			</c:if>
		</div>
	</div>
</body>
</html>