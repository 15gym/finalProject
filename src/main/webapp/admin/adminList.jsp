<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<!--  
	<link rel="stylesheet" href="../assets/css/bootstrap.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> 
	-->
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/script/memberList.js"></script>
<script type="text/javascript">


if('${keywordCheck}' != null){
	window.onload=function(){
		if('${keywordCheck}' == 1){
			if('${list.size()}' == 0){
				alert("등록되어있지않은 이름입니다. 정확하게 입력바랍니다.");
				document.membersearchf.keyword.focus();
				return false;
			}
		}else if('${keywordCheck}' == 2){
			if('${list.size()}' == 0){
				alert("등록되어있지않은 아이디입니다. 정확하게 입력바랍니다.");
				document.membersearchf.keyword.focus();
				return false;
			}	
		}
	}
}
</script>
	<style type="text/css">
	.pagination {
	  display: inline-block;
	  padding-left: 0;
	  margin: 20px 0;
	  border-radius: 4px;
	}
	.pagination > li {
	  display: inline;
	}
	.pagination > li > a,
	.pagination > li > span {
	  position: relative;
	  float: left;
	  padding: 6px 12px;
	  margin-left: -1px;
	  line-height: 1.42857143;
	  color: #337ab7;
	  text-decoration: none;
	  background-color: #fff;
	  border: 1px solid #ddd;
	}
	.pagination > li:first-child > a,
	.pagination > li:first-child > span {
	  margin-left: 0;
	  border-top-left-radius: 4px;
	  border-bottom-left-radius: 4px;
	}
	.pagination > li:last-child > a,
	.pagination > li:last-child > span {
	  border-top-right-radius: 4px;
	  border-bottom-right-radius: 4px;
	}
	.pagination > li > a:hover,
	.pagination > li > span:hover,
	.pagination > li > a:focus,
	.pagination > li > span:focus {
	  color: #23527c;
	  background-color: #eee;
	  border-color: #ddd;
	}
	.pagination > .active > a,
	.pagination > .active > span,
	.pagination > .active > a:hover,
	.pagination > .active > span:hover,
	.pagination > .active > a:focus,
	.pagination > .active > span:focus {
	  z-index: 2;
	  color: #fff;
	  cursor: default;
	  background-color: #337ab7;
	  border-color: #337ab7;
	}
	.pagination > .disabled > span,
	.pagination > .disabled > span:hover,
	.pagination > .disabled > span:focus,
	.pagination > .disabled > a,
	.pagination > .disabled > a:hover,
	.pagination > .disabled > a:focus {
	  color: #777;
	  cursor: not-allowed;
	  background-color: #fff;
	  border-color: #ddd;
	}
}
	
</style>
</head>
<body>
<div>
    <form  id="membersearchf" name="membersearchf"  action="" method="post" class="form-inline" role="form">
        <input type="hidden" name="keywordCheck" id="keywordCheck" value="">
        <div>
	        <select name="where" id="where" class="form-control">
	            <option value="unify">--기준--</option>
	            <option value="m_name" id="m_name">이름</option>
	            <option value="m_id" id="m_id">아이디</option>
	        </select>
	    	<input type="text" name="keyword" id="keyword" placeholder="검색어" class="form-control">
	        <span >
	            <button type="reset"  class="btn btn-default pull">리셋<i ></i></button>
	            <button type="button"   onclick="ListCheck()" class="btn btn-default pull">검색<i></i></button>
	        </span>
        </div>
    </form>
</div>

<table id="membertable" class="table table-striped">
   <thead>
   		<tr>
	        <th>회원번호</th>
	        <th>회원이름</th>
	        <th>회원아이디</th>
	        <th>회원연락처</th>
	        <th>회원이메일</th>
	        <th>가입날짜</th>     
        </tr> 
   </thead>
   <tbody>
<c:forEach var="memberDTO" items="${list}">
		<tr>
			<td scope="row">${memberDTO.m_num}</td>
			<td scope="row">${memberDTO.m_name}</td>
			<td scope="row">${memberDTO.m_id}</td>
			<td scope="row">${memberDTO.m_phone}</td>
			<td scope="row">${memberDTO.m_email}</td>
			<td scope="row">${memberDTO.m_logtime}</td>
		</tr>
</c:forEach>
	</tbody>
</table>
<div class="text-center">
	<ul class="pagination">
    	<c:if test="${startPage > 3 }">
			<li><a id="paging" href="adminList?pg=${startPage-1}">이전</a></li>
		</c:if>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
			<c:if test="${i==pg }">
				<li><a id="currentPaging" href="adminList?pg=${i}" >${i}</a></li>
			</c:if>
			
			<c:if test="${i!=pg }">
				<li><a id="paging" href="adminList?pg=${i}" >${i}</a></li>
			</c:if>
		</c:forEach>	
		
		<c:if test="${endPage < totalP}">
			<li><a id="paging" href="adminList?pg=${endPage+1}">다음</a></li>
		</c:if>
	</ul> 
</div>

</body>
</html>