<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../assets/css/itemAddForm.css">

<script type="text/javascript"src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
 $("#itemAddButton").click(function(){
  var check;
  
  check = $("#category_list");
  if(check.children().index("option:selected")==0){
   alert("��ǰ ī�װ��� ���� �������ּ���.")
   check.eq(0).focus();
   return false;
  }
  
  check = $("#item_image");
  if(check.val()==""){
   alert("��ǰ �̹����� ���� �������ּ���.");
   check.focus();
   return false;
  }
  check = $("#item_name");
  if(check.val()==""){
   alert("��ǰ �̸��� �Է��� �ּ���.");
   check.focus();
   return false;
  }
  check = $("#item_price");
  if(check.val()==""){
   alert("��ǰ ������ �Է��� �ּ���.");
   check.focus();
   return false;
  }
  check = $("#item_desc");
  if(check.text()==""){
   alert("��ǰ ������ �Է��� �ּ���.");
   check.focus();
   return false;
  }
  
  $("#itemAddForm").submit(); 
  
 });
 
 
});
</script>


</head>
<body>
<div id="itemAddForm_section">
	<div id="itemAddForm_container">
	<form action="itemAdd" method="post" id="itemAddForm" name="itemAddForm" enctype="multipart/form-data">
	<div id="input">
		<h3 id="category">ī�װ�</h3>
		<select id ="category_list" name="i_category">
			<option selected>--- �����ϼ��� ---</option>
			<c:forEach var="categoryList" items="${categorylist}">
			<option value="${categoryList.i_category }">${categoryList.category_name }</option>
			</c:forEach>
		</select>
		<h3>������ �̹���</h3>
		<input type="file" id="item_image" name="img">
		<h3>��ǰ��</h3>
		<input type="text" id="item_name" name="item_name">
		<h3>��ǰ����</h3>
		<input type="number" id="item_price" name="item_price">
		<h3>��ǰ����</h3>
		<textarea name="item_desc" id="item_desc" cols="90" rows="10"></textarea>
		
		<input type="button" id="itemAddButton" value="��ǰ���" class="myButton">
		<input type="reset" value="�ٽ��ۼ�" class="myButton">
	</div>
	</form>
	</div>
</div>
</body>
</html>