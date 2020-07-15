<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%@include file="/common/header.jsp" %>

	<main>
	<form action="r-update.do" method="post">
		<table border="1">
		<tr><td><br></td></tr>
		<tr>
			<td> <input type="text" value="${ dto.r_no }" name="r_no" id="r_no" readonly="readonly"> </td>
			<td> <input type="text" name="r_start" id="r_start" placeholder="r_start"> </td>
			<td> <input type="text" name="r_end" id="r_end" placeholder="r_end"> </td>
			<td> <input type="text" name="r_s_time" id="r_s_time" placeholder="r_s_time"> </td>
			<td> <input type="text" name="r_e_time" id="r_e_time" placeholder="r_e_time"> </td>
			<td> <input type="text" name="r_interval" id="r_interval" placeholder="r_interval"> </td>
		</tr> 
		<tr><td><br></td></tr>
		<tr>	
		
			<td> <input type="text" name="r_map" id="r_map"placeholder="r_map"> </td>
			<td> <input type="text" name="r_pay_adult" id="r_pay_adult"placeholder="r_pay_adult"> </td>
			<td> <input type="text" name="r_pay_adult2" id="r_pay_adult2"placeholder="r_pay_adult2"> </td>
			<td> <input type="text" name="r_pay_teen" id="r_pay_teen"placeholder="r_pay_teen"> </td>
			<td> <input type="text" name="r_pay_teen2" id="r_pay_teen2"placeholder="r_pay_teen2"> </td>
			<td> <input type="text" name="r_pay_kid" id="r_pay_kid"placeholder="r_pay_kid"> </td>
			<td> <input type="text" name="r_pay_kid2" id="r_pay_kid2"placeholder="r_pay_kid2"> </td>
		<td><input type="submit" value="수정">
		<input type="reset" value="취소" onclick="location.href='r-list.do'"></td>
		</tr>
	</table>
</form>
</main>

</body>
</html>