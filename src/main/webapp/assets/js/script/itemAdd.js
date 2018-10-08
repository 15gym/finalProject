
    var tot_list = 0;
    var container_min_height = 500;
    var review_min_height = 0;
	$(function(){
		
 		$(".hidden_form > .detail_view").click(function(){
 			$(".itemlist").css("visibility","hidden");
 			$(".hidden_layer").css("visibility","hidden");
 			
			 var item_num = $(this).parent().children().eq(0).text();
 			 var item_name = $(this).parent().children().eq(1).text();
             var item_qty = $(this).parent().children().eq(3).text();
			 var default_price = $(this).parent().children().eq(5).attr("data-default");
			 var price = Number(default_price) * Number(item_qty);
			 
			 var item_desc = $(this).parent().children().eq(8).val();
			 var item_image = $(this).parent().parent().prev().children().eq(0).attr("src");
             $("#detail_image").attr("src",item_image);
			 $("#detail_num").text(item_num);
			 $("#detail_name").text(item_name);
			 $("#detail_desc").text(item_desc);
			 $("#detail_price").attr("data-default",default_price);
			 $("#detail_price").text(price);
			 $("#detail_form .item_qty").text(item_qty);
			 $("#detail_form .detail_price").text(price);	
 			 $("#detail_layer").css("visibility","visible");
 			
			 //상품평 가져오기 --start
  			$.ajax({
 	               type : 'post',
 	               url : 'reviewList?item_num='+item_num,

 	               success : function(json){
 	
 	            	   if(json.length!=0){
 	            		     review_min_height = 500 + json.length*104;
 	            		     if(review_min_height > container_min_height){
 	            		    	 $("#container").css("min-height",review_min_height+"px");
 	            		     }
 			  				 var str_content = "";
 			  			     str_content+="	<table id=\"review_layer\">";
 						     str_content+="	<tr>";
 						     str_content+="		<td id=\"review_title\" colspan=\"2\">";
 						     str_content+="			<hr id=\"top_line\">";
 						     str_content+="			<p id=\"review_t_grade\">평점</p>";
 						     str_content+="			<p id=\"review_t_desc\">내용</p>";
 						     str_content+="		</td>";
 						     str_content+="	</tr>	";
 						     str_content+="	<!-- foreach start  -->";
 						     //for문 start
 						     for(var i=0;i<json.length;i++){
 						     
 						     str_content+="		<tr>";
 						     str_content+="			<td colspan=\"2\">";
 						     str_content+="				<hr class=\"cutting_line\">";
 						     str_content+="			</td>";
 						     str_content+="		</tr>";
 						     str_content+="		<tr>";
 						     str_content+="			<td rowspan=\"2\">	";
 						     str_content+="				<div class=\"star_grade\">";
 						     str_content+="					<span style=\"width:";
 						     str_content+=""+json[i].rate*20;
 						     str_content+="%\"></span><!-- 평점 -->  <!-- 별 이미지 출력안될 경우 itemList.css에서 경로 수정하세요 -->";
 						     str_content+="				</div>";
 						     str_content+="			</td>";
 						     str_content+="			<td>";
 						     str_content+="				<p class=\"review_desc\">"+json[i].content+"</p>";
 						     str_content+="			</td>";
 						     str_content+="		</tr>	";
 						     str_content+="		<tr>";
 						     str_content+="			<td>";
 						     str_content+="				<p class=\"user_id\">"+json[i].m_id+"</p>";
 						     str_content+="				<p class=\"review_date\">"+json[i].logtime+"</p>";
 						     str_content+="			</td>";
 						     str_content+="		</tr>";
 						     }
 						     //for문 end
 						     str_content+="	<!-- foreach end -->";
 						     str_content+="	<tr>";
 						     str_content+="		<td colspan=\"2\">";
 						     str_content+="		<hr class=\"cutting_line\">";
 						     str_content+="		</td>	";
 						     str_content+="	</tr>";
 						     str_content+="</table>";
 							 $("#addPoint").append(str_content);
 	            	   
 	            	   }
 	            	   
 	            	   
 	               },
 	               error: function(xhr, status, error){
 	            	   alert(error);
 	            	   return false;
 	               }
  				});
  			
  			//-- 상품평 가져오기 end

		});
 		
 		$("#detail_form > #return_list").click(function(){
 			review_min_height = 0;
	    	$("#container").css("min-height",container_min_height+"px");
 			$("#detail_layer").css("visibility","hidden");
 			$(".itemlist").css("visibility","visible");
 			$("#addPoint").empty();
		});
		
		
		/**마우스 커서가 들어감*/
		$(".item_image").mouseenter(function(){
			$(this).parent().next().css("visibility","visible");
			
		});
		
		$(".item_position").mouseenter(function(){
			$(this).children().next().css("visibility","visible");
		});
		
		$(".hidden_layer").mouseleave(function(){
			$(this).css("visibility","hidden");
		});
		
		
		$(".hidden_form > .plus, #detail_form > .plus").click(function(){
			var cnt = $(this).prev().text();
			var cntSum = Number(cnt) + 1;
			$(this).prev().text(cntSum);
			
			var price = $(this).next().attr("data-default");
			var priceMul = Number(price) * cntSum;
			$(this).next().text(priceMul);
				
		});
		
		$(".hidden_form > .minus, #detail_form > .minus").click(function(){
			var cnt = $(this).next().text();
			var cntSum = Number(cnt) - 1;
			if(cntSum !=0){
				$(this).next().text(cntSum);
				var price = $(this).next().next().next().attr("data-default");
				var priceMul = Number(price) * cntSum;
				$(this).next().next().next().text(priceMul);
			}
		});
		
		var item_add = function(){
			
			 var item_num = $(this).parent().children().eq(0).text();
			 var item_name = $(this).parent().children().eq(1).text();
			 
			 if($(this).parent().children().is("#image_place")){
				 item_num = $(this).parent().children().eq(0).children().eq(1).text();
				 item_name = $(this).parent().children().eq(0).children().eq(2).text();
			 }
			 
             var item_qty = $(this).parent().children().eq(3).text();
			 var default_price = $(this).parent().children().eq(5).attr("data-default");
			 var price = Number(default_price) * Number(item_qty);
			 var check = true;
			 if(tot_list !=0){
				 
				 $(".buyList").find("[name='item_num']").each(function() {
					 if($(this).val() == item_num){
						 $(this).next().next().val(item_qty);
						 $(this).next().next().next().next().val(price); 
						 check = false;
					 }
				 });
			 }
			 
			 if(check){
				 var str_content = "";
				 str_content += "<span class=\"item\">";
				 str_content += "<li><input class=\"item_name\" type=\"text\" name=\"item_name\" value=\""+item_name+"\" readonly>";
				 str_content += "<input type=\"button\" class=\"delete\" value=\"x\">";
				 str_content += "</li>";
				 str_content += "<li>";
				 str_content += "<input type=\"hidden\" name=\"item_num\" value=\""+item_num+"\">";
				 str_content += "<input type=\"button\" class=\"minus\" value=\"-\">";
				 str_content += "<input class=\"item_qty\" type=\"text\" name=\"item_qty\" id=\"item_qty\" value=\""+item_qty+"\" readonly>";
				 str_content += "<input type=\"button\" class=\"plus\" value=\"+\">";
				 str_content += "<input class=\"item_price\" type=\"text\" name=\"item_price\" id=\"item_price\" value=\""+price+"\" data-default = \""+default_price+"\" readonly>";
				 str_content += "</li>";
				 str_content += "<li><hr></li>";
				 str_content += "</span>";
				 $(".buyList").children().children().children().eq(0).append(str_content);
	 			 tot_list = tot_list + 1;
	 			 
				 container_min_height = container_min_height + 50;
    		     if(review_min_height < container_min_height){
    		    	 //alert(review_min_height);
    				 $("#container").css("min-height",container_min_height+"px");
    		     }
			 }
			 
			 var price_temp = 0;
			 $(".buyList").find("[name='item_price']").each(function() {

					 price_temp += Number($(this).val());
					 
			 });
			 $("#total_money").children().text(price_temp);


		}
		
 		$(".hidden_form > .item_add,#detail_form .item_add").click(item_add);
 		

 		
 		
		
	});
	