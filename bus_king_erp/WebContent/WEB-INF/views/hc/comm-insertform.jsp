<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file="/common/header.jsp" %>

<main>
<form action="comm-insert.do" method="post">
	년도<input type="text" name="comm_year" id="comm_year"><br>
	월<input type="text" name="comm_month" id="comm_month"><br>
	날짜<input type="text" name="comm_day" id="comm_day"><br>
	평일/주말/공휴일<input type="text" name="comm_type_d" id="comm_type_d"><br>
	사원번호<input type="text" name="comm_e_no" id="comm_e_no"><br>	
	사원이름<input type="text" name="comm_e_name" id="comm_e_name"><br>
	
	부서<input type="text" name="comm_e_dname" id="comm_e_dname"><br>
	직급<input type="text" name="comm_e_position" id="comm_e_position"><br>
	출근/결근/병가/휴가 <input type="text" name="comm_work" id="comm_work"><br>
	
	근무시간 <input type="number" name="comm_time" id="comm_time"><br>
	<input type="submit" value="추가">
</form>
</main>

</body>
</html>