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
	<form action="a-update.do" method="post">
		<table border="1">
		<tr><td><br></td></tr>
		<tr>
			<td> <input type="text" value="${ dto.a_b_no }" name="a_b_no" readonly="readonly"> </td>
			<td> <input type="text" value="${ dto.a_r_no }" name="a_r_no" id="b_no" readonly="readonly"> </td>
			<td> <input type="text" value="${ dto.a_e_no }" name="a_e_no" id="b_no" readonly="readonly"> </td>
			<td>&nbsp;<select name="a_time">
						<option>A조</option>
						<option>B조</option>
				</select></td>
			
		<td><input type="submit" value="수정">
		<input type="reset" value="취소" onclick="location.href='a-list.do'"></td>
		</tr>
	</table>
</form>
</main>

</body>
</html>