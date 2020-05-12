<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>아이디 찾기</h2>

<table id="findIdTb">
		<tr>
			<th class="findId-radioText" style="text-align: right;">
				<input class="findId-radio" type="radio" value="1" name="radio" checked="checked" onclick="findId_div()"/>이메일로 찾기
			</th>
			<td class="findId-radioText" style="text-align: center;">
				<input class="findId-radio" type="radio" value="2" name="radio" onclick="findId_div()"/>휴대폰번호로 찾기
			</td>
		</tr>
		<tr>
			<th>이름</th>
				<td>
					<input type="text" id="customer_name" name="customer_name" maxlength="14" onkeyup="this.value=this.value.replace(/[^a-zA-Z가-힣]/g, '');"/>
				</td>
		</tr>
		<tr id="emailBox">
			<th>이메일</th>
				<td>
					<input style="width:200px;" type="text" id="customer_email" name="customer_email" maxlength="28"
							onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9@_-.]/g, '');"/>
				</td>
		</tr>
		<tr id="phoneBox" style="display: none;">
			<th>휴대폰번호</th>
				<td>
					<input class="phone" type="text" id="phone1" maxlength="3" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');"/> -
					<input class="phone" type="text" id="phone2" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');"/> -
					<input class="phone" type="text" id="phone3" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');"/>
					<input type="hidden" name="customer_phone" id="customer_phone"/>
				</td>
		</tr>
</table>

<div class="login-findBox">
	<div class="loginBox" onclick="go_findId()">확인</div>
</div>

</body>

<script type="text/javascript" src="js/customer.js" charset="UTF-8"></script>

</html>