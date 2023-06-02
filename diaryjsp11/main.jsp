<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4.main</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<div>
	<div class="right">
   <h1>달력</h1>
   <%
   Calendar cr = Calendar.getInstance();
   //현재 년월일
   int CurrentYear = cr.get(Calendar.YEAR);
   int CurrentMonth = cr.get(Calendar.MONTH)+1; //MONTH값은 0~11이므로 +1 해줘야 함.
   int Currentdate = cr.get(Calendar.DATE);
   //오늘 날짜 String
   String today = CurrentYear + ":" +(CurrentMonth)+ ":"+Currentdate;
   
   //매개변수로 들어오는 년,월
   String paraYear = request.getParameter("year");
   String paraMonth = request.getParameter("month");
   
   int year, month;
   
   //처음 상태는 현재 날짜
   if(paraYear ==null && paraMonth == null){
      year = CurrentYear;
      month = CurrentMonth; //0~11 값으로 들어올 것임.
   }else{//동작이 들어온 경우는 매개변수 받음
      year= Integer.parseInt(paraYear);
      month = Integer.parseInt(paraMonth);
      if(month==0){month=12;year=year-1;} //1월에서 작년 12월로 넘어갈 때
      if(month>12){month=1;year=year+1;} //12월에서 내년 1월로 넘어갈 때
   }
   
   // 캘린더의 각 필드에 따른 값 세팅
   cr.set(year, month-1, 1); // MONTH는 0이 1월이므로 month-1
   
   // 월의 첫번째 날짜(1), 마지막 날짜
   int startDate = cr.getMinimum(Calendar.DATE);
   int endDate = cr.getActualMaximum(Calendar.DATE);
   
   // 1일의 요일
   int startDay = cr.get(Calendar.DAY_OF_WEEK);
   int count = 0;
   %>
   
   <table width="1000" cellspacing="1" cellpadding="1" border="1" align="center" style="border:1px solid #CED99C" bgcolor="#F3F9D7">
    <tr class="top">
        <th colspan="1"><a href="main.jsp?year=<%out.print(year-1);%>&month=<%out.print(month);%>">
         <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
         <path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
         <path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
         </svg></a></th>
         <th colspan="1"><a href="main.jsp?year=<%out.print(year);%>&month=<%out.print(month-1);%>">
         <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
         <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
       </svg></a></th>
         <th colspan="3"><%=year %>년 <%=month%>월 </th>
         <th colspan="1"><a href="main.jsp?year=<%out.print(year);%>&month=<%out.print(month+1);%>">
         <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
         <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/></svg>
         </a></th>
         <th colspan="1"><a href="main.jsp?year=<%out.print(year+1);%>&month=<%out.print(month);%>">
         <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
         <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
         <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
         </svg></a></th> 
    </tr>
   
    <tr class="date" height="100">
     <td width='100px'>일</td>
     <td width='100px'>월</td>
     <td width='100px'>화</td>
     <td width='100px'>수</td>
     <td width='100px'>목</td>
     <td width='100px'>금</td>
     <td width='100px'>토</td>
    </tr>
    <tr height="100" >
    
   <% // 달의 시작요일에서 1일이 시작될 수 있도록
   for (int i=1;i<startDay;i++){
    count++;
   %>
        <td>&nbsp;</td>
   <% 
   }
   
   // 달력에 오늘 표시, 공휴일 붉은글씨
   for (int i=startDate;i<=endDate;i++){
       String bgcolor = (today.equals(year+":"+(month)+":"+i))? "#ffff00" : "#FFFFFF";
      String pontcolor = (count%7 == 0 || count%7 == 6)? "red" : "black";
    count++;
   %> 
     <td bgcolor="<%=bgcolor %>"><font size="2" color=<%=pontcolor %>><%=i %></font></td>
   <%
     if(count%7 == 0 && i < endDate){
   %> 
    </tr>
    <tr height="100">
   <%
     }
   }
   
   // 월의 마지막 일 이후로 공란
   while(count%7 != 0){
   %>
        <td>&nbsp;</td>
   <% 
   count++;
    }
   %>
   </tr>  
   </table>
   </div>
</div>
</body>
</html>