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
					<th>주문준비현황</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="dto" items="${list }">
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
						<td>${dto.o_comment }</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>	
</body>
</html>