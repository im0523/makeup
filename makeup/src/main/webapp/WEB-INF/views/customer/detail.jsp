<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>회원 상세정보</h2>
<table style="border: 1px solid #ececec">
	<tr>
		<th>아이디</th>
			<td>${vo.customer_id }</td>
	</tr>
	<tr>
		<th>비밀번호</th>
			<td>${vo.customer_pw }</td>
	</tr>
	<tr>
		<th>이름</th>
			<td>${vo.customer_name }</td>
	</tr>
	<tr>
		<th>주민등록번호</th>
			<td>${fn:substring(vo.customer_socialNum, 0, 6)}-${fn:substring(vo.customer_socialNum, 6, 13) } </td>
	</tr>
	<tr>
		<th>휴대폰번호</th>
			<td>${vo.customer_phone }</td>
	</tr>
	<tr>
		<th>이메일</th>
			<td>${vo.customer_email }</td>
	</tr>
	<tr>
		<th>주소</th>
			<td>
				<input style="width: 60px;" type="text" name="customer_postCode" id="customer_postCode" placeholder="우편번호" readonly="readonly"
						value="${vo.customer_postCode }"/>
	</tr>
	<tr>
		<th></th>
			<td>
				<input style="width: 470px;" type="text" name="customer_address" id="customer_address" placeholder="도로명주소" readonly="readonly"
						value="${vo.customer_address }"/>
				<input style="width: 260px;" type="text" name="customer_detailAddress" id="customer_detailAddress" placeholder="상세주소" readonly="readonly"
						value="${vo.customer_detailAddress }"/>	
			</td>
	</tr>

</table>

<div style="width: 128px; height: 50px; margin: 50px auto;">
	<a class="btn-fill" onclick="location='modify.cu?customer_id=${vo.customer_id}'">수정</a>
	<a class="btn-empty" onclick="history.back()">뒤로가기</a>
</div>

</body>
</html>