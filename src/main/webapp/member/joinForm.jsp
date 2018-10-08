<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/font.css" />
<link rel="stylesheet" href="../assets/css/common.css" />
<link rel="stylesheet" href="../assets/css/style.css" />
<link rel="stylesheet" href="../assets/css/resolution.css" media="only screen and (-webkit-min-device-pixel-ratio: 3)" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/script/joinScript.js"></script>
<!-- SA 자바스크립트 라이브러리 -->
<script type="text/javascript" src="../assets/js/jsbn.js"></script>
<script type="text/javascript" src="../assets/js/rsa.js"></script>
<script type="text/javascript" src="../assets/js/prng4.js"></script>
<script type="text/javascript" src="../assets/js/rng.js"></script>	
<style>
.form-select-sign {
    display: inline-block;
    vertical-align: middle;
    box-sizing: border-box;
    border: 1px solid #ccc;
    width: 20%;
    min-width: 115px;	
}
.form-table{
	width: 100%;
}
</style>

<script type="text/javascript">




/**
*
*  Secure Hash Algorithm (SHA256)
*  http://www.webtoolkit.info/
*
*  Original code by Angel Marin, Paul Johnston.
*
**/
  
function SHA256(s){
  
    var chrsz   = 8;
    var hexcase = 0;
  
    function safe_add (x, y) {
        var lsw = (x & 0xFFFF) + (y & 0xFFFF);
        var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
        return (msw << 16) | (lsw & 0xFFFF);
    }
  
    function S (X, n) { return ( X >>> n ) | (X << (32 - n)); }
    function R (X, n) { return ( X >>> n ); }
    function Ch(x, y, z) { return ((x & y) ^ ((~x) & z)); }
    function Maj(x, y, z) { return ((x & y) ^ (x & z) ^ (y & z)); }
    function Sigma0256(x) { return (S(x, 2) ^ S(x, 13) ^ S(x, 22)); }
    function Sigma1256(x) { return (S(x, 6) ^ S(x, 11) ^ S(x, 25)); }
    function Gamma0256(x) { return (S(x, 7) ^ S(x, 18) ^ R(x, 3)); }
    function Gamma1256(x) { return (S(x, 17) ^ S(x, 19) ^ R(x, 10)); }
  
    function core_sha256 (m, l) {
         
        var K = new Array(0x428A2F98, 0x71374491, 0xB5C0FBCF, 0xE9B5DBA5, 0x3956C25B, 0x59F111F1,
            0x923F82A4, 0xAB1C5ED5, 0xD807AA98, 0x12835B01, 0x243185BE, 0x550C7DC3,
            0x72BE5D74, 0x80DEB1FE, 0x9BDC06A7, 0xC19BF174, 0xE49B69C1, 0xEFBE4786,
            0xFC19DC6, 0x240CA1CC, 0x2DE92C6F, 0x4A7484AA, 0x5CB0A9DC, 0x76F988DA,
            0x983E5152, 0xA831C66D, 0xB00327C8, 0xBF597FC7, 0xC6E00BF3, 0xD5A79147,
            0x6CA6351, 0x14292967, 0x27B70A85, 0x2E1B2138, 0x4D2C6DFC, 0x53380D13,
            0x650A7354, 0x766A0ABB, 0x81C2C92E, 0x92722C85, 0xA2BFE8A1, 0xA81A664B,
            0xC24B8B70, 0xC76C51A3, 0xD192E819, 0xD6990624, 0xF40E3585, 0x106AA070,
            0x19A4C116, 0x1E376C08, 0x2748774C, 0x34B0BCB5, 0x391C0CB3, 0x4ED8AA4A,
            0x5B9CCA4F, 0x682E6FF3, 0x748F82EE, 0x78A5636F, 0x84C87814, 0x8CC70208,
            0x90BEFFFA, 0xA4506CEB, 0xBEF9A3F7, 0xC67178F2);

        var HASH = new Array(0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19);

        var W = new Array(64);
        var a, b, c, d, e, f, g, h, i, j;
        var T1, T2;
  
        m[l >> 5] |= 0x80 << (24 - l % 32);
        m[((l + 64 >> 9) << 4) + 15] = l;
  
        for ( var i = 0; i<m.length; i+=16 ) {
            a = HASH[0];
            b = HASH[1];
            c = HASH[2];
            d = HASH[3];
            e = HASH[4];
            f = HASH[5];
            g = HASH[6];
            h = HASH[7];
  
            for ( var j = 0; j<64; j++) {
                if (j < 16) W[j] = m[j + i];
                else W[j] = safe_add(safe_add(safe_add(Gamma1256(W[j - 2]), W[j - 7]), Gamma0256(W[j - 15])), W[j - 16]);
  
                T1 = safe_add(safe_add(safe_add(safe_add(h, Sigma1256(e)), Ch(e, f, g)), K[j]), W[j]);
                T2 = safe_add(Sigma0256(a), Maj(a, b, c));
  
                h = g;
                g = f;
                f = e;
                e = safe_add(d, T1);
                d = c;
                c = b;
                b = a;
                a = safe_add(T1, T2);
            }
  
            HASH[0] = safe_add(a, HASH[0]);
            HASH[1] = safe_add(b, HASH[1]);
            HASH[2] = safe_add(c, HASH[2]);
            HASH[3] = safe_add(d, HASH[3]);
            HASH[4] = safe_add(e, HASH[4]);
            HASH[5] = safe_add(f, HASH[5]);
            HASH[6] = safe_add(g, HASH[6]);
            HASH[7] = safe_add(h, HASH[7]);
        }
        return HASH;
    }
  
    function str2binb (str) {
        var bin = Array();
        var mask = (1 << chrsz) - 1;
        for(var i = 0; i < str.length * chrsz; i += chrsz) {
            bin[i>>5] |= (str.charCodeAt(i / chrsz) & mask) << (24 - i%32);
        }
        return bin;
    }
  
    function Utf8Encode(string) {
        string = string.replace(/\r\n/g,"\n");
        var utftext = "";
  
        for (var n = 0; n < string.length; n++) {
  
            var c = string.charCodeAt(n);
  
            if (c < 128) {
                utftext += String.fromCharCode(c);
            }
            else if((c > 127) && (c < 2048)) {
                utftext += String.fromCharCode((c >> 6) | 192);
                utftext += String.fromCharCode((c & 63) | 128);
            }
            else {
                utftext += String.fromCharCode((c >> 12) | 224);
                utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                utftext += String.fromCharCode((c & 63) | 128);
            }
  
        }
  
        return utftext;
    }
  
    function binb2hex (binarray) {
        var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
        var str = "";
        for(var i = 0; i < binarray.length * 4; i++) {
            str += hex_tab.charAt((binarray[i>>2] >> ((3 - i%4)*8+4)) & 0xF) +
            hex_tab.charAt((binarray[i>>2] >> ((3 - i%4)*8  )) & 0xF);
        }
        return str;
    }
  
    s = Utf8Encode(s);
    return binb2hex(core_sha256(str2binb(s), s.length * chrsz));
  
}



