function idFind(){
	window.open("../member/findCheckIdForm.jsp", "" , "width=600 height=350 left=500 top=200");
	return false;
}

function idCheckButton(){
	if(document.FindCheckId.m_email.value == ""){
		alert("이메일을 작성해주세요.");
		document.FindCheckId.m_email.focus();
	}else if(document.FindCheckId.m_name.value == ""){
		alert("성함을 작성해주세요.");
		document.FindCheckId.m_name.focus();
	}else{
		document.FindCheckId.action="../main/findId";
		document.FindCheckId.submit();
	}
}

function pwFind(){
	window.open("../member/findCheckPwForm.jsp","", "width=600 height=350 left=500 top=200");
	return false;
}

function pwCheckButton(){
	if(document.FindCheckPw.m_email.value == ""){
		alert("이메일을 작성해주세요.");
		document.FindCheckPw.m_email.focus();
	}else if(document.FindCheckPw.m_id.value == ""){
		alert("아이디를 작성해주세요.");
		document.FindCheckPw.m_id.focus();
	}else{
		document.FindCheckPw.action="../main/findPw";
		document.FindCheckPw.submit();
	}
}