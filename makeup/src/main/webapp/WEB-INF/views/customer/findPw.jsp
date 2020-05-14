<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>비밀번호 찾기</h2>
<table id="findPwTb">
		<tr>
			<th>아이디</th>
				<td>
					<input type="text" id="customer_id" name="customer_id" onkeyup="id_usable(); this.value=this.value.replace(/[^a-z0-9]/g, '');" maxlength="16"/>
				</td>
		</tr>
		<tr>
			<th>이름</th>
				<td>
					<input type="text" id="customer_name" name="customer_name" maxlength="14" onkeyup="this.value=this.value.replace(/[^a-zA-Z가-힣]/g, '');"/>
				</td>
		</tr>
		<tr>
			<th>휴대폰번호</th>
				<td>
					<input class="phone" type="text" id="phone1" maxlength="3" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');" style="width: 30px;"/> -
					<input class="phone" type="text" id="phone2" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');" style="width: 30px;"/> -
					<input class="phone" type="text" id="phone3" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');" style="width: 30px;"/>
					<input type="hidden" name="customer_phone" id="customer_phone"/>
				</td>
		</tr>
		<tr>
			<th>이메일</th>
				<td>
					<input style="width:200px;" type="text" id="customer_email" name="customer_email" maxlength="28"
							onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9@_-.]/g, '');"/>
				</td>
		</tr>
</table>

<div class="login-findBox">
	<div class="loginBox" onclick="go_findPw()" style="width: 40px; margin: 0 auto;">확인</div>
</div>

</body>

<script type="text/javascript" src="js/customer.js" charset="UTF-8"></script>

</html>