function joinCheck(){

	if(document.joinForm.m_id.value == ""){
		alert("아이디를 입력해주세요.");
		document.joinForm.m_id.focus();
		return false;
	}else if(document.joinForm.m_pwd.value == ""){
		alert("비밀번호를 입력해주세요.");
		document.joinForm.m_pwd.focus();
		return false;
	}else if(document.joinForm.m_repwd.value == ""){
		alert("비밀번호를 재입력해주세요.");
		document.joinForm.m_repwd.focus();
		return false;
	}else if(document.joinForm.m_name.value == ""){
		alert("성함을 입력해주세요.");
		document.joinForm.m_name.focus();
		return false;
	}else if(document.joinForm.m_phone.value == ""){
		alert("연락처를 입력해주세요.");
		document.joinForm.m_phone.focus();
		return false;
	}else if(document.joinForm.m_pwd.value != document.joinForm.m_repwd.value ){
		alert("비밀번호가 서로 맞지 않습니다.");
		document.joinForm.m_pwd.value = "";
		document.joinForm.m_repwd.value ="";
		document.joinForm.m_pwd.focus();
		return false;
	}
	
	
	//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	if(confirm("회원가입을 하시겠습니까?")){
        if(idck==0){
            alert('중복체크부터 해주세요');
            return false;
        }else if(emailck == 0 || !document.joinForm.sendCheckEmail.disabled ){
        	alert("이메일 인증부터하세요.");
        	document.joinForm.sendCheckEmail.focus();
        }else{
	        $("#m_pwd").val(SHA256($("#m_pwd").val()));
	        alert("회원가입 과정..\nhash::::::::::\n"+$("#m_pwd").val());
			 
			var rsa = new RSAKey();
			rsa.setPublic($("#RSAModulus").val(), $("#RSAExponent").val());	 				
			$("#m_pwd").val(rsa.encrypt($("#m_pwd").val()));
			alert("회원가입 과정..\nrsa:::::::::::\n" + $("#m_pwd").val());
	        
	        
	        
	        $("#joinForm").submit();
        }
    }

	
}
</script>
</head>
<body>
<form action="join" name="joinForm" id="joinForm" method="post">
								<input type="hidden" id="RSAModulus" value="${RSAModulus}" />
								<input type="hidden" id="RSAExponent" value="${RSAExponent}" />
