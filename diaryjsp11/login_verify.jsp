<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	String userID = request.getParameter("name");
	System.out.println("name: "+userID);
	String userPassword = request.getParameter("password");
	System.out.println("password: "+userPassword);
	Connection conn = null;
	Statement stmt = null;
	String mySQL = null;
	String jdburl = "jdbc:mysql://localhost:3306/webp?serverTimezone=UTC";
	String dbdriver = "com.mysql.jdbc.Driver";

	Class.forName(dbdriver);
	conn = DriverManager.getConnection(jdburl, "root", "0304");
	stmt = conn.createStatement();
	mySQL = "select UserID from UserInfo where UserId='" + userID + "' and Password='" + userPassword + "'";
	
	ResultSet myResultSet = stmt.executeQuery(mySQL);
	

	if (myResultSet.next()) {
		session.setAttribute("user", userID);
		response.sendRedirect("welcome.jsp");
	} else {
%>

<script>
	alert("사용자아이디 혹은 암호가 틀렸습니다.");
	location.href = "login.jsp";
</script>
<%
	}
	stmt.close();
	conn.close();
%>
