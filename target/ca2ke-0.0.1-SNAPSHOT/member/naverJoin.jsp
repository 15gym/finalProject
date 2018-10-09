<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title></title>
</head>
<body>
	<form action="naverJoin" method="post">
		<input type="hidden" name="m_id" value="${sns_id}"/>
		<input type="hidden" name="m_name" value="${m_name}"/>
		<input type="hidden" name="m_email" value="${m_email}"/>
		<label for="m_phone">핸드폰 번호</label>
		<input type="text" name="m_phone" required="required"/>
		<input type="submit" value="가입하기"/>
	</form>
</body>
</html>
