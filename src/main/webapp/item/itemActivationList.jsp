<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="/ca2ke/assets/css/bootstrap.min.css"/>
</head>
<body>
	<div id="header" align="left" style="padding: 50px;">
                <h3>상품 상태 관리</h3>
        </div>
        <br/>
        <br/>
        <table class="table">
                <thead>
                        <tr>
                                <th scope="col">#</th>
                                <th scope="col">상품명</th>
                                <th scope="col">이미지</th>
                                <th scope="col">상태</th>
                                <th scope="col"></th>
                        </tr>
                </thead>
                <c:forEach var="dto" items="${list}">
                        <form action="activationChange">
                        <tr>
                                <td>${dto.item_num}</td>
                                <td>${dto.item_name}</td>
                                <td>
                                        <img
                                                src="../storage/${dto.item_image}"
                                                alt="이미지"
                                                style="width:80px;height:80px;"
                                        />
                                </td>
                                <td>
                                
                                  <div class="form-group">
                                    <select class="form-control" name="item_ongoing">
					    <c:if test="${dto.item_ongoing == 0}">
                                      		<option value="0" selected>판매중</option>
                                      		<option value="1">품절</option>
                                      		<option value="2">생산중단</option>
					    </c:if>
					    <c:if test="${dto.item_ongoing == 1}">
                                      		<option value="0">판매중</option>
                                      		<option value="1" selected>품절</option>
                                      		<option value="2">생산중단</option>
					    </c:if>
					    <c:if test="${dto.item_ongoing == 2}">
                                      		<option value="0">판매중</option>
                                      		<option value="1">품절</option>
                                      		<option value="2" selected>생산중단</option>
					    </c:if>
                                    </select>
                                  </div>
                                  
                                </td>
                                <td>
                                  <input type="hidden" value="${dto.item_num}" name="item_num"/>
                                  <input type="submit" value='상태변경' class="btn btn-warning">
                                </td>
                        </tr>
                        </form>
                </c:forEach>
        </table>
</body>
</html>
