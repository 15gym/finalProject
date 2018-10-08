<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 (개인별)</title>
<link rel="stylesheet" href="../assets/css/orderlist.css"/>
<script type="text/javascript"src="../assets/js/jquery-3.3.1.min.js"></script>
<!-- common.css에 버튼 관련 css 추가

<style type="text/css">
	.currentPaging{
		background-color: #ffb497;
		border-color:#ffb497;
	}
	.currentPaging:hover, .currentPaging:active{
		background-color: #ff9c87;
		border-color:#ff9c87;
	}
	.currentPaging:focus {
	box-shadow: 0 0 0 3px rgba(255, 153, 86, .5)
	}
}
</style>  -->
<style type="text/css">
	div.btn-group{
		text-align: center;
	}
	table tbody tr{
		background-color:  white;
	}
	div#chart_div{
		padding-left: 200px;
	}
</style>
		
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawMultSeries);
	
	function drawMultSeries() {
	     // var data =  [6,3,1];
	      
	     var data = new google.visualization.DataTable();
	      data.addColumn('string', '월');
	      data.addColumn('number', '구매 횟수');
	      data.addColumn({type: 'string', role: 'style'}); 
	      
	      var today = new Date();
	      var mm1 = today.getMonth()+1;  //이번달
	      var mm2 = today.getMonth();	   //지난달
	      var mm3 = today.getMonth()-1;  //지지난달
	
	      data.addRows(3);
	      data.setCell(0,0, mm3+"월");
	      data.setCell(0,1, ${mmCount3});
	      data.setCell(0,2, "#ec8f6e");
	      data.setCell(1,0, mm2+"월");
	      data.setCell(1,1, ${mmCount2});
	      data.setCell(1,2, "#e6693e");
	      data.setCell(2,0, mm1+"월");
	      data.setCell(2,1, ${mmCount1});
	      data.setCell(2,2, "#e0440e");
	
	      var options = {
	        title: '최근 구매 횟수',
	        titleTextStyle: { 
	            color: 'black', 
	            fontName: 'arial', 
	            fontSize: 18 
	           }, 
	        legend: 'none', //범례 제거
	        fontSize: 15,
	        width: 500,
	        height: 300,
	        animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                startup: true,
                duration: 1000,
                easing: 'linear' },
           // colors: ['#e0440e', '#e6693e', '#ec8f6e'],
	        /*seriesType: 'bars'*/
	      };
		
	      var chart = new google.visualization.ColumnChart(
	        document.getElementById('chart_div'));
	      chart.draw(data, options);
	}
</script>
<script>
	$(function(){
		
		$(".reviewBtn").click(function(){

			 $(document).find(".review_desc").each(function() {
				 if($(this).parent().parent().css("display")=="none"){
				 	$(this).val("");
				 }
			 });
			 $(document).find(".review_grade option:selected").each(function() {
				 if($(this).parent().parent().parent().css("display")=="none"){
					 $(this).parent().find("option:eq(0)").prop("selected",true);
				 }
			 });
			 
			
			$(".review_title").css("display","none");
			$(".review").css("display","none");
			
			$(this).parent().parent().next().next().css("display","table-row");
			$(this).parent().parent().next().next().next().css("display","table-row");
			
		});
		
 		$(".reviewWrite").click(function(){
				var index = $(this).parent().parent().find(".review_grade option:selected");
				if(index.index()==0){
					alert("평점을 선택해주세요");
					index.focus();
					return false;
				}
				var desc = $(this).parent().parent().find(".review_desc");
				if(desc.val()==""){
					alert("상품평을 입력해주세요");
					desc.focus();
					return false;
				}
				$(this).submit();
		}); 
		
		
	});
