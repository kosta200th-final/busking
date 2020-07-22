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
<form action="r-insert.do" method="post">
			노선번호 : <input type="text" name="r_no"><br><br>
			출발지 : <input type="text" name="r_start"><br><br>
			도착지 : <input type="text" name="r_end"><br><br>
			첫차시간 : <input type="text" name="r_s_time"><br><br>
			막차시간 : <input type="text" name="r_e_time"><br><br>
			배차간격 : <input type="text" name="r_interval"><br><br>

			노선도(이미지) : <input type="text" name="r_map"><br><br>
			성인요금(카드) : <input type="text" name="r_pay_adult"><br><br>
			성인요금(현금) : <input type="text" name="r_pay_adult2"><br><br>
			청소년요금(카드) : <input type="text" name="r_pay_teen"><br><br>
			청소년요금(현금) : <input type="text" name="r_pay_teen2"><br><br>
			어린이요금(카드) : <input type="text" name="r_pay_kid"><br><br>
			어린이요금(현금) : <input type="text" name="r_pay_kid2"><br><br>
			<input type="submit" value="추가">
</main>	

</body>
</html>