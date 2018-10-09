<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
</head>
<body>
	<div id="header" align="left" style="padding: 50px;">
		<h3>카테고리 관리</h3>
	</div>
	<br/>
	<br/>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">카테고리명</th>
				<th scope="col">마크</th>
				<th scope="col">상태</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.i_category}</td>
				<td>${dto.category_name}</td>
				<td>
					<img 
						src="../storage/${dto.category_image}" 
						alt="이미지"
						style="width:80px;height:80px;"
					/>
				</td>
				<c:if test="${dto.category_ongoing == 0}">
					<td>활성화</td>
				</c:if>
				<c:if test="${dto.category_ongoing == 1}">
					<td>비활성화</td>
				</c:if>
				<td>
					<form action="updateCategoryForm">
						<input type="hidden" value="${dto.i_category}" name="req"/>
						<input type="submit" value='수정' class="btn btn-default">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
