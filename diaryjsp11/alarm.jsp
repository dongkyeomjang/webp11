<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>18.alarm</title>
</head>
<body>
<div>
	<%@ include file="menu.jsp" %>
	<div class="right">
	<h1>&nbsp;&nbsp;알림을 허용하시겠습니까?</h1><br><br>
	
	<form id="sform">
		매일 <input type="time" id="alarmtime"><br><br>
		<button type="button">알림 취소</button>&nbsp;&nbsp;
		<button type="button">알림 허용</button>
	</form>
	
	</div>
</div>
</body>
</html>