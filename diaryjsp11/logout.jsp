<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    
<% 
	session.removeAttribute("user");
	response.sendRedirect("logout_complete.jsp");
%>