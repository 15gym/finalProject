<%@page import="java.net.URLEncoder"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/font.css" />
<link rel="stylesheet" href="../assets/css/common2.css" />
<link rel="stylesheet" href="../assets/css/style.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>'
<!-- SA 자바스크립트 라이브러리 -->
<script type="text/javascript" src="../assets/js/jsbn.js"></script>
<script type="text/javascript" src="../assets/js/rsa.js"></script>
<script type="text/javascript" src="../assets/js/prng4.js"></script>
<script type="text/javascript" src="../assets/js/rng.js"></script>	



<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type="text/css">
body{
	width: 100%;
}
.input-login.id {
    background-image: url(../img/ico_login_id.png);
}
.input-login.pw {
    background-image: url(../img/ico_login_pw.png);
    margin-top: 14px;
}
.member-title-box.join {
    background-image: url(../img/ico_login_join.png);
}
.member-title-box.find-idpw {
    background-image: url(../img/ico_login_find_idpw.png);
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












	$(function() {
		$("#loginForm").submit(function(){
			alert("login try");
			var uid = $("#id").val();
			var pwd = $("#pwd").val();
			
			 
			var rsa = new RSAKey();
			rsa.setPublic($("#RSAModulus").val(), $("#RSAExponent").val());	 				
			$("#m_id").val(rsa.encrypt(uid));
			alert("login try..\nrsa id:::::::::::::::\n" + $("#m_id").val());
			pwd = SHA256($("#pwd").val());
			alert("login try..\nhashed password:::::::::::::::\n" + pwd);
			$("#m_pwd").val(rsa.encrypt(pwd));
			alert("login try..\nrsa password:::::::::::::::\n" + $("#m_pwd").val());
		});
	});
</script>
</head>
<body>
            <!-- sub page contents -->
			<div class="sub-contents-container">
                <div class="global-section su
                b-contents">
					<div class="sub-contents-box">

						<!-- login contents -->
						<p class="login-guide-text">
							ca2ke를 방문해주셔서 감사합니다.<br />
						</p>
						<form id="loginForm" name="loginForm" method="post" action="login" >
	
											
											
						<div class="login-box">
							<div class="login-form-box">
								<p class="login-id-guide-text"><span class="t-blue">아이디와 비밀번호를 </span>입력하세요.</p>
								<input type="hidden" id="RSAModulus" value="${RSAModulus}" />
								<input type="hidden" id="RSAExponent" value="${RSAExponent}" />
								<input type="hidden" id="m_id" name="m_id" value="" />
								<input type="hidden" id="m_pwd" name="m_pwd" value="" />
								<input type="text" id="id" name="id" class="input-login id" required="required"/>
								<input type="password" id="pwd" name="pwd" class="input-login pw" required="required"/>
								<div class="img-checkbox login-id-save">
									<label for="idSave">
										<i class="img-checkbox-item"></i>
									</label>
								</div>
								<button type="submit" id="loginbtn" class="btn xl font-l redwine">로그인</button>
							</div>
							</form>
							<div class="login-member-box">
								<div class="member-join-box">
									<p class="member-title-box join">
										<span class="member-title-text">아직 회원이 아니신가요?</span>
										<em class="member-subtitle-text">가입 후 다양한 서비스와 혜택을 제공 받으실 수 있습니다.</em>
									</p>
									<div class="member-btn-box">
										<a href="joinForm" class="btn l font-m black pd-m">회원가입</a>
									</div>
								</div>
								<div class="member-find-idpw-box">
									<p class="member-title-box find-idpw">
										<span class="member-title-text">회원정보를 잊으셨나요?</span>
										<em class="member-subtitle-text">아이디 또는 비밀번호 정보를 찾으실 수 있습니다.</em>
									</p>
									<div class="member-btn-box">
										<a href="findIdForm" class="btn l font-m nobg pd-s">아이디/비밀번호 찾기</a>
									</div>
								</div>
							</div>
						<div>
							<center>
						
							
							
					<!--네이버  -->
				<%
                String clientId = "lmCBeDlP2a554rAl3fWq";
                String redirectURI = URLEncoder.encode("http://localhost:8080/ca2ke/naverCallback", "utf-8");
                SecureRandom random = new SecureRandom();
                String state = new BigInteger(130, random).toString();
                String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
                apiURL += "&client_id=" + clientId;
                apiURL += "&redirect_uri=" + redirectURI;
                apiURL += "&state=" + state;
                session.setAttribute("state", state);
      			 %>
       			 <a href="<%=apiURL%>"><img height="50" src="/ca2ke/img/naver_btn.PNG"/></a>
       			 
       			 
       			<!--카카오  -->
       			<%
       			 String clientId2 = "02f6761717ff9cd1a40e5d18441aed2e";
               String redirectURI2 = URLEncoder.encode("http://localhost:8080/ca2ke/member/kakaLogin", "utf-8");
            SecureRandom random2 = new SecureRandom();
                String state2 = new BigInteger(130, random2).toString(); 
                String apiURL2 = "https://kauth.kakao.com/oauth/authorize?response_type=code";
                apiURL2 += "&client_id=" + clientId2;
                apiURL2 += "&redirect_uri=" + redirectURI2;
      			 %>
       	 <a href="<%=apiURL2%>"><img src="../img/kakao_account_login_btn_medium_narrow.png"/></a> 
			
						</div>
						<!-- //login contents -->
					</div>
                </div>
            <!-- //sub page contents -->

</body>
</html>
