<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
.imagepath { margin: 0 auto;}
.product_price, .product_image { width: 150px; height: 60px; margin: 0; line-height: 30px; float: left; }
.product_price{ height: 30px;}
.file-attach { float: left; display:none;}
.image_add { width: 90px; height: 90px;}
.context { width: 150px; height: 30px; line-height: 30px; float: left; margin: 0;}
</style>
</head>
<body>
<h2>상품수정</h2>
<%-- ${fn:length(imageList) } --%>
<%-- ${6-(fn:length(imageList))} --%>
<%-- ${fn:length(imageList) } --%>
	<form action="update.pd" method="post" enctype="multipart/form-data">
		<div class="content" style="width: 900px; margin: 0 auto; border: 1px solid gray;">
			<div style="width: 130px; height: 130px;" id="imageBox0">
				<label>
				<c:choose>
					<c:when test="${!empty vo.product_thumbNail }">
						<img class="image_add" id="image0" src="resources/${vo.product_thumbNail }" style="width: 130px; height: 130px;"/>
					</c:when>
					<c:otherwise>
						<img class="image_add" id="image0" src="img/image_add.png" style="width: 130px; height: 130px;"/>
					</c:otherwise>
				</c:choose>
					<input type="file" id="thumbNailMo" name="thumbNail" class="file-attach"/>
				</label>
			</div>
			
			<div class="seqBox" style="margin-top: 20px;">
				<div class="product_name">상품명</div>
					<input class="pd_nameInput" type="text" id="product_name" name="product_name" value="${vo.product_name }"/>
			</div>
			<div class="seqBox">
				<div class="product_category">카테고리</div>
					<select id="product_category" name="product_category">
						<option value="">선택없음</option>
						<c:forEach var="code" items="${codeList }">
							<option value="${code.code_id }">${code.code_name }</option>
						</c:forEach>
					</select>
					<input type="hidden" id="hiddenCat" value="${vo.product_category }"/>
			</div>
			<div class="seqBox">
				<div class="product_price">가격</div>
					<span class="product_price_f">KRW</span>
					<input type="text" name="product_price_c" id="product_price_c" style="width: 80px; float: left;"
					       onkeyup="autoComma(this);" maxlength="11" value="${vo.product_price }"/>
					<input type="hidden" id="product_price" name="product_price"/>
			</div>
			<div class="seqBox" style="height: 70px;">
				<div class="product_explanation">상품설명</div>
					<textarea style="width: 605px;" name="product_explanation">${vo.product_explanation }</textarea>
			</div>
			<div class="seqBox" style="height: 70px;">
				<div class="context">내용</div>
					<textarea style="width: 605px;" name="product_context">${vo.product_context }</textarea>
			</div>
			<div class="seqBox" style="height: 90px;">
				<div style="width: 150px; height: 30px; margin-top: 0; float: left; line-height: 30px;">이미지 등록</div>
				<a class="btn-fill-s" onclick="imgAddBtn()" style="float: left; height: 20px; line-height: 20px; margin-top: 4px;
									background-color: gray;">이미지 추가하기</a>
				<div class="imagefiles">
					<c:forEach var="img" items="${imageList }" varStatus="status">
						<div class="imageBox" id="imageBox${status.count }">
							<c:choose>
								<c:when test="${!empty img.imagepath}">
									<label>
										<img class="image_add" id="image${status.count }" src="resources/${img.imagepath }"/>
										<input class="file-attach" type="file" name="image"/>
									</label>
										<img class="delete-img" id="imageDel${status.count }" src="img/cancel.PNG"
											 onclick="deleteImg(this)"/>
								</c:when>						
								<c:otherwise>
									<label>
										<img class="image_add" id="image${status.count }" src="img/image_add.png"/>
										<input class="file-attach" type="file" name="image"/>
									</label>
										<img class="delete-img" id="imageDel${status.count }" src="img/cancel.PNG"
											 onclick="deleteImg(this)"/>
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
	<!-- 				imageList 갯수가 3개보다 적으면 기본 이미지로 총 3개라는 갯수를 맞춰주는 처리 -->
					<c:if test="${fn:length(imageList) < 3 }">
							<c:forEach begin="1" end="${3-(fn:length(imageList))}" varStatus="status">
								<div class="imageBox" id="imageBox${fn:length(imageList)+status.count }">
									<label>
										<img class="image_add" id="image${fn:length(imageList)+status.count }" src="img/image_add.png"/>
										<input class="file-attach" type="file" name="image"/>
									</label>
										<img class="delete-img" id="imageDel${fn:length(imageList)+status.count }" src="img/cancel.PNG"
											 style="display: none;" onclick="deleteImg(this)"/>
								</div>
							</c:forEach>
						</c:if>
				</div>
			</div>
			
		</div>
		
		<input type="hidden" name="product_no" value="${vo.product_no }"/>
		<input type="hidden" id="delete" name="delete" value="1"/>
		
		<div style="width: 95px; height: 50px; margin: 0 auto;">
			<a class="btn-fill" onclick="go_submit();">수정</a>
			<a class="btn-empty" onclick="history.back();">취소</a>
		</div>
	</form>

<script type="text/javascript" src="js/product.js" charset="UTF-8"></script>
</body>
</html>