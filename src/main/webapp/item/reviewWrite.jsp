<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">
window.onload = function(){
	if(${reviewResult}==1){
		alert("��ǰ���� �Ϸ�");
		location.href="../main/myOrder";
	}else{
		alert("��ǰ ��Ͽ� �����Ͽ����ϴ�.");
	}
}
</script>