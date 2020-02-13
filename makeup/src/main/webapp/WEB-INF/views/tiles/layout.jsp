<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEAR DAHLIA</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<%-- <link rel="stylesheet" type="text/css" href="css/common.css?v=<%=new java.util.Date().getTime()%>"> --%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="main" />
<tiles:insertAttribute name="footer" />
</body>
</html>