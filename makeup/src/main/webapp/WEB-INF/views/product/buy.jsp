<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
.imagepath { width: 200px; height: 200px; float: left; margin-left: 20px;}
.infoArea { width: 930px; height: 200px; float: left;}
.value, .value1 { width: 830px; height: 30px; line-height: 30px; float: left; margin: 20px 0 0 20px;}
.value { width: 50px; font-weight: bold;}
/* .name { width: 550px; height: 25px; line-height: 15px; font-size: 20px; } */
/* .price { width: 550px; height: 50px; line-height: 15px; font-size: 15px; font-weight: bold; border-bottom: 1px solid #ececec;} */
</style>
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
			<td>이름</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">이메일</td>
			<td>이메일</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">휴대폰번호</td>
			<td>휴대폰번호</td>
		</tr>
	</table>
	
	<table class="recipientInfo">
		<tr>
			<td colspan="7" class="orderCustomer">배송지 정보</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">이름</td>
			<td>이름</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">이메일</td>
			<td>이메일</td>
		</tr>
		<tr>
			<td class="orderCustomerDetail">휴대폰번호</td>
			<td>휴대폰번호</td>
		</tr>
	</table>

	<table class="orderPage">
		<tr>
			<th style="width: 35px;"><input type="checkbox" class="list-allCheck" id="list-allCheck" onclick="go_selectPdAll();"/></th>
			<th style="width: 90px;">이미지</th>
			<th style="width: 230px;">상품정보</th>
			<th>판매가</th>
			<th style="width: 83px;">수량</th>
			<th style="width: 70px;">적립금</th>
			<th>합계</th>
		</tr>
	</table>
	
	
	<div style="width: 116px;">
		<a class="btn-fill" onclick="">주문하기</a> <a class="btn-fill" onclick="history.back();">취소</a>
	</div>
</body>
</html>