<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 목록</title>
<style type="text/css">
	table#managerTable{
		margin: 20px auto;
	}
	table#managerTable tr{
		text-align: center;
	}
	table#managerTable tr th{
		text-align: center;
	}
</style>
</head>
<body>
	
	<table id="managerTable" class="table table-striped">
	   <thead>
	   		<tr>
		        <th>관리자번호</th>
		        <th>관리자이름</th>
		        <th>관리자아이디</th> 
	        </tr> 
	   </thead>
	   
	   <tbody>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td scope="row">${dto.a_num}</td>
					<td scope="row">${dto.a_name}</td>
					<td scope="row">${dto.a_id}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>