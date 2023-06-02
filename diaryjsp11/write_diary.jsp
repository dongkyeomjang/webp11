<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10.write_diary</title>
<style type = "text/css">

   @font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
   }
   @font-face {
    font-family: 'HSSaemaul-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSSaemaul-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
   }
   @font-face {
    font-family: 'FUNFLOW SURVIVOR';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/FUNFLOW SURVIVOR.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
   }
   
   a:hover {color:red; text-decoration:none;}
</head>
<body>
<%@ include file="menu.jsp" %>
<div>
   <script type="text/javascript">
      defsize = 12;
      document.write("<sty"+"le> textarea { font-size : " + defsize + "pt; } </st"+"yle>"); //기본 크기 적용
      function zoom_it(n) {  //zoom_it 함수 => n 만큼 양수는 글꼴을 크게 음수는 작게
         defsize+=n; 
           objs = document.getElementsByTagName("textarea");  
           for(i=0;i<objs.length;i++)
             objs[i].style.fontSize=defsize + "pt";
      }
      function font_change(objs, newFont)
   {
      objs = document.getElementsByTagName("textarea");  
       if(objs)
          for(i=0;i<objs.length;i++)
             objs[i].style.fontFamily = newFont;
   } 
   </script>
   
   <div id = "box">
   <div class="right">
      <div class="diary">
         <div class="writed">
         <h1>&nbsp;&nbsp;날짜</h1>
         <input type="button" value="+" onClick="zoom_it(1)">
         <input type="button" value="-" onClick="zoom_it(-1)">
         <select name = "sel-font" onchange = "font_change(diary_content, this.value)">
         <option value = "굴림"> 굴림 </option>
         <option value = "NanumSquareNeo-Variable"> 폰트1 </option>
         <option value = "HSSaemaul-Regular"> 폰트2 </option>
         <option value = "FUNFLOW SURVIVOR"> 폰트3 </option>
         &nbsp;&nbsp;<textarea id="diary_content"></textarea><br>
         &nbsp;&nbsp;<button type="button">제출</button>
         </div>
         <h1>&nbsp;&nbsp;사진</h1>
         <div class="photo">
         
         </div>
      </div>
      
      <script>
   
   function addtag(){
      document.getElementById("addhashtag").style.display = "block";
   }
   function addRow(){
      const table = document.getElementById("hashtag");
      const newRow = table.insertRow();//새 행 추가
      const newCell1 = newRow.insertCell(0);//새 행에 cell추가
      const newCell2 = newRow.insertCell(1);
      
      var btn = document.createElement('button');
	  var btntext = document.createTextNode('삭제');
      var e = document.getElementById("event").value;
      
      newCell1.innerText = '#'+e;//cell에 텍스트 추가
      btn.appendChild(btntext);
	  btn.onclick = function(){deleterow1(this)};
	  newCell2.appendChild(btn);
	  btn.className = 'deletebutton';
      document.getElementById("addhashtag").style.display = "none";
   }
   function deleterow1(obj){
		var tr = obj.parentNode.parentNode;
		tr.parentNode.removeChild(tr);
	}
   </script>
      <div class="hashtag">
      	<h1>해시태그</h1><br>
      	<center>
         <table id="hashtag">
         </table>
         <button type="button" onclick="addtag()">추가</button><br>
         <form id="addhashtag" style="display:none">
         hashtag: <input type="text" id="event" placeholder="입력" autocomplete='off'><br>
         <button type="button" onclick="addRow()">완료</button>
         </form>
         </center>
      </div>
      <div class="todolist">
         <h1>to-do list</h1>
         <center>
         <input id="inputField" type="text" placeholder="입력" autocomplete='off'>   <!--text 입력창(할일 입력창) 만들기-->
        <button id="addToDo"> + </button>     <!-- + 버튼 만들기 -->
        <div class="to-dos" id="toDoList"> </div>  <!-- id = inputField에 할일이 입력되고 + 버튼이 눌리면 할일이 나타날 공간 만들기-->
         </center>
      </div>
      <script src="todolist.js"> </script>   <!--javascript 파일 참조하기-->
     </div>
     </div>
</div>
<script type="text/javascript">

var initBody;

function beforePrint() {
 boxes = document.body.innerHTML;
 document.body.innerHTML = box.innerHTML;
}
function afterPrint() { 
 document.body.innerHTML = boxes;
}
function printArea() {
 window.print();
}

window.onbeforeprint = beforePrint;
window.onafterprint = afterPrint;


</script>
</body>
</html>