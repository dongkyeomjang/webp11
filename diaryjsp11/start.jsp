<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1.start</title>
</head>
<body>
<center>
	<br><br><br><br><br>
	<h1>안녕하세요.</h1><br>
	<script type="text/javascript">
		date = new Date();
		year = date.getFullYear();
		month = date.getMonth() + 1;
		day = date.getDate();
		document.write("오늘은 " + year+"년 "+month+"월 "+day+"일 입니다.");
	</script>
	<br><br>
	<input type="button" id="달력보기" value="달력 보기" onClick="location.href='main.jsp'">&nbsp;&nbsp;
	<input type="button" id="로그인" value="로그인" onClick="location.href='login.jsp'">&nbsp;&nbsp;
	<input type="button" id="회원가입" value="회원가입" onClick="location.href='sign_up.jsp'">
</center>
</body>
</html>