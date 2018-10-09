var idck = 0;
var emailck = 0;


$(document).on('click','#sendCheckEmail', function(){
	var m_email = $("#m_email").val();
	$.ajax({
		async: true,
		url:"authSend",
		type: "POST",
		data:{'m_email' : m_email},
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		dataType : "json",
		
		success : function(data){
			if(data.result == true){
				alert("사용불가능한 이메일입니다.");
				document.joinForm.m_email.value = "";
				document.joinForm.m_email.focus();
			}else{
				alert("사용가능한 이메일입니다.");
				window.open("emailCheckForm?authNum=" + data.authNum ,"", "width=530 height=260 left=500 top=200");
				emailck = 1;
			}
			
		},
		error: function(XMLHttpRequest, textStatus,errorThrown){
			alert("서버와의 통신이 원활하지 않습니다.\n 다시 시도해주세요.");
		}
	});
});

function eventSuccess(data){
	w.location.href ="emailCheckForm";
}


$(document).ready(function(){
	$("#m_phone").blur(function(){
		var num = $("#m_phone").val();
		
		// 숫자만입력했는지 안했는지 확인하는 정규식
		var regExp2 = /^[0-9]+$/;
		if(!regExp2.test(num)){
			alert("공백 또는 숫자가아닌 다른문자는 넣을수 없습니다.");
			document.joinForm.m_phone.value = "";
			$("#m_phone").focus();
			return false;
		}
		blur(num);
	});	
	$("#m_phone").click(function(){
		var num = $("#m_phone").val();
		focus(num);
	});
	
	$("#m_repwd").blur(function(){
		if(document.joinForm.m_pwd.value != document.joinForm.m_repwd.value){
			alert("비밀번호가 서로 맞지 않습니다.");
			document.joinForm.m_pwd.value = "";
			document.joinForm.m_repwd.value ="";
			document.joinForm.m_pwd.focus();
			return false;
		}else{
			
		}
	});

});

function focus(num){
	num = num.replace(/[^0-9]/g,'');
			$("#m_phone").val(num);
}

function blur(num){
		var a = "";
		a = $("#m_phone").val();
		if(a.length == 11){
			num = num.replace(/[^0-9]/g,'');
			var tmp ='';
			tmp += num.substr(0,3);
			tmp += '-';
			tmp += num.substr(3,4);
			tmp += '-';
			tmp += num.substr(7);
			$("#m_phone").val(tmp);	
		}else if(a.length == 10){
			num = num.replace(/[^0-9]/g,'');
			var tmp ='';
			tmp += num.substr(0,3);
			tmp += '-';
			tmp += num.substr(3,3);
			tmp += '-';
			tmp += num.substr(6,4);
			$("#m_phone").val(tmp);	
		}else if(a.length <= 10 || a.length <= 12){
			alert("존재하지않는 전화번호입니다. 다시 입력해주세요.");
			document.joinForm.m_phone.value = "";
			$("#m_phone").focus();
		}

}

$(function() {
    $("#checkbutton").click(function() {

    	var pattern1 = /(^[a-zA-Z])/;
    	var pattern2 = /([^a-zA-Z0-9-_])/; 	
    	var id = document.joinForm.m_id.value.toLowerCase();
    	var pattern3 = id.indexOf("admin"); 
    	
    	if(!pattern1.test(id)){
    	    alert("아이디의 첫글자는 영문이어야 합니다.");
    	    return false;
    	}else if(pattern2.test(id)){
    	    alert("아이디는 영문, 숫자, -, _ 만 사용할 수 있습니다.");
    	    return false;
    	}else if(pattern3 >= 0 ){
    		alert("admin(대소문자)이 들어가면 사용할수 없습니다.");
    	    document.joinForm.m_id.value ="";
            $("#m_id").focus();
            return false;
    	}
        //userid 를 param.
        var m_id =  $("#m_id").val(); 
        $.ajax({
            async: true,
            type : 'POST',
            data : m_id,
            url : "joinCheckId",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.exist == true) {
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");    
                    document.joinForm.m_id.value ="";
                    $("#m_id").focus();        
                } else {
                    alert("사용가능한 아이디입니다.");
                    document.joinForm.checkbutton.disabled = true; //[중복버튼] 동작 불가
                    document.joinForm.m_id.setAttribute("readonly", "true");  //아이디 수정 불가
                    /*$("#checkbutton").disabled.val = true;*/
                    $("#m_pwd").focus();
                    idck = 1;
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
});


