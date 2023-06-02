<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>6.login</title>
</head>
<body>
<div>
	<%session.removeAttribute("user"); %>
	<%@ include file="menu.jsp" %>
	
	<div class="right">
	<h1>로그인</h1>
	
	<form id="sform" action="login_verify.jsp" method="post">
		<label>UserName(ID)</label><br><input type="text" name="name" size="50"><br><br>
		<label>Password</label><br><input type="password" name="password" size="50"><br><br>
		<button type="submit">확인</button><br><br>
		<input type="checkbox" id="checkid" name="checkid">
		<label for="checkid"><span></span></label>아이디 저장<br> <!-- 쿠키이용해서어쩌고 -->
		<input type="checkbox" id="autolog" name="autolog">
		<label for="autolog"><span></span></label>자동 로그인<br><br><br>
		
	</form>
	<h2>&nbsp;&nbsp;아직 회원이 아니신가요?</h2>
	<form id="sform">
		<button type="button" onclick="location.href='sign_up.jsp'">회원가입</button>
	</form>
	</div>
</div>

</body>
</html>