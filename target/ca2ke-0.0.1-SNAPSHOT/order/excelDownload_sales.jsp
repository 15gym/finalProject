<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
				<c:forEach var="dto" items="${list }">
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
					</tr>
				</c:forEach>
				<tfoot>
					<tr>
						<td colspan="9" class="tot">총    액</td>
						<td colspan="4">
							<fmt:formatNumber value="${total}" groupingUsed="true" />원</td>
					</tr>
				</tfoot>
			</c:if>
		</tbody>
		
	</table>	
	</body>
</html>
			