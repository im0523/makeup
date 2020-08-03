<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Insert title here</title>
<style type="text/css">
.buy-btn{ margin-top: 100px; width: 200px;}
table tr td{ font-size: 14px;}
</style>
</head>
<body>
	<p class="main">주문/결제</p>

	<table class="orderCustomerInfo">
		<tr>
			<td colspan="7" class="orderCustomer">구매자 정보</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">이름</td>
			<td>${customerVo.customer_name }</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">이메일</td>
			<td>${customerVo.customer_email }</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">휴대폰번호</td>
			<td>${customerVo.customer_phone }</td>
		</tr>
	</table>
	
	<table class="recipientInfo">
		<tr>
			<td colspan="7" class="orderCustomer">배송지 정보</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">이름</td>
			<td>${customerVo.customer_name }</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">배송주소</td>
			<td>${customerVo.customer_address }</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">연락처</td>
			<td>${customerVo.customer_phone }</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">배송 요청사항</td>
			<td>휴대폰번호</td>
		</tr>
	</table>

	<table class="orderPage">
		<tr>
			<th style="width: 90px;">이미지</th>
			<th style="width: 300px;">상품정보</th>
			<th style="width: 83px;">수량</th>
		</tr>
		<tr>
			<th style="width: 90px;"><img src="resources/${productVo.product_thumbNail }" style="width: 80px; float: none;"/></th>
			<th style="width: 300px; text-align: left; font-weight: bold; font-size: 16px;">${productVo.product_name }</th>
			<th style="width: 83px; font-weight: bold; font-size: 16px;">${amount }개</th>
		</tr>
	</table>
	
	<table class="payInfo">
		<tr>
			<td colspan="7" class="orderCustomer">결제 정보</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">총 상품가격</td>
			<td>
				<span class="totalVal" id="pdPrice"><fmt:formatNumber value="${productVo.product_price * amount }"/></span>원</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">배송비</td>
			<td>
				<span id="deliveryFee">0</span>원
			</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">총 결제금액</td>
			<td><span id="cartTotalPr" style="font-weight: bold;">0</span><span>원</span></td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">결제방법</td>
			<td>
				<label><input type="radio" name="payMethod" class="payMethod"/>계좌이체</label>
				<label><input type="radio" name="payMethod" class="payMethod"/>신용/체크카드</label>
				<label><input type="radio" name="payMethod" class="payMethod"/>휴대폰</label>
				<label><input type="radio" name="payMethod" class="payMethod"/>무통장입금</label>
			</td>
		</tr>
	</table>
	
	
	<div style="width: 200px;">
		<a class="buy-btn" onclick="">결제하기</a>
	</div>
<script type="text/javascript" src="js/cart.js"></script>
</body>
</html>