<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
</head>
<body>
	<h3>카테고리 수정</h3>
	<br /><hr /><br /><br />
	<form action="updateCategory" method="post" enctype="multipart/form-data">
		  <input type="hidden" value="${dto.i_category}" name="i_category"/>
		  <input type="hidden" value="${dto.category_image}" name="category_image"/>
		  <div class="form-group">
		    <label for="category_name">카테고리명</label>
		    <input type="text" class="form-control" name="category_name" 
			required="required" value="${dto.category_name}"/>
		  </div>
		  <div class="form-group">
		    <label for="category_ongoing">카테고리 상태</label>
			<select name="category_ongoing" required="required">
				<c:if test="${dto.category_ongoing == 0}">
					<option value="0" selected>활성화</option>
					<option value="1">비활성화</option>
				</c:if>
				<c:if test="${dto.category_ongoing == 1}">
					<option value="0">활성화</option>
					<option value="1" selected>비활성화</option>
				</c:if>
			</select>
		  </div>
		  <div class="form-group">
		    <label for="img">카테고리 이미지</label>
		    <input type="file" class="form-control-file" name="img"/>
		  </div>

		   
		  <div align="right">
		  	<input type="submit" class="btn btn-primary" value="수정"/>
		  	<input type="reset" value="다시작성" class="btn btn-default"/>
		  </div>
	</form>
</body>
</html>