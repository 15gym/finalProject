<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 관리 (픽업 완료된 주문만 표시됨)</title>
<link rel="stylesheet" href="../assets/css/orderlist.css"/>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
	table th{
		text-align: center;
	}

</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	$(function () {
						
		//주문번호 - 숫자만 입력 가능
		$('#o_num').keypress(function (event) {
			if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) {
				alert("주문 번호는 숫자만 입력하실 수 있습니다");
				event.preventDefault();
			}
		});
		
		
		//카테고리 별 상품 목록 가져오기
		$("#sales_cat").change(function(){
			
			if ($("#sales_cat option:selected").index() > 0){
				
				var i_category = $("#sales_cat option:selected").val();
				//alert(i_category);
				$("#sales_item").empty();
				var default_option = $("<option value='0'>--상품 선택--</option>");
				$("#sales_item").append(default_option);
				$("#sales_item").val("0").prop("selected", true);
				
				 $.ajax({
					type: "post",
					url: "getItemList",
					data: {"i_category": i_category},
					async: true,
					dataType: "text",
					cache: false,
					success: function(data){
						//alert("성공!");
						 $(data).find('item').each(function(){
							 var item_num=$(this).find("item_num").text();
							 var item_name=$(this).find("item_name").text();
							 var option = $("<option value='"+item_num+"'>"+item_name+"</option>");
							 $("#sales_item").append(option);
							 
						});
					}, error: function(xhr, textStatus, errorThrown){
						//alert("실패!"+xhr.status);
						//$("#sales_item").append("<option>"+xhr.status+"</option>");
					}
				});

			} else{
				$("#sales_item").empty();
				var default_option = $("<option value='0'>--상품 선택--</option>");
				$("#sales_item").append(default_option);
				$("#sales_item").val("0").prop("selected", true)
			}
		}); //카테고리 별 상품 목록 가져오기 끝
		
		
		//DATEPICKER 기본 설정
		$("#datepicker1, #datepicker2").datepicker({ //매출 검색 시작일
			showOn:"button", //우측에 달력 아이콘 출력
            buttonImage:"../img/order/btn_cale.gif", 
            buttonImageOnly:true, //inputbox 뒤에 달력 아이콘만 표시 ('...' 표시 생략)
			maxDate: "+0D",  //오늘 이후의 날짜 선택 불가
			changeMonth: true,
			changeYear: true,
			dateFormat: "yymmdd"
		});
		
		//DATEPICKER 달력 이미지 설정
		$("img.ui-datepicker-trigger").attr("style", "margin-left:2px; vertical-align:middle; cursor: Pointer;");
		
		//'조회' 버튼 클릭 시
		$("#btn_submit").click(function(){

			//입력값 없을 시 값
			//i_category:0, item_num:0, date1:, date2:, pay_card:, pay_account:
			//var i_category = $("#sales_cat option:selected").val();
			//var item_num = $("#sales_item option:selected").val();
			var date1 = $("#datepicker1").val(); //시작일
			var date2 = $("#datepicker2").val(); //종료일
			
			if(date1!="" && date2==""){
				alert("종료일을 선택해주세요");
				$("#datepicker2").focus();
				return false;
			}
			if(date1=="" && date2!=""){
				alert("시작일을 선택해주세요");
				$("#datepicker1").focus();
				return false;
			}
			if(date1 > date2) {
				alert("시작일은 종료일보다 빨라야 합니다");
				$("#datepicker1").focus();
				return false;
			}
			
			//결제 방법을 체크하지 않은 경우
			if ($(":checkbox[name='payment']:checked").length==0){
				alert("검색할 결제 방법을 1개 이상 선택해주세요");
				$("#payment1").focus();
				return false;
			}
			
			//결제 조건을 1개 이상 체크했을 경우 체크박스 값 가져오기
			// - 카드 결제: 1, 현금 결제: 2, 모두: 12
			var payment = "";
			$(":checkbox[name='payment']:checked").each(function(){
				payment += $(this).val();
			});
 			
			//alert("i_cat:"+i_category+", item_num:"+item_num+", date1:"+date1+", date2:"+date2
				//	+", pay_card:"+pay_card+", pay_account:"+pay_account );
			

			$("#sales_form").submit();
		});

	});
