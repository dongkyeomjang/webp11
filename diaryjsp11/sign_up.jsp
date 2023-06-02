<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2.회원가입</title>
</head>
<body>
<%@ include file="menu.jsp" %>

<div>
	
	<div class="right">
	<h1>회원가입</h1>
	
	<form id="sform" action="sign_up_verify.jsp" method="post">
		<label>UserName(ID)</label><br><input type="text" name="name" size="50"><br><br>
		<label>E-Mail</label><br><input type="text" name="email" size="50"><br><br>
		<label>Password</label><br><input type="password" name="password" size="50"><br><br>
		<button type="reset">CANCEL</button>&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="submit">SUBMIT</button>
	</form>
	
	</div>
</div>
</body>
</html>