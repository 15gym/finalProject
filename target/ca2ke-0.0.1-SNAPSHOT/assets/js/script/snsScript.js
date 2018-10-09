var joinCheck = 0;

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
			joinCheck = 1;
		}else if(a.length == 10){
			num = num.replace(/[^0-9]/g,'');
			var tmp ='';
			tmp += num.substr(0,3);
			tmp += '-';
			tmp += num.substr(3,3);
			tmp += '-';
			tmp += num.substr(6,4);
			$("#m_phone").val(tmp);
			joinCheck = 1;
		}else if(a.length <= 10 || a.length <= 12){
			alert("존재하지않는 전화번호입니다. 다시 입력해주세요.");
			document.snsJoinForm.m_phone.value = "";
			$("#m_phone").focus();
		}

}

function joinButton(){
	if(confirm("회원가입을 하시겠습니까?")){
        if(joinCheck != 1){
            alert('휴대폰번호양식이 맞는지 확인해주세요.');
            return false;
        }else{
        $("#snsJoinForm").submit();
        }
    }
}