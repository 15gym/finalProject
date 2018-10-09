function noticeInsert(){
	if(document.noticeForm.notice_subject.value == ""){
		alert("공지사항 제목을 입력해주세요.");
		document.noticeForm.notice_subject.focus();
		return false;
	}
	if(document.noticeForm.notice_content.value == ""){
		alert("공지사항 내용을 입력해주세요.");
		document.noticeForm.notice_content.focus();
		return false;
	}
	
	if(document.noticeForm.notice_content.value != "" && document.noticeForm.notice_subject.value != ""){
		document.noticeForm.submit();
	}
	
}

$(function(){
	
	//삭제 클릭
	$(".deleteButton").click(function(){
		var check = confirm("정말로 삭제하시겠습니까?");
		if(check){
			$("#deleteForm").submit();
		}else{
			return false;
		}
	});
	
	//공지사항 제목 클릭
	$(".notice_subject").click(function(){
		$(this).closest("tr").next().toggle();
	});
	
	
	//첫번째 항목을 제외한 공지사항 닫기
	$(".notice_content").closest("tr").hide();
		if($(".notice_content").closest("tr").eq(0)){
		$(".notice_content").closest("tr").eq(0).show();
	}
});



