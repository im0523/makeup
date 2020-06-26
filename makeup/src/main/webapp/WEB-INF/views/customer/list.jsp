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
table tr th:first-child { width: 20px; }
table tr td { text-align: center; }
tr td a { cursor: pointer; }
</style>
<link rel="stylesheet" type="text/css" href="css/style.css"/>

<!-- /makeup/list.cu 경로로 접속 시 일반회원은 접근을 막는 처리 -->
<%-- <c:choose> --%>
<%-- 	<c:when test="${login_info.customer_name == '관리자' }"> --%>
<!-- 		<script> -->
<!--  		alert(2) -->
<!-- 		</script> -->
<%-- 	</c:when> --%>
<%-- 	<c:otherwise> --%>
<!-- 		<script> -->
<!--   		alert('일반'); -->
<!-- 		location.href="/makeup" -->
<!-- 		</script> -->
<%-- 	</c:otherwise> --%>
<%-- </c:choose> --%>

</head>
<body>
<p class="main">회원 관리</p>
	<form id="list" method="post">
		<input type="hidden" name="curPage" value="1"/>
		
		<div class="head">
		<div class="delete"><a class="btn-fill" style="background-color: #a8a8a8;"
			 onclick="if( confirm('정말 탈퇴시키겠습니까?') ){ customer_delete(); }">선택탈퇴</a></div>
			<div class="head-selectBox">
				<select name="search">
					<option ${page.search eq 'all' ? 'selected' : '' } value="all">전체</option>
					<option ${page.search eq 'customer_id' ? 'selected' : '' } value="customer_id">아이디</option>
					<option ${page.search eq 'customer_name' ? 'selected' : '' } value="customer_name">이름</option>
					<option ${page.search eq 'customer_socialNum' ? 'selected' : '' } value="customer_socialNum">생년월일</option>
					<option ${page.search eq 'customer_email' ? 'selected' : '' } value="customer_email">이메일</option>
				</select>
				<input class="searchKeyword" type="text" name="keyword" value="${page.keyword}"/>
				<a class="btn-fill" onclick="$('#list').submit();">조회</a>
				
			</div>
		</div>
	</form>
	
	<table style="width: 700px;">
		<tr>
			<th><input type="checkbox" class="list-allCheck" id="list-allCheck"/></th>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>등록일</th>
		</tr>
	<c:forEach items="${page.list }" var="vo" >
			
		<tr>
			<td>
				<input class="list-checkBox" type="checkbox" id="list-check"/>
				<input type="hidden" class=customer_line value="${vo.customer_id }"/>
			</td>
			<td><a onclick="location='detail.cu?customer_id=${vo.customer_id}'">${vo.customer_id }</a></td>
			<td><a onclick="location='detail.cu?customer_id=${vo.customer_id}'">${vo.customer_name }</a></td>
			<td>${fn:substring(vo.customer_socialNum, 0, 6) }</td>
			<td>${vo.customer_registerDate }</td>
		</tr>
	</c:forEach>
	</table>

<jsp:include page="/WEB-INF/views/include/page.jsp" />
<script type="text/javascript" src="js/customer.js" charset="UTF-8"></script>
</body>
</html>