<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/buyList.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function () { 
	
    //item_delete �Լ�
    var item_delete = function(){
    	if(!confirm("�׸��� �����Ͻðڽ��ϱ�?")){
    		return false;
    	}
    	
    	$(this).parent().parent().detach();
		 container_min_height = container_min_height - 50;
	     if(review_min_height < container_min_height){
			 $("#container").css("min-height",container_min_height+"px");
	     }
		 
    	var price_temp = 0;
		 $(".buyList").find("[name='item_price']").each(function() {
			price_temp += Number($(this).val()); 
		 });
		 $("#total_money").children().text(price_temp);
    	
    } 
  	//item_delete �Լ� end
    //minus_delete �Լ�
     var minus_delete = function(){
		 $(".buyList").find("[name='item_qty']").each(function() {
			 
			var item_qty = Number($(this).val());
			
			if(item_qty==0){
				$(this).parent().parent().detach();
				 container_min_height = container_min_height - 50;
			     if(review_min_height < container_min_height){
					 $("#container").css("min-height",container_min_height+"px");
			     }

			}
		 });	 
    }
    //minus_delete �Լ� end
    
  	  
       


    
    $(document).on("click", ".delete", item_delete);
    
    $(document).on("click", ".item .minus", function(){
		var cnt = $(this).next().val();
		var cntSum = Number(cnt) - 1;
		var check = true;
		
		if(cntSum==0){
			check = confirm("�׸��� �����Ͻðڽ��ϱ�?");
		}
		
		if(check){
			$(this).next().val(cntSum);
			var price = $(this).next().next().next().attr("data-default");
			var priceMul = Number(price) * cntSum;
			$(this).next().next().next().val(priceMul);	 
		
			 var price_temp = 0;
			 $(".buyList").find("[name='item_price']").each(function() {
				price_temp += Number($(this).val()); 
			 });
			 $("#total_money").children().text(price_temp);
		}
		
		$(minus_delete);
		
    }); 
    
    
     $(document).on("click", ".item .plus", function(){
			var cnt = $(this).prev().val();
		var cntSum = Number(cnt) + 1;
	    $(this).prev().val(cntSum);
		
		var price = $(this).next().attr("data-default");
		var priceMul = Number(price) * cntSum;
		$(this).next().val(priceMul); 
		
		 var price_temp = 0;
		 $(".buyList").find("[name='item_price']").each(function() {
			price_temp += Number($(this).val()); 
		 });
		 $("#total_money").children().text(price_temp);
    });
    
    
    
     $("#addButton").click(function(){
    	 		if(${sessionScope.memId ==null}){
    	 			alert("���� �α����� �ּ���.");
    	 			return false;
    	 		}
    	 		
    			if($("#total_money").children().text()=="0"){
    				alert("��ǰ�� ���� �������ּ���");
    				return false;
    			}
		
				var p_request_date = $(".buyList").find("[name='p_request_date']").val();
				if(p_request_date==""){
					alert("�Ⱦ� ��¥�� �������ּ���");
					return false;
				}
				
        		var p_request_time = $(".buyList").find("[name='p_request_time']").val();
        		var p_request_time_index = $("#p_request_time option").index($("#p_request_time option:selected" ));
        		if(p_request_time_index==0){
           			alert("�Ⱦ��ð��� �������ּ���");
        			$(".buyList").find("[name='p_request_time']").focus();
        			return false;
        		}
				
        		var p_store = $("#p_store").val();
        		var p_store_index = $("#p_store option").index($("#p_store option:selected" ));
        		if(p_store_index==0){
        			alert("�Ⱦ������� �������ּ���");
        			$(".buyList").find("[name='p_store']").focus();
        			return false;
        		}

        		var item_name;
        		var item_num ;
        		var item_qty;
        		var item_tot;
    			
			   $(".buyList").find("[name='item_name']").each(function() {
				
				item_name = $(this).val();
				item_num = $(this).parent().next().children().val();
				item_qty = $(this).parent().next().children().next().next().val();
				item_tot = $(this).parent().next().children().next().next().next().next().val();
				


          	 $.ajax({
	               type : 'post',
	               url : 'cartAdd?category=${param.category}',
	               data : {
	             	   "p_store": p_store,
	            	   "p_request_date": p_request_date,
	            	   "p_request_time": p_request_time,
	            	   "item_num": item_num,
	            	   "item_qty": item_qty,
	            	   "item_tot": item_tot,
	            	   "item_num" : item_num
            	   
               },

               success : function(json){
                   
               },
               error: function(xhr, status, error){
            	   alert(error);
            	   return false;
               }
           });
           
		}); 
			   
			  alert("��ٱ��� ��� ����");
			  location.reload();
    });
     
 	//DATEPICKER �⺻ ����
	$("#p_request_date").datepicker({
		minDate: +2,
    	maxDate: +10,
    	dateFormat: 'yy-mm-dd' 
	}); 
 	
  	$("#resetButton").click(function(){   
		 $("#total_money").children().text("0");
 		 $("#ADD_PRODUCT").empty();  
 		$("#ADD_PRODUCT").append("<span>ADD PRODUCT</span>");
  	}); 


});

</script>

</head>
<body>
	<div class="buyList">
		<form action="cartAdd?category=${param.category}" method="post" name="cartAddForm">
			<ul>
				<li id="ADD_PRODUCT">
					<span>ADD PRODUCT</span>
				</li>

				<li id="total_money"><!-- ��Ż���� ���÷��̸�-->
				Total : <span><strong>0</strong></span>
				</li>
				<li>�Ⱦ���û��¥</li>
				<li><input class="buyButton" type="text" name="p_request_date" id="p_request_date"></li>
				<li>�Ⱦ���û�ð�</li>
				<li>
					<select class="buyButton" id="p_request_time" name="p_request_time">
						<option selected>--- �����ϼ��� ---</option>
						<option value="12:00 ~ 13:00">12:00 ~ 13:00</option>
						<option value="13:00 ~ 14:00">13:00 ~ 14:00</option>
						<option value="14:00 ~ 15:00">14:00 ~ 15:00</option>
						<option value="15:00 ~ 16:00">15:00 ~ 16:00</option>
						<option value="16:00 ~ 17:00">16:00 ~ 17:00</option>
						<option value="17:00 ~ 18:00">17:00 ~ 18:00</option>
					</select>
				</li>
				<li>�Ⱦ��� ����</li>
					<li>
						<select class="buyButton" id="p_store" name="p_store">
							<option selected>--- �����ϼ��� ---</option>
							<option value="������">������</option>
							<option value="������">������</option>
							<option value="������">������</option>
						</select>
					</li>
				
		
				<li>
				<input type="button" value="��ٱ��� ���" id="addButton">
				</li>
				<li>
				<input type="reset" value="��Ϻ���" id="resetButton" class="buyButton">
				</li>
			</ul>
		</form>
	</div>
</body>
</html>