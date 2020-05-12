<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<style type="text/css">
table { width: 360px ;}
table th, table td { border-bottom: none;}
</style>
</head>
<body>
<h2>로그인</h2>

<form id="login" action="" method="post">
	<table>
		<tr>
			<th>아이디</th>
				<td>
					<input type="text" id="customer_id" name="customer_id" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g, '');" maxlength="16"/>
				</td>
		</tr>
		<tr>
			<th>비밀번호</th>
				<td>
					<input type="password" id="customer_pw" name="customer_pw"
						   onkeyup="if (window.event.keyCode == 13) { go_login() } this.value=this.value.replace(/[^a-zA-Z0-9]/g, '');" maxlength="16"/>
				</td>
		</tr>
</table>
</form>

<div class="login-findBox">
	<div class="loginBox" onclick="go_login()">로그인</div>
	<div class="login-findBox-tagBox">
		<div class="login-findBox-tag"><a onclick="location='findId'">아이디 찾기</a></div>
		<div class="login-findBox-tag"><a>비밀번호 찾기</a></div>
	</div>
</div>

</body>

<script type="text/javascript" src="js/customer.js" charset="UTF-8"></script>


</html>