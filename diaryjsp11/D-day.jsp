<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>12.D-day</title>
</head>
<body>
<%@ include file="menu.jsp" %>

<div>
	
	<div class="right" id="right">
	<br><br><br>
	<h1>D-DAY</h1><br>
	
	<script>
	function calcDday(date) { //dday계산함수
		var now = new Date();
	    var today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
	    var base = new Date(date.substring(0,4), Number(date.substring(5,7))-1, date.substring(8,10));
	    var dDay = (today - base) / 1000 / 60 / 60 / 24;
	    if(dDay < 0) {
	        return "D" + dDay;
	    } else if(dDay == 0) {
	        return "D-day!";
	    } else {
	        return "D+" + dDay;
	    }
	}
	</script>
	<script>
	
	function add(){
		document.getElementById("adddday").style.display = "block";
	}
	function addRow(){
		const table = document.getElementById("dday");
		const newRow = table.insertRow();//새 행 추가
		const newCell1 = newRow.insertCell(0);//새 행에 cell추가
		const newCell2 = newRow.insertCell(1);
		const newCell3 = newRow.insertCell(2);
		
		var btn = document.createElement('button');
		var btntext = document.createTextNode('삭제');
		var e = document.getElementById("event").value;
		var d = document.getElementById("ddate").value;
		
		newCell1.innerText = e;//cell에 텍스트 추가
		newCell2.innerText = calcDday(d);
		btn.appendChild(btntext);
		btn.onclick = function(){deleterow1(this)};
		newCell3.appendChild(btn);
		btn.className = 'deletebutton';
		document.getElementById("adddday").style.display = "none";
	}
	function deleterow1(obj){
		var tr = obj.parentNode.parentNode;
		tr.parentNode.removeChild(tr);
	}
	</script>
	<center>
	<table id="dday" border="1">
		<tr><td>event</td><td>d-day</td><td>삭제버튼</td>
		</tr>
	</table>
	
	<br>
	<button type="button" onclick="add()">추가</button><br>
	<form id="adddday" style="display:none">
	event: <input type="text" id="event" placeholder="입력" autocomplete='off'><br>
	<input type="date" id="ddate"><br>
	<button type="button" onclick="addRow()">완료</button>
	</form>
	</center>
	</div>
</div>

</body>
</html>