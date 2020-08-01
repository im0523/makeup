<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table img{ width: 80px;}
</style>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
<h2>장바구니</h2>
<table class="cartPage">
<c:choose>
	<c:when test="${empty list }">
		<tr>
			<td colspan="7" style="height: 200px;">
				장바구니에 담은 상품이 없습니다
			</td>
		</tr>
	</c:when>
	
	<c:otherwise>
		<tr>
			<th style="width: 35px;"><input type="checkbox" class="list-allCheck" id="list-allCheck" onclick="go_selectPdAll();"/></th>
			<th style="width: 90px;">이미지</th>
			<th style="width: 230px;">상품정보</th>
			<th>판매가</th>
			<th style="width: 83px;">수량</th>
			<th style="width: 70px;">적립금</th>
			<th>합계</th>
		</tr>

		<c:forEach var="vo" items="${list }">
			<tr>
				<td>
					<input type="checkbox" class="list-checkBox" onclick="go_selectPd(this);"/>
					<input type="hidden" name="cart_id" value="${vo.cart_id }"/>
				</td>
				<td><img style="float: none;" src="resources/${vo.product_thumbNail }"/></td>
				<td style="text-align: left; font-weight: bold;">${vo.product_name }</td>
				<td>
					<fmt:formatNumber value="${vo.product_price }"/>
				</td>
				<td>
					<div class="quantity">
			      		<a><img src="img/btn_count_down.gif" onclick="ct_quantityDown(this);" class="QuantityDown down"/></a>
			               <input id="quantity" name="amount" value="${vo.amount }" type="text" readonly="readonly" /> 
			           	<a><img src="img/btn_count_up.gif" onclick="ct_quantityUp(this);" class="QuantityUp up"/></a>
			        </div>
				</td>
				<td>-</td>
				<td>
					<span class="totalVal"><fmt:formatNumber value="${vo.product_price * vo.amount }"/></span>
				</td>
			</tr>
		</c:forEach>
	
		<tr>
			<td colspan="7" style="text-align: right;">
				<span style="text-align: right;">상품가격 </span><span id="pdPrice"></span>원
				<span> + 배송비 </span><span id="deliveryFee">0</span>원
				<span> = 총 합계 : </span><span id="cartTotalPr" style="font-weight: bold;">0</span><span>원</span>
			</td>
		</tr>
		
		
		<tr>
			<td colspan="7" style="text-align: left;" class="cartSelectDel">
				<span style="font-size: 14px; font-weight: bold; margin-right: 5px;">선택 상품 </span>
				<a class="btnBorder" onclick="go_delCart(this);">삭제하기</a>
			</td>
		</tr>
	</c:otherwise>
</c:choose>

</table>

<c:choose>
	<c:when test="${empty list }">
		<div class="cartBuyBtn" onclick="location='list.pd'"
			 style="float: none; color: white; background-color: black;}">계속 쇼핑하기</div>
	</c:when>

	<c:otherwise>
		<div style="width: 415px;">
			<div class="cartBuyBtn" onclick="location='list.pd'">계속 쇼핑하기</div>
			<div class="cartBuyBtn" style="margin-left: 10px; color: white; background-color: black;">구매하기</div>
	</div>
	</c:otherwise>
</c:choose>

<script type="text/javascript" src="js/product.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/cart.js" charset="UTF-8"></script>
</body>
</html>