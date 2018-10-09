<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<%
	String admin = (String)session.getAttribute("admin");
	int totalA = (int)request.getAttribute("totalA");
	System.out.println(totalA);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="../assets/css/itemList.css">
<script type="text/javascript"src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/script/itemAdd.js"></script>

</head>
<body>
<div id="section">
	<div id="container">

			<c:if test="${totalA!=0 }"> <!-- if -->
			<ul class="itemlist">
				<!-- 아이템 리스트 -->
				<c:forEach var="itemDTO" items="${list}">
						<c:if test="${itemDTO.item_ongoing!=2 }">
						<li>



						<c:if test="${itemDTO.item_ongoing==1 }">
							<img class="SoldOut_image"  style=" background-image:url('../storage/${itemDTO.item_image}');"src="../img/SoldOut.png" alt="이미지없음">
						</c:if><!-- 매진 -->

   						<c:if test="${itemDTO.item_ongoing==0 }">
							<span><img class="item_image" src="../storage/${itemDTO.item_image}" alt="이미지없음"></span>	
							<%-- <span class="item_name"><strong>${itemDTO.item_name}</strong></span> --%>
						    
							<span class="hidden_layer">
								<span class="hidden_form">
									<span class="item_num">${itemDTO.item_num }</span>
									<label class="item_name">${itemDTO.item_name}</label>
									<input type="button" class="minus" value="-">
									<span  class="item_qty">1</span>
									<input type="button" class="plus" value="+">
									<span class="item_price" data-default="${itemDTO.item_price}">${itemDTO.item_price}</span>
									<input type="button" class="item_add" value="add">
									<input type="button" class="detail_view" value="상세보기">
									<input type="hidden" class="item_desc" value="${itemDTO.item_desc }">
								</span>
							</span>
						</c:if><!-- 판매중 -->
							
						</li>
					</c:if><!-- 판매 안함 -->
				</c:forEach>
				
				
				<%-- <c:if test="${sessionScope.admin==1}"> --%>
				<%if(admin!=null&&admin.contains("admin")){ %>
				<li>
					<a href="itemAddForm?category=${param.category }"><img class="item_image" src="../img/plus.png" alt="상품추가" width="100" height="100"></a>
				</li>
				<%} %>
<%-- 				</c:if> --%>
		
			</ul>
			
			<!-- 아이템상세정보 -->
			<ul id="detail_layer">
				<li>
					<span id ="detail_form">
						<span id="image_place">
							<img id="detail_image" src="" alt="">
							<input type="hidden" id="detail_num" value="11"/>
							<label id="detail_name">테스트케이스</label>
                        </span>
						<span id="detail_place">
							<label id="detail_desc"></label>
						</span>
						<input type="button" class="minus" value="-">
						<span class="item_qty">1</span>
						<input type="button" class="plus" value="+">
						<span id="detail_price" data-default="10000">10000</span>
						<input type="button" class="item_add" value="Add">
						<br>
						<input type="button" id="return_list" value="목록">
					</span>
				</li>
				

				
				<li id="addPoint">
				
					<!-- <table id="review_layer">
						<tr>
							<td id="review_title" colspan="2">
								<hr id="top_line">
								<p id="review_t_grade">평점</p>
								<p id="review_t_desc">내용</p>
							</td>
						</tr>	
						foreach start 
							<tr>
								<td colspan="2">
									<hr class="cutting_line">
								</td>
							</tr>
							<tr>
								<td rowspan="2">	
									<div class="star_grade">
										<span style="width:10%"></span>평점  별 이미지 출력안될 경우 itemList.css에서 경로 수정하세요
									</div>
								</td>
								<td>
									<p class="review_desc">케이크평가내용1케이크평가내용1케이크평가내용내용케이크평가내용1케이크평가내용1케이크평가내용내용케이크평가내용1케이크평가내용1케이크평가내용내용</p>
								</td>
							</tr>	
							<tr>
								<td>
									<p class="user_id">user_m_id1</p>
									<p class="review_date">review_date1</p>
								</td>
							</tr>
						
						foreach end
						<tr>
							<td colspan="2">
							<hr class="cutting_line">
							</td>	
						</tr>
					</table> -->

				</li>	
			</ul>

			<jsp:include page="../item/buyList.jsp"/>
			</c:if><!-- if end -->


			<%-- <c:if test="${totalA==0 &&sessionScope.admin==1}"> --%>
			<%if(totalA==0){ 
				if(admin!=null&&admin.contains("admin")){ %>
				<ul class="itemlist">
					<!-- 관리자일때만 아이템 추가 버튼 생성 -->
					<li>
						<a href="itemAddForm?category=${param.category }"><img class="item_image" src="../img/plus.png" alt="상품추가" width="100" height="100"></a>
					</li>
				</ul>
				<%}else{ %>
				<%-- </c:if> --%>
				<%-- <c:if test="${totalA==0 &&sessionScope.admin!=1}"> --%>
					
						<ul id="item_empty">
							<li>
								<span>등록된 상품이 없습니다.</span>
							</li>
						</ul>
	<%-- 			</c:if> --%>
				<%} 
			}%>
	</div>
</div>
</body>
</html>