<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<form method="post" action="" 	>
	<input type="text" name="no" value="${no }"/>
</form>
<script>
$('form').attr('action', 'detail.pd');
$('form').submit();
</script>