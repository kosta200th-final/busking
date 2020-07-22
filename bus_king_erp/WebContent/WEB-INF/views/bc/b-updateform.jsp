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
	<form action="b-update.do" method="post">
	
			번호판 : <input type="text" value="${ dto.b_no }" name="b_no" readonly="readonly"> <br><br>
			연식 : <input type="text" value="${ dto.b_year }" name="b_year" readonly="readonly"> <br><br>
			연료 : <input type="text" value="${ dto.b_energy }" name="b_energy" readonly="readonly"> <br><br>
			등록날짜 : <input type="date" value="${ dto.b_start }" name="b_start" readonly="readonly"> <br><br>
			* 구분 : <select name="b_type"><option>마을</option><option>시내</option></select><br><br>

			* 사고횟수 : <input type="text" value="${ dto.b_acc }" name="b_acc"><br><br>
			* 주행거리 : <input type="text" value="${ dto.b_mile }" name="b_mile"><br><br>
			최근정비일 : <input type="date" value="${ dto.b_recent }" name="b_recent" readonly="readonly"><br><br>
			<input type="submit" value="수정">
		<input type="reset" value="취소" onclick="location.href='b-list.do'">

</form>
</main>

</body>
</html>