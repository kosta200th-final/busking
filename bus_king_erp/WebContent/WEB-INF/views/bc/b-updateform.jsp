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
	<form action="b-update.do" method="post">
		<table border="1">
		<tr><td><br></td></tr>
		<tr>
			<td> <input type="text" value="${ dto.b_no }" name="b_no" id="b_no" readonly="readonly"> </td>
			<td> <input type="text" name="b_year" id="b_year"placeholder="b_year"> </td>
			<td> <input type="text" name="b_energy" id="b_energy"placeholder="b_energy"> </td>
			<td> <input type="date" name="b_start" id="b_start"placeholder="b_start(ex yyyy-mm-dd)"> </td>
			<td> <input type="text" name="b_type" id="b_type"placeholder="b_type"> </td>
		</tr> 
		<tr><td><br></td></tr>
		<tr>	
		
			<td> <input type="text" name="b_acc" id="b_acc"placeholder="b_acc"> </td>
			<td> <input type="text" name="b_state" id="b_state"placeholder="b_state"> </td>
			<td> <input type="text" name="b_mile" id="b_mile"placeholder="b_mile"> </td>
			<td> <input type="date" name="b_recent" id="b_recent"placeholder="b_recent(ex yyyy-mm-dd)"> </td>
		<td><input type="submit" value="수정">
		<input type="reset" value="취소" onclick="location.href='b-list.do'"></td>
		</tr>
	</table>
</form>
</main>

</body>
</html>