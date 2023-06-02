<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>15.print</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<div>
	<div class="right">
	<h1>&nbsp;&nbsp;프린트할 날짜를 선택하세요.</h1><br><br>
	
	<form id="sform">
		<input type="date" id="startprintday">부터<br><br>
		<input type="date" id="finishprintday">까지<br><br>
		<button type="button">인쇄</button>
	</form>
	
	</div>
</div>
</body>
</html>