<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
<style type="text/css">
	div#btnDiv{
		padding-bottom: 100px;
		
	}
</style>
</head>
<body>
	<div style="padding: 50px;"><h3>카테고리 추가</h3></div>
	<form action="addCategory" method="post" enctype="multipart/form-data" id="categoryForm">
		  <div class="form-group">
		    <label for="category_name">카테고리명</label>
		    <input type="text" class="form-control" name="category_name" required="required" style="width: 400px;">
		  </div>
		  <div class="form-group">
		    <label for="img">카테고리 이미지</label>
		    <input type="file" class="form-control-file" name="img" required="required">
		  </div>

		   
		  <div align="center" id="btnDiv">
		  	<input type="submit" class="btn btn-primary" value="추가"/>
		  	<input type="reset" value="다시작성" class="btn btn-default"/>
		  </div>
	</form>
</body>
</html>