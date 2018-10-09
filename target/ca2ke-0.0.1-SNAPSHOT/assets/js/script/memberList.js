function ListCheck(){
	var value = $("#where option:selected").val();
	if(value == "unify"){
		alert("검색할 기준을 정해주세요.");
		document.membersearchf.where.focus();
	}else if(value == "m_name"){
		if(document.membersearchf.keyword.value == ""){
			alert("검색할 회원명을 기입해주세요.");
			document.membersearchf.keyword.focus();
		}else{
			document.membersearchf.keywordCheck.value = "1";
			document.membersearchf.action = "memberNameANDId";
			document.membersearchf.submit();
		}
	}else if(value == "m_id"){
		if(document.membersearchf.keyword.value == ""){
			alert("검색할 회원아이디을 기입해주세요.");
			document.membersearchf.keyword.focus();
		}else{
			document.membersearchf.keywordCheck.value = "2";
			document.membersearchf.action="memberNameANDId";	
			document.membersearchf.submit();
		}
	}
	
}