</script>

</head>
<body>
	<h2>매출 관리</h2>
	<div id="salesList">
		<form id="sales_form" method="post" action="getSalesList">
			<span>* 카테고리, 상품, 기간을 선택하지 않을 시 모든 항목이 조회됩니다.</span><br>
			<input type="button" id="btn_submit" value="조회" class="btn btn-primary">
			<table id="sales_table">
				<tr>
					<th class="left">카테고리</th>
					<td class="right">
						<select id="sales_cat" name="sales_cat">
							<option value="0">--카테고리 선택--</option>
							<c:forEach var="catDTO" items="${catList }">
								<option value="${catDTO.i_category}">${catDTO.category_name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<th class="left">상품</th>
					<td class="right">
						<select id="sales_item" name="sales_item">
							<option value='0'>--상품 선택--</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th class="left">기간</th>
					<td class="right">
						<input type="text" name="datepicker1" id="datepicker1"> ~
						<input type="text" name="datepicker2" id="datepicker2">
					</td>
				</tr>
				
				<tr>
					<th class="left">결제방법</th>
					<td class="right">
						<label><input type="checkbox" name="payment" id="payment1" value="1" checked>신용카드</label>
						<label><input type="checkbox" name="payment" id="payment2" value="2" checked>현금</label>
					</td>
				</tr>
				
				<tr>
					<th class="left">회원 아이디</th>
					<td class="right"><input type="text" name="m_id" id="m_id"></td>
				</tr>
				<tr>
					<th class="left">주문 번호</th>
					<td class="right"><input type="text" name="o_num" id="o_num"></td>
				</tr>
			</table>
		</form>
		
		


		<c:if test="${salesDisplay != nulll}">
			<div id="search_condition">
				<h3>[조회 조건]</h3>
				<table id="sales_condition">
					<tr>
						<th class="title">카테고리</th>
						<td>
							<c:if test="${sales_cat==0 }">전 항목</c:if>
							<c:if test="${sales_cat!=0 }">
								<c:forEach var="catDTO" items="${catList }">
									<c:if test="${catDTO.i_category == sales_cat }" >
										${catDTO.category_name}
									</c:if>
								</c:forEach>
							</c:if>
						</td>
						<th class="title">상품</th>
						<td>
							<c:if test="${sales_item==0 }">전 항목</c:if>
							<c:if test="${sales_item!=0 }">
								<c:forEach var="itemDTO" items="${itemList }">
									<c:if test="${itemDTO.item_num == sales_item }" >
										${itemDTO.item_name}
									</c:if>
								</c:forEach>
							</c:if>
						</td>
						<th class="title">기간</th>
						<td>
							<c:if test="${datepicker1==0 }">전체 기간</c:if>
							<c:if test="${datepicker1!=0 }">
								${datepicker1 }~${datepicker2 }
							</c:if>
						</td>
					</tr>
					<tr>
						<th class="title">결제방법</th>
						<td>
							<c:if test="${payment_str=='12' || payment_str==' 12'}">전 항목</c:if>
							<c:if test="${payment_str=='1' || payment_str==' 1'}">신용카드</c:if>
							<c:if test="${payment_str=='2' || payment_str==' 2'}">현금</c:if>
						</td>
						<th class="title">아이디</th>
						<td>
							<c:if test="${m_id2=='0' }">-</c:if>
							<c:if test="${m_id2!='0' }">${m_id2 } 포함</c:if>
						</td>
						<th class="title">주문번호</th>
						<td>
							<c:if test="${o_num==0 }">-</c:if>
							<c:if test="${o_num!=0 }">${o_num }</c:if>
						</td>
					</tr>
					<tr>
						<th class="title">조회 결과</th>
						<td  colspan="5" id="resultCount">총 ${listCount }건</td>
					</tr>
				</table>
			</div>

			<jsp:include page="${salesDisplay }"/>

		
		</c:if>
		
	</div>
</body>
</html>