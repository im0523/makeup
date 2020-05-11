<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.head { width: 700px; height: 50px; line-height: normal; }
table tr th { width: 100px; }
table tr td { text-align: center; }
tr td a { cursor: pointer; }
</style>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
<p class="main">회원 관리d</p>
	<form id="list" method="post">
		<input type="hidden" name="curPage" value="1"/>

		<div class="head">
			<div class="head-selectBox">
				<select name="search">
					<option ${page.search eq 'all' ? 'selected' : '' } value="all">전체</option>
					<option ${page.search eq 'id' ? 'selected' : '' } value="id">아이디</option>
					<option ${page.search eq 'name' ? 'selected' : '' } value="name">이름</option>
					<option ${page.search eq 'birth' ? 'selected' : '' } value="birth">생년월일</option>
					<option ${page.search eq 'email' ? 'selected' : '' } value="email">이메일</option>
				</select>
				<input class="searchKeyword" type="text" name="keyword" value="${page.keyword}"/>
				<a class="btn-fill" onclick="$('#list').submit();">조회</a>
				
			</div>
		</div>
	</form>
	
	<table style="width: 700px;">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>등록일</th>
		</tr>
	<c:forEach items="${page.list }" var="vo" >
		<tr onclick="location='detail.cu?customer_id=${vo.customer_id}'">
			<td><a>${vo.customer_id }</a></td>
			<td><a>${vo.customer_name }</a></td>
			<td><a>${fn:substring(vo.customer_socialNum, 0, 6) }</a></td>
			<td>${vo.customer_registerDate }</td>
		</tr>
	</c:forEach>
	</table>

<jsp:include page="/WEB-INF/views/include/page.jsp" />
<script type="text/javascript" src="js/customer.js" charset="UTF-8"></script>
</body>
</html>