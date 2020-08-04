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
				<label><input type="radio" name="payMethod" class="payMethod" value="1"/>계좌이체</label>
				<label><input type="radio" name="payMethod" class="payMethod" checked="checked" value="2"/>신용/체크카드</label>
				<label><input type="radio" name="payMethod" class="payMethod" value="3"/>휴대폰</label>
				<label><input type="radio" name="payMethod" class="payMethod" value="4"/>무통장입금</label>
			</td>
		</tr>
	</table>
	
	
	<div style="width: 200px;">
		<a class="buy-btn" onclick="go_payment();">결제하기</a>
	</div>
	
<script type="text/javascript" src="js/cart.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
// 결제하기 버튼 클릭 이벤트
function go_payment(){
	var payMethodVal = $('.payMethod:checked').val();	// 각각의 결제방법에 value를 주고 check 된 결제방법의 value를 가져온다
	
	// 결제금액 구하기
	var a = $('#cartTotalPr').text().split(',');	// 페이지에 적혀있는 총 결제금액에서 ,를 기준으로 나누고
	var b = '';										// 총 금액을 split 해서 배열에 담을 변수
	
	for( var i=0; i<a.length; i++){		// split 한 금액을 변수 b에 담는다 (29,500 -> 29500)
		b += a[i];
	}
	
	var amount = parseInt(b);		// 변수 b를 int 타입으로 바꾸고 결제 시스템에 넘겨줄 변수에 담는다

	if( payMethodVal == 2 ){	// 결제방법 : 신용/체크카드 일 경우
		var IMP = window.IMP; // 생략가능
	    IMP.init('imp20993930'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	    var msg;
	    
	    IMP.request_pay({
	        pg : 'inicis', // version 1.1.0부터 지원.
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : '(주)디어달리아',
	        amount : amount, //판매 가격
	        buyer_email : '${customerVo.customer_email }',
	        buyer_name : '${customerVo.customer_name }',
	        buyer_tel : '${customerVo.customer_phone }',
	        buyer_addr : '${customerVo.customer_address }',
	        buyer_postcode : '${customerVo.customer_postCode }'
	    }, function(rsp) {
	        if ( rsp.success ) {
	            var msg = '결제가 완료되었습니다.';
	            msg += '고유ID : ' + rsp.imp_uid;
	            msg += '상점 거래ID : ' + rsp.merchant_uid;
	            msg += '결제 금액 : ' + rsp.paid_amount;
	            msg += '카드 승인번호 : ' + rsp.apply_num;
	        } else {
	            var msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	        }
	        alert(msg);
	    });
	}

}
</script>
</body>
</html>