</script>
</head>
<body>
	<div id="mylist">
		<h2>구매 목록</h2>
		
		<div id="chart_div" ></div>    
		<br>

		<table class = "table-bordered table-hover">
			<thead>
			<tr>
					<th>주문번호</th>
					<th>주문일</th>
					<th>상품명</th>
					<th>수량</th>
					<th>금액</th>
					<th>픽업요청일</th>
					<th>픽업요청시간</th>
					<th>픽업매장</th>
					<th>주문준비현황</th>
					<th>비고</th>
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${listCount == 0 }">
					<tr>
						<th colspan="10" style="padding: 5px 10px;" >조회 결과가 없습니다.</th>
					<tr>
				</c:if>
			
				<c:if test="${listCount > 0 }">
					<c:forEach var="dto" items="${myOrder}">
						<c:set var="no" value="${no+1 }"/>
						<tr id="${no }">
							<td id="o_num">${dto.o_num }</td>
							<td>${dto.o_date }</td>
							<td>${dto.item_name }</td>
							<td>${dto.item_qty }</td>
							<td><fmt:formatNumber value="${dto.item_tot}" groupingUsed="true" />원</td>
							<td>${dto.p_request_date }</td>
							<td>${dto.p_request_time }</td>
							<td>${dto.p_store }</td>
							<td>${dto.o_comment }</td>
							<td>
								<c:if test="${dto.o_status != 1 && dto.o_status!=2 && dto.o_status!=0 && dto.o_status!=6}">
									주문취소불가
								</c:if>
								<c:if test="${dto.o_status == 0 }">
								 	주문 취소
								</c:if>
								<c:if test="${dto.o_status==1 || dto.o_status==2 }">
									<input type="button" value="주문취소" class="cancelBtn" onclick="location.href='orderCancel_user?pg='+${pg}+ '&o_num='+${dto.o_num }">
								</c:if>
								<c:if test="${dto.o_status==6 }">
									<input type="button" value="상품평 등록" class="reviewBtn">
								</c:if>
							</td>
						</tr>
					<form id="reviewWrite" action="reviewWrite" method="post">
						<c:if test="${dto.o_status==6 }">
							<tr class="review_title" style="display:none"><!-- 1부터 시작 -->
								<td style="font-weight:bold;">평점</td>
								<td style="font-weight:bold;"colspan="9">내용</td>
							</tr>
							<tr class="review" style="display:none">
								<td style="padding-left:20px;">
									<select style="padding:0px;" class="review_grade"  name="rate">
										<option selected>--선택해주세요--</option>
										<option value="5">매우만족</option>
										<option value="4">만족</option>
										<option value="3">보통</option>
										<option value="2">불만족</option>
										<option value="1">매우불만족</option>
									</select>
								</td>
								<td colspan="8"><input type="text" class="review_desc" name="content" style="width:95%;" placeholder="상품평을 입력해주세요."></td>
								<td>
									<input type="hidden" name="item_num" value="${dto.item_num }">
									<input type="hidden" name="m_id" value="${dto.m_id }">
									<input type="submit" value="등록" class="reviewWrite">
								</td>
								
							</tr>
						</c:if>
						</form>
					</c:forEach>
				</c:if>
			</tbody>
		</table>	
		
		<!-- 페이징 처리 -->
		<div class="btn-group" role="group">
			<c:if test="${startPage>3 }">
				<input type="button" value="&lt;" onclick="location.href='myOrder?pg='+${startPage-1}" class="btn btn-secondary paging">
			</c:if>
	
			<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">	
				<c:if test="${pg == i }">
					<input type="button" value="${i }" onclick="location.href='myOrder?pg='+${i}" class="btn btn-secondary currentPaging">
				</c:if>
				<c:if test="${pg != i }">
					<input type="button" value="${i }" onclick="location.href='myOrder?pg='+${i}" class="btn btn-secondary paging">
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage < maxPage }">
				<input type="button" value="&gt;" onclick="location.href='myOrder?pg='+${endPage+1}" class="btn btn-secondary paging">
			</c:if>
		</div>
	</div>


</body>
</html>