<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--<link rel="stylesheet" href="../assets/css/bootstrap.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/script/faqScript.js"></script>

<style type="text/css">
	 .form-control {
		width: 90%;
	}
	.container2{
		width: 1000px;
		min-width: min-content;
		margin-left: auto;
		margin-right: auto;
		background-color: white;
		/*height: 1000px;*/
		padding: 30px 0;
	}
	div.center-block{
		text-align: center;
	}
</style>

</head>
<body>
<div class="container2"> 
	<form action="faqInsert" method="post" name="faqForm" id="faqForm">
		<div class="form-group"> 
		 <select name="where" id="where" class="form-control">
	           <option value="unify">--카테고리 선택--</option>
				 <c:forEach var="categoryDTO" items="${list }">
			            <option value="${categoryDTO.category_name }" >${categoryDTO.category_name }</option>
			     </c:forEach>
	     </select>
	       
	<%--      <input type="hidden" id="i_category" name="i_category" value="${result}"> --%>
	    </div>
		<div class="form-group"> 
			<label for="subject">FAQ 제목</label> 
			<input type="text" class="form-control" name ="faq_subject" id="faq_subject" placeholder="Enter title"> 
		</div> 
		<div class="form-group"> 
			<label for="content">FAQ 내용</label> 
			<textarea class="form-control" rows="10" name="faq_content" id="faq_content"></textarea> 
		</div>

	<div class="center-block"> 
		<input type="reset" value="다시쓰기">
		<input type="button" value="저장" onclick="faqInsert();"> 
	</div>
	
	</form>
	<center>
</div>
</body>
</html>