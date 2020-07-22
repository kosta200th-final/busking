<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>

<body>

<%@include file="/common/header.jsp" %>
<%@include file="/common/baechaSubMenu.jsp" %>

<main>
<form action="b-insert.do" method="post">
<br>
			번호판 : <input type="text" name="b_no"><br><br>
			연식 : <input type="text" name="b_year"><br><br>
			연료 : <select name="b_energy"><option>휘발유</option><option>경유</option><option>LPG</option><option>천연가스</option><option>전기</option></select><br><br>
			등록날짜 : <input type="date" name="b_start" id="currentDate1" readonly="readonly"><br><br>
			구분 : <select name="b_type"><option>마을</option><option>시내</option></select><br><br>
			
			사고횟수 : <input type="text" name="b_acc"><br><br>
			주행거리 : <input type="text" name="b_mile"><br><br>
			<input hidden="hidden" type="date" name="b_recent" id="currentDate2" readonly="readonly"><br><br>
			<input type="submit" value="추가">
</main>	
<script>
  document.getElementById('currentDate1').value = new Date().toISOString().substring(0, 10);;
  document.getElementById('currentDate2').value = new Date().toISOString().substring(0, 10);;
</script>
</body>
</html>