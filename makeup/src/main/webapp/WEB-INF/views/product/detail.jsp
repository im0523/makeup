<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
.header { width: 1200px; height: 600px;}
</style>
</head>
<body>
	<div class="header">
		<div class="imagepath"><img src="${vo.product_thumbNail }" /></div>
		<div class="detail_infoArea">
			<p class="detail_name">${vo.product_name }</p>
			<p class="detail_price">KRW ${vo.product_price }</p>
			<div class="detail_explanation">${vo.product_explanation }
				<span class="detail_exp_name">${vo.product_name }</span>
                    <span class="quantity">
			      		<a><img src="img/btn_count_down.gif" onclick="quantityDown()" class="QuantityDown down" style="margin-left: 150px;"/></a>
                    	<input id="quantity" name="quantity_name" value="1" type="text" readonly="readonly" /> 
                    	<a><img src="img/btn_count_up.gif" onclick="quantityUp()" class="QuantityUp up"/></a>
                    </span>
				<span class="detail_exp_price">KRW ${vo.product_price }</span>
                    <div id="totalPrice" class="totalPrice">
		                <strong class="totalStr">TOTAL</strong> : <strong>0</strong><span class="totalStr"> (0개)</span>
		            </div>
	        </div>
	        
			<div class="cartBox">
				<a onclick="add_wishlist_nologin('/member/login.html');" class="wish-btn">ADD CART</a>
				<a onclick="location='buy.pd?no=${vo.product_no}'" class="buy-btn">BUY NOW</a>
			</div>
			
		<c:if test="${login_info.customer_name == '관리자' }">
			<div class="btn-box">
				<a class="btn-fill" onclick="location='modify.pd?no=${vo.product_no}'">상품수정</a>
				<a class="btn-fill" onclick="if( confirm('정말 삭제하시겠습니까?') ){ location='delete.pd?product_no=${vo.product_no}' }">상품삭제</a>
			</div>
		</c:if>
		
		</div>
	</div>
	
	<div class="img-box">
		<c:forEach items="${imageList }" var="img">
			<div><img src="${img.imagepath }" class="detail_image"/></div>
		</c:forEach>	
	</div>
</body>

<script type="text/javascript" src="js/product.js" charset="UTF-8"></script>

</html>