<!-- sub page contents -->
<div class="sub-contents-container">
	<div class="global-section sub-contents">
		
		<div class="sub-contents-box">
			<h3 class="contents-title">회원정보 입력</h3>
            <div class="form-box">
            	<p class="essential-text t-green">* 필수 입력 사항입니다.</p>
           
            <table class="form-table">
           		<tbody>
                	<tr>
               			<th scope="row"><label for="memberId">아이디</label> <span class="t-green">*</span></th>
                    	<td>
		                    <div class="input-box">
								<input type="text" id="m_id" name="m_id" placeholder="아이디를 입력해주세요." class="input l" />
								 <button type="button"  class="btn l font-l redwine pd-m" name="checkbutton" id="checkbutton">중복확인</button>
								 
		                    </div>
                        </td>
                    </tr>
                    <tr>
                    	<th scope="row"><label for="memberPass">비밀번호</label> <span class="t-green">*</span></th>
                        <td>
                        	<div class="input-box">
                        	
								<div class="mobile-block">
                                	<input type="password" id="m_pwd" name="m_pwd" class="input l" placeholder="비밀번호를 입력해주세요."/>
                                </div>
                                
								<div class="mobile-block">
									<span class="input-guide-text inline t-gray"></span>
								</div>
								
							</div>
                        </td>
                    </tr>
                    <tr>
                    	<th scope="row"><label for="memberPassConfirm">재입력</label> <span class="t-green">*</span></th>
                        <td>
                        	<div class="input-box">
                        	
									<div class="mobile-block">
                                    	<input type="password" id="m_repwd" name="m_repwd" class="input l" />
                                    </div>
                                    
									<div class="mobile-block">
										<span class="input-guide-text inline t-green">비밀번호를 한번 더 입력해 주세요.</span>
									</div>
                        	</div>
                        </td>
                    </tr>
                    <tr>
                    	<th scope="row">이름</th>
                        <td><input type="text" name="m_name" class="input l" placeholder="성함을 입력해주세요."></td>
                    </tr>
                    <tr>
                    	<th scope="row">휴대폰번호</th>
                    	<td><input type="text" name="m_phone" id="m_phone" placeholder="휴대폰번호 입력시 '-'를 제외하고 입력해주세요." class="input l"></td>
                    </tr>
                    <tr>
                    	<th scope="row">이메일</th>
  						<td colspan="1">
  						<input type="email" name="m_email" id="m_email" class="input l" placeholder="이메일 형식에 맞춰주세요.">
  						<button type="button"  class="btn l font-l redwine pd-m" id="sendCheckEmail" name="sendCheckEmail" >이메일인증</button>
  						<label id="hiddenlabel" ></label>
  						</td>
                    </tr>
         		 </tbody>
      		</table>
  		</div>
			<div class="form-btn-box">
				<button type="button" class="btn l font-l redwine pd-m" onclick="joinCheck();">
				완&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;료</button>
				<button type="reset" class="btn l font-l nobg pd-m">다시작성</button>
			</div>	
		</div>
	</div>
</div>
</form>
</body>
</html>