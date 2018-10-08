function faqInsert(){
	var index = $("#where option").index($("#where option:selected"));
	
	if(index == 0){
		alert("카테고리를 선택해주세요.");
		document.faqForm.where.focus();
		return false;
	}
	if(document.faqForm.faq_subject.value == ""){
		alert("FAQ 제목을 입력해주세요.");
		document.faqForm.faq_subject.focus();
		return false;
	}
	if(document.faqForm.faq_content.value == ""){
		alert("FAQ 내용을 입력해주세요.");
		document.faqForm.faq_content.focus();
	}else{
		document.faqForm.submit();
	}
	
}

$(function(){
	//FAQ 제목 클릭 시 - 글 열리거나 닫힘
	$(".faq_subject").click(function(){
		$(this).closest("tr").next().toggle();
	});
	
	//FAQ 삭제 클릭 시 - 글 삭제
	$(".deleteButton").click(function(){
		var check = confirm("정말로 삭제하시겠습니까?");
		if(check){
			$("#deleteForm").submit();
		}else{
			return false;
		}
	});

	//첫번째 항목을 제외한 FAQ닫기
	$(".faqContent").closest("tr").hide();
		if($(".faqContent").closest("tr").eq(0)){
		$(".faqContent").closest("tr").eq(0).show();
	}
});