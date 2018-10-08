var idck = 0;
function amdinjoinCheck(){
	if(document.adminjoinForm.a_id.value == ""){
		alert("관리자로 사용하실 아이디 입력해주세요.");
		document.adminjoinForm.a_id.focus();
		return false;
	}else if(document.adminjoinForm.a_pwd.value == ""){
		alert("관리자로 사용하실 패스워드 입력해주세요.");
		document.adminjoinForm.a_pwd.focus();
		return false;
	}else if(document.adminjoinForm.a_repwd.value == ""){
		alert("관리자로 사용하실 재확인 패스워드 입력해주세요.");
		document.adminjoinForm.a_repwd.focus();
		return false;
	}else if(document.adminjoinForm.a_name.value == ""){
		alert("관리자님 성함을 입력해주세요.");
		document.adminjoinForm.a_name.focus();
		return false;
	}else if(document.adminjoinForm.a_pwd.value != document.adminjoinForm.a_repwd.value){
		alert("비밀번호가 서로 맞지않습니다. 정확하게 입력해주세요.");
		document.adminjoinForm.a_pwd.value = "";
		document.adminjoinForm.a_repwd.value ="";
		document.adminjoinForm.a_pwd.focus();
		return false;
	}
	
	if(confirm("관리자가입을 하시겠습니까?")){
        if(document.adminjoinForm.joincheckbutton.disabled != true){
            alert('중복체크부터 해주세요');
            return false;
        }else{
        $("#adminjoinForm").submit();
        }
    }
}

$(function() {
    $("#joincheckbutton").click(function() {

    	var pattern1 = /(^[a-zA-Z])/;
    	var pattern2 = /([^a-zA-Z0-9-_])/;
    	var id = document.adminjoinForm.a_id.value.toLowerCase();
    	var pattern5 = id.indexOf("admin");
    	if(!pattern1.test(id)){
    	    alert("아이디의 첫글자는 영문이어야 합니다.");
    	    return false;
    	}else if(pattern2.test(id)){
    	    alert("아이디는 영문, 숫자, -, _ 만 사용할 수 있습니다.");
    	    return false;
    	}else if(pattern5 < 0){
    		
    	    alert("admin < 라는 단어를 포함해서 기입해주세요.");
    	    document.adminjoinForm.a_id.value = "";
    	    $("#a_id").focus();  
    	    return false;
    	}
        //userid 를 param.
        var a_id =  $("#a_id").val(); 
        $.ajax({
            async: true,
            type : 'POST',
            data : a_id,
            url : "adminjoinCheckId",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.exist == true) {
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요."); 
                    document.adminjoinForm.a_id.value = "";
                    $("#a_id").focus();    
                   
                } else {
                    alert("사용가능한 아이디입니다.");
                    document.adminjoinForm.joincheckbutton.disabled = true;
                    $("#a_pwd").focus();
                    idck = 1;
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
});