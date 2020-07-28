<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Insert title here</title>
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
			<th style="width: 230px;">상품정보</th>
			<th>판매가</th>
			<th style="width: 83px;">수량</th>
			<th style="width: 70px;">적립금</th>
			<th>합계</th>
		</tr>
		<tr>
			<th style="width: 90px;"><img src="resources/${productVo.product_thumbNail }" style="width: 80px;"/></th>
			<th style="width: 230px;">${productVo.product_name }</th>
			<th>${productVo.product_price }</th>
			<th style="width: 83px;">${amount }개</th>
			<th style="width: 70px;">적립금</th>
			<th>합계</th>
		</tr>
	</table>
	
	
	<div style="width: 116px;">
		<a class="btn-fill" onclick="">주문하기</a> <a class="btn-fill" onclick="history.back();">취소</a>
	</div>
</body>
</html>