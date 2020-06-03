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
	<input type="hidden" id="product_price" value="${vo.product_price }"/>

	<div class="header">
		<div class="imagepath"><img src="resources/${vo.product_thumbNail }" /></div>
		<div class="detail_infoArea">
			<p class="detail_name">${vo.product_name }</p>
			<p class="detail_price">KRW <fmt:formatNumber value="${vo.product_price}" pattern="#,###"/></p>
			<div class="detail_explanation">
				<span class="detail_exp_name">${vo.product_name }</span>
                    <div class="quantity">
			      		<a><img src="img/btn_count_down.gif" onclick="quantityDown()" class="QuantityDown down"/></a>
                    	<input id="quantity" name="quantity_name" value="1" type="text" readonly="readonly" /> 
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
	        </div>
	        
			<div class="cartBox">
				<a onclick="add_wishlist_nologin('/member/login.html');" class="wish-btn">ADD CART</a>
				<a onclick="location='buy.pd?no=${vo.product_no}'" class="buy-btn">BUY NOW</a>
			</div>
			
<%-- 		<c:if test="${login_info.customer_name == '관리자' }"> --%>
			<div class="btn-box">
				<a class="btn-fill" onclick="location='modify.pd?product_no=${vo.product_no}'">상품수정</a>
				<a class="btn-fill" onclick="if( confirm('정말 삭제하시겠습니까?') ){ location='delete.pd?product_no=${vo.product_no}' }">상품삭제</a>
			</div>
<%-- 		</c:if> --%>
		
		</div>
	</div>
	
	<div class="img-box">
		<c:forEach items="${imageList }" var="img">
			<div><img src="resources/${img.imagepath }" class="detail_image"/></div>
		</c:forEach>	
	</div>
</body>

<script type="text/javascript" src="js/product.js" charset="UTF-8"></script>

</html>