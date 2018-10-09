<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
response.setHeader("Content-Type", "application/vnd.ms-xls");
response.setHeader("Content-Disposition", "inline; filename=saleslist.xls");
%>

	<div id="salesListFormatDiv"> 
	<h3>[조회 결과]</h3>

	<!-- 엑셀 다운로드 -->
	<form name="excel_form" id="excel_form" action="excelDown_saleslist" method="post" target="_blank">
		<input type="submit" value="Excel 다운로드" id="excelBtn" class="btn btn-success" style="margin-left:0">
		<input type="hidden" name="sales_cat" value="${sales_cat }">
		<input type="hidden" name="sales_item" value="${sales_item }">
		<input type="hidden" name="datepicker1" value="${datepicker1 }">
		<input type="hidden" name="datepicker2" value="${datepicker2 }">
		<input type="hidden" name="payment_str" value="${payment_str }">
		<input type="hidden" name="m_id" value="${m_id2 }">
		<input type="hidden" name="o_num" value="${o_num }">
	</form> 
	
	
	<table class="table-striped">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문일</th>
				<th>주문자ID</th>
				<th>주문자명</th>
				<th>카테고리</th>
				<th>상품명</th>
				<th>수량</th>
				<th>금액</th>
				<th>결제방법</th>
				<th>픽업<br>요청일</th>
				<th>픽업<br>요청시간</th>
				<th>실제<br>픽업시간</th>
				<th>픽업매장</th>
			</tr>
		</thead>
	
		<tbody>
			<c:if test="${listCount == 0 }">
				<tr>
					<th colspan="13" style="padding: 5px 10px;" >조회 결과가 없습니다.</th>
				<tr>
			</c:if>
					
			<c:if test="${listCount > 0}">
				<c:forEach var="dto" items="${salesList }">
					<c:set var="no" value="${no+1 }"/>
					<tr id="${no }">
						<td id="o_num">${dto.o_num }</td>
						<td>${dto.o_date }</td>
						<td>${dto.m_id }</td>
						<td>${dto.m_name }</td>
						<td>${dto.i_category }</td>
						<td>${dto.item_name }</td>
						<td>${dto.item_qty }</td>
						<td><fmt:formatNumber value="${dto.item_tot}" groupingUsed="true" />원</td>
						<td>${dto.payment }</td>
						<td>${dto.p_request_date }</td>
						<td>${dto.p_request_time }</td>
						<td>${dto.p_actual_time }</td>
						<td>${dto.p_store }</td>
						<c:set var="sum" value="${sum+dto.item_tot }"/>
					</tr>
				</c:forEach>
				<tfoot>
					<tr>
						<td colspan="9" class="tot">페이지 총 액</td>
						<td colspan="4">
							<fmt:formatNumber value="${sum}" groupingUsed="true" />원</td>
					</tr>
					<tr>
						<td colspan="9" class="tot">총    액</td>
						<td colspan="4">
							<fmt:formatNumber value="${total}" groupingUsed="true" />원</td>
					</tr>
				</tfoot>
			</c:if>
		</tbody>
		
	</table>	
			
	<!-- 페이징 처리 -->
	<div class="btn-group" role="group">
		<c:if test="${startPage>3 }">
			<input type="button" value="&lt;" onclick="location.href='getSalesList?pg='+${startPage-1}
				+'&sales_cat='+${sales_cat}+'&sales_item='+${sales_item }+'&datepicker1='+${datepicker1 }
				+'&datepicker2='+${datepicker2 }+'&payment_str='+${payment_str }+'&m_id='+'${m_id2 }'+'&o_num='+${o_num}"
				 class="btn btn-secondary paging">
		</c:if>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">	
			<c:if test="${pg == i }">
				<input type="button" value="${i }" onclick="location.href='getSalesList?pg='+${i}
					+'&sales_cat='+${sales_cat}+'&sales_item='+${sales_item }+'&datepicker1='+${datepicker1 }
					+'&datepicker2='+${datepicker2 }+'&payment_str='+${payment_str }+'&m_id='+'${m_id2 }'+'&o_num='+${o_num}"
					class="btn btn-secondary currentPaging">
			</c:if>
			<c:if test="${pg != i }">
				<input type="button" value="${i }" onclick="location.href='getSalesList?pg='+${i}
					+'&sales_cat='+${sales_cat}+'&sales_item='+${sales_item }+'&datepicker1='+${datepicker1 }
					+'&datepicker2='+${datepicker2}+'&payment_str='+${payment_str }+'&m_id='+'${m_id2 }'+'&o_num='+${o_num}"
					class="btn btn-secondary paging">
			</c:if>
		</c:forEach>
				
		<c:if test="${endPage < maxPage }">
			<input type="button" value="&gt;" onclick="location.href='getSalesList?pg='+${endPage+1}
				+'&sales_cat='+${sales_cat}+'&sales_item='+${sales_item }+'&datepicker1='+${datepicker1 }
				+'&datepicker2='+${datepicker2 }+'&payment_str='+${payment_str }+'&m_id='+'${m_id2 }'+'&o_num='+${o_num}"
				 class="btn btn-secondary paging">
		</c:if>
	</div>
	</div>