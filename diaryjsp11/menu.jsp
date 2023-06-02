<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
	div{
		width: 100%;
		height: 800px;
	}
	div.left{
		width: 20%;
		float: left;
		height: 800px;
		box-sizing: border-box;
		border: 1px solid #000;
		text-align: center;
	}
	div.right{
		width: 75%;
		float: right;
	}
	a{
		text-align: center;
		/*text-decoration: none; /* 링크의 밑줄 제거*/
		color: inherit; /*링크의 색상 제거*/
	}
	div.diary{
      width: 70%;
      float: left;
   }
   div.writed{
      width: 70%;
      height: 800px;
      float: left;
   }
   div.photo{
      width: 25%;
      height: 700px;
      float: right;
   }
   div.hashtag{
   	height: 400px;
   	width: 25%;
   	float: right;
   }
   div.todolist{
   	height: 400px;
   	width: 25%;
   	float: right;
   }
   textarea{
      width:95%;
      height:80%;
      resize: none;
      <%--font-family: '궁서'--%>
   }
   table{
   	border-collapse: collapse;
   }
   table.dday{
  	 border: 1px solid #000;
   }
   tr, td{
   	padding: 10px;
   }
	
	#sform{
		text-align: center;
	}
	h1{text-align:center;}
</style>
</head>
<body>
	<% 
		String session_id = (String)session.getAttribute("user"); 
		String log;
  	
		if(session_id==null){
			log="<a href=login.jsp>로그인</a><br><a href='sign_up.jsp'>회원가입</a>";
		} else {
			log="<a href=logout.jsp>로그아웃</a>";
		}
	%>
	<div class="left">
   <br>
   <a> </a>
   <a href="main.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
   <path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"/>
    <path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
    </svg></a><br>
   <a href="D-day.jsp">D-day</a><br><br><br>
   <a href="print.jsp" onclick="printArea()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-printer" viewBox="0 0 16 16">
    <path d="M2.5 8a.5.5 0 1 0 0-                                                                                                                                          1 .5.5 0 0 0 0 1z"/>
    <path d="M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2H5zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4V3zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2H5zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1z"/>
    </svg></a><br>
   <a href="alarm.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-alarm" viewBox="0 0 16 16">
    <path d="M8.5 5.5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9V5.5z"/>
    <path d="M6.5 0a.5.5 0 0 0 0 1H7v1.07a7.001 7.001 0 0 0-3.273 12.474l-.602.602a.5.5 0 0 0 .707.708l.746-.746A6.97 6.97 0 0 0 8 16a6.97 6.97 0 0 0 3.422-.892l.746.746a.5.5 0 0 0 .707-.708l-.601-.602A7.001 7.001 0 0 0 9 2.07V1h.5a.5.5 0 0 0 0-1h-3zm1.038 3.018a6.093 6.093 0 0 1 .924 0 6 6 0 1 1-.924 0zM0 3.5c0 .753.333 1.429.86 1.887A8.035 8.035 0 0 1 4.387 1.86 2.5 2.5 0 0 0 0 3.5zM13.5 1c-.753 0-1.429.333-1.887.86a8.035 8.035 0 0 1 3.527 3.527A2.5 2.5 0 0 0 13.5 1z"/>
    </svg></a><br><br><br>
   <%=log %><br><br><br>
   </div>
</body>
</html>
