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
<%@include file="/common/hrSubMenu.jsp" %>

<main>
<form action="pay-insert.do" method="post">
	사원넘버<input type="text" name="pay_e_no" id="pay_e_no"><br>
	사원이름<input type="text" name="pay_e_name" id="pay_e_name"><br>
	부서<input type="text" name="pay_e_dname" id="pay_e_dname"><br>
	직급<input type="text" name="pay_e_position" id="pay_e_position"><br>
	네임태그<input type="text" name="pay_nametag" id="pay_nametag"><br>	
	비고<input type="text" name="pay_bigo" id="pay_bigo"><br>
	
	해당년도<input type="number" name="pay_year" id="pay_year"><br>
	해당월<input type="number" name="pay_month" id="pay_month"><br>
	지급일<input type="date" name="pay_day" id="pay_day"><br>
	출근일수<input type="number" name="pay_chul" id="pay_chul"><br>
	근무시간<input type="number" name="pay_work" id="pay_work"><br>
	특근시간<input type="number" name="pay_work_t" id="pay_work_t"><br>
	기본급<input type="number" name="pay_p" id="pay_p"><br>
	특근수당<input type="number" name="pay_p_t" id="pay_p_t"><br>
	식대<input type="number" name="pay_bob" id="pay_bob"><br>
	차량지원비<input type="number" name="pay_car" id="pay_car"><br>
	만차수당<input type="number" name="pay_m" id="pay_m"><br>
	세금공재액<input type="number" name="pay_tax" id="pay_tax"><br>
	급여합계<input type="number" name="pay_total" id="pay_total"><br>
	
	<input type="submit" value="추가">
</form>
</main>

</body>
</html>