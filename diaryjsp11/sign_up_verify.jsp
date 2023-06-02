<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>회원가입</title></head>
<body>
<%
	String result=null;
	String userid=(String)request.getParameter("name");
	String email=(String)request.getParameter("email");
	String password=(String)request.getParameter("password");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String mySQL = null;
	String jdburl = "jdbc:mysql://localhost:3306/webp?serverTimezone=UTC";
	String dbdriver = "com.mysql.jdbc.Driver";
	
	try{
		Class.forName(dbdriver);
		conn = DriverManager.getConnection(jdburl, "root", "0304");
	}catch (SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	}
	
	mySQL="insert into userinfo values(?,?,?)";
	
	try{
		pstmt=conn.prepareStatement(mySQL);
		pstmt.setString(1,userid);
		pstmt.setString(2,password);
		pstmt.setString(3,email);
		pstmt.execute();
	}catch (Exception e){
		System.out.println("연결에 실패했습니다.");
		out.println("<h3>연결에 실패했습니다.</h3>");
	}finally{
		try{
			pstmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	response.sendRedirect("sign_up_complete.jsp");
	%>
	</body></html>
