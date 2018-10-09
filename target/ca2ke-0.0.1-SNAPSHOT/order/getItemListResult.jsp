<%@page import="java.util.List"%>
<%@page import="item.bean.ItemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c " uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<?xml version="1.0" encoding="UTF-8"?>
<contents>

<%
	List<ItemDTO> itemList = (List<ItemDTO>)request.getAttribute("itemList");
	for (ItemDTO itemDTO : itemList){
%>
	<item>
		<item_num><%=itemDTO.getItem_num()%></item_num>
		<item_name><%=itemDTO.getItem_name()%></item_name>
	</item>
<%		
	}
%>

<%-- 
<c:forEach var="dto" items="${itemList }">
	<item>
		<item_num>${dto.item_num }</item_num>
		<item_name>${dto.item_name}</item_name>
	</item>
</c:forEach>
 --%>
</contents>