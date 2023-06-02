<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7.welcome</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<div>
	<div class="right">
	<br><br><br>
	<% if(session_id!=null){
		%>
	<h1>환영합니다. <%=session_id %>님!</h1>
	<%}else
	{
		%>
	<h1>로그인이 필요합니다.</h1>
	<%
	}
		%>
	</div>
</div>
</body>
</html>