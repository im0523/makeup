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
			<p class="detail_price">${vo.product_price }</p>
			<div class="detail_explanation">${vo.product_explanation }</div>
			<tbody>
			<tr>
				<td>${vo.product_name }</td>
	                <td>
	                    <span class="quantity">
	                        <input id="quantity" name="quantity_name" value="1" type="text"  /> 
	                       		<a><img src="img/btn_count_up.gif" alt="수량증가" class="QuantityUp up"/></a>
	  				      		<a><img src="img/btn_count_down.gif" alt="수량감소" class="QuantityDown down"/></a>
	                    </span>
	                </td>
	                <td class="right">
	<span class="quantity_price">${vo.product_price }</span> <span class="mileage displaynone">(<img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif"/>  <span class="mileage_price">0</span>)</span>
					</td>
	        </tr>
	        </tbody>
			<a onclick="location='buy.pd?no=${vo.product_no}'" style="cursor: pointer;"><div class="buy-btn">BUY NOW</div></a>
			<div class="btn-box">
				<a class="btn-fill" onclick="location='modify.pd?no=${vo.product_no}'">상품수정</a>
				<a class="btn-fill" onclick="if( confirm('정말 삭제하시겠습니까?') ){ location='delete.pd?product_no=${vo.product_no}' }">상품삭제</a>
			</div>
		</div>
	</div>
	
	<div class="img-box">
		<c:forEach items="${imageList }" var="img">
			<div><img src="${img.imagepath }" class="detail_image"/></div>
		</c:forEach>	
	</div>
</body>
</html>