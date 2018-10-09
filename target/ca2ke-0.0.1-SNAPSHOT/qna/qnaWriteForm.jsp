<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 작성</title>
<link rel="stylesheet" href="../assets/css/qnalist.css"/>
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
 	$(function(){
 		
 		//제목 byte 카운트
		$('#subject').keyup(function(){			
			bytesHandler(this);
	    });
 		
 		//[등록] 버튼 클릭 시 입력 검사
 		$("input[type='button']").click(function(){
 			if ($("#subject").val()==""){
 				alert("제목을 입력하세요");
 				$('#subject').focus();
 				return false;
 			} 
 			if ($("#qna_type option:selected").index()==0){
 				alert("문의유형을 선택하세요");
 				$("#qna_type").focus();
 				return false;
 			}
 			if ($("#content").val()==""){
 				alert("문의내용을 입력하세요");
 				$("#content").focus();
 				return false;
 			}
			$("#qnaWriteForm").submit();
 		});
	});
	
 	
 	//제목 byte 카운트
	function getTextLength(str) {
		var len = 0;
		
		for (var i = 0; i < str.length; i++) {
			if (escape(str.charAt(i)).length == 6) {
				len++;
			}
				len++;
			}
		return len;
	}
	
	function bytesHandler(obj){
		var text = $(obj).val();
 		if (getTextLength(text)>50){
			$("#subject").value($("#subject").value.substring(0, 50));
		} 
		$('#count').html(getTextLength(text)+"byte");
	}
 
</script>
</head>

<body>
	<div class="title">문의 게시판</div>
		<div id="qnaWrite" style="padding : 30px;">
		<h2>문의글 작성</h2>

		<form id="qnaWriteForm" method="post" action="qnaSubmit">
			<input type="hidden" name="m_id" value="${sessionScope.memId }">
			<table id="qnaWriteTable">
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" id="subject" class="form-control" maxlength="50">
					<span id="count"></span></td>
				</tr>

				<tr>
					<th>문의유형</th>
					<td>
						<select name="qna_type" id="qna_type">
							<option>--선택하세요--</option>
							<option value="상품">상품</option>
							<option value="주문">주문</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>공개 여부</th>
					<td>
						<label><input type="radio" name="qna_public" id="qna_public" value="y" checked>&nbsp;&nbsp;공개</label>
						<label><input type="radio" name="qna_public" id="qna_public" value="n">&nbsp;&nbsp;비공개</label>
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td><textarea name="content" id="content" class="form-control" rows="10" cols="15"></textarea></td>
				</tr>
			</table>

			<input type="button" value="문의글 등록" class="btn btn-default">
			<input type="reset" value="다시 작성" class="btn btn-default">

		</form>
	</div>

</body>
</html>