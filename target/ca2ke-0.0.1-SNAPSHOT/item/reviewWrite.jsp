<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">
window.onload = function(){
	if(${reviewResult}==1){
		alert("상품평등록 완료");
		location.href="../main/myOrder";
	}else{
		alert("상품 등록에 실패하였습니다.");
	}
}
</script>