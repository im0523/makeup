<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
.header { width: 1200px; height: 600px; margin-bottom: 100px;}
</style>
</head>
<body>
	<form id="insertForm" method="post">
		<input type="hidden" name="customer_id" value="${login_info.customer_id }"/>
		<input type="hidden" id="product_price" value="${vo.product_price }"/>
		<input type="hidden" name="product_no" value="${vo.product_no }"/>
	
		<div class="header">
			<div class="imagepath"><img src="resources/${vo.product_thumbNail }" /></div>
			<div class="detail_infoArea">
				<p class="detail_name">${vo.product_name }</p>
				<p class="detail_price">KRW <fmt:formatNumber value="${vo.product_price}" pattern="#,###"/></p>
				<div class="detail_explanation">
					<span class="detail_exp_name">${vo.product_name }</span>
	                    <div class="quantity">
				      		<a><img src="img/btn_count_down.gif" onclick="quantityDown()" class="QuantityDown down"/></a>
	                    	<input id="quantity" name="amount" value="1" type="text" readonly="readonly" /> 
	                    	<a><img src="img/btn_count_up.gif" onclick="quantityUp()" class="QuantityUp up"/></a>
	                    </div>
					<span class="detail_exp_price">KRW <fmt:formatNumber value="${vo.product_price }" pattern="#,###"/></span>
	                    <div id="totalPrice" class="totalPrice">
			                <strong class="totalStr">TOTAL</strong> :
			                <strong>KRW </strong>
			                	<span id="totalVal"><fmt:formatNumber value="${vo.product_price }" pattern="#,###"/></span>
			                <span class="totalStr"> (<span id="totalCnt">1</span>개)
			                </span>
			            </div>
					<div id="myModal" class="modal">
					
						<div class="modal-content">
							<p class="cartFont">장바구니에 상품이 담겼습니다</p>
							<div class="cartNoti">
								<div class="go_cart" onclick="go_cartList('${login_info.customer_id}');"><a>장바구니로 이동</a></div>
								<div class="go_shopping" onclick="go_shopping();"><a>계속 쇼핑하기</a></div>
							</div>
						</div>
					
					</div>
		        </div>
		        
				<div class="cartBox">
					<a onclick="insert_cart();" id="addCart" class="wish-btn">ADD CART</a>
					<a onclick="location='buy.pd?no=${vo.product_no}'" class="buy-btn">BUY NOW</a>
				</div>
				
			<c:if test="${login_info.customer_name == '관리자' }">
				<div class="btn-box">
					<a class="btn-fill" onclick="location='modify.pd?product_no=${vo.product_no}'">상품수정</a>
					<a class="btn-fill" onclick="if( confirm('정말 삭제하시겠습니까?') ){ location='delete.pd?product_no=${vo.product_no}' }">상품삭제</a>
				</div>
			</c:if>
			
			</div>
		</div>
		
		<div class="img-box">
			<c:forEach items="${imageList }" var="img">
				<div><img src="resources/${img }" class="detail_image"/></div>
			</c:forEach>	
		</div>
	</form>
</body>

<script type="text/javascript" src="js/product.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/cart.js" charset="UTF-8"></script>
</html>