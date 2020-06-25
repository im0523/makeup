<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main { height: 50px; text-align: center; font-size: 30px; font-weight: bold;}
.menu {width: 1080px; height: 50px; margin: 50px auto; }
.menu li { list-style: none; float: left; color: lightslategray; font-size: 15px; padding: 10px 27px; border: 1px solid #bdbdbd; margin: 0 4px;}
.item_box { width: 280px; height: 390px; float: left; margin: 22px;}
.thumbnail { width: 280px; height: 270px; margin: 0;}
.name { width: 280px; height: 30px; border-bottom: 1px solid #ececec; margin: 0; padding: 10px 0; line-height: 30px; }
.price { width: 280px; height: 60px; margin: 0; line-height: 0px;}
</style>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<form method="post" id="list">
<p class="main">PRODUCT</p>
	<ul class="menu" id="cate_name">
		<li>NEW</li>
		<li>BEST SELLER</li>
		<li>ALL</li>
		<c:forEach var="code" items="${codeList }">
			<li>${code.code_name }</li>
		</c:forEach>
	</ul>
	
	<c:if test="${login_info.customer_name == '관리자' }">
		<p class="main" style="height: 20px; font-size: 15px; margin: 0 0 0 1100px;"><a class="btn-fill" onclick="location='new.pd'">상품등록</a></p>
	</c:if>
	
	<div class="content">
		<c:forEach items="${page.list }" var="vo">
			<div class="item_box">
				<div class="thumbnail"><a onclick="go_detail(${vo.product_no})"><img src="resources/${vo.product_thumbNail }" class="thumbnail"/></a></div>
				<div class="name"><a onclick="go_detail(${vo.product_no})">${vo.product_name }</a></div>
				<div class="price"><h5><a onclick="go_detail(${vo.product_no})">KRW <fmt:formatNumber value="${vo.product_price}" pattern="#,###"/></a></h5></div>
			</div>
		</c:forEach>
	</div>
	<input type="hidden" name="product_no"/>
	<input type="hidden" name="cate_val" id="cate_val" />
</form>
<script type="text/javascript" src="js/product.js" charset="UTF-8">></script>
<script type="text/javascript">
function go_detail(no){
	$('[name=product_no]').val(no);
	$('#list').attr('action', 'detail.pd');
	$('#list').submit();
}
</script>
</body>
</html>