<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<html>
<meta charset="UTF-8">
<head>

	<title>Home</title>
</head>
<body>
<%@include file="/common/header.jsp" %> 
<main>
<form action="re-update.do" method="post">
<h1 style="text-align: center;">차량 점검 </h1><br><br>
	<div align="center">
			<div style="width: auto;">접수 번호 :<input type="text" name="re_code" id="re_code" placeholder="re_code" value="${repair.re_code }"></div><br><br>

		<input type="text" name="re_b_no" id="re_b_no" placeholder="버스번호" hidden="" value="${repair.re_b_no}">
			<input type="date" name="re_date" id="re_date"placeholder="re_date" hidden="" value="${repair.re_date}">
			<input type="text" name="re_cost" id="re_cost"placeholder="가격" hidden="" value="${repair.re_cost}">
			<label for = "re_breakdown" hidden=""> </label>
			<input type = "radio" name = "re_breakdown" value = "차량사고"  hidden="" >
        	<input type = "radio" name = "re_breakdown" value = "차량노후"  hidden="">
		    <label for = "re_state"></label>
			<input type = "radio" name = "re_state" value = "정비중">정비중
        	<input type = "radio" name = "re_state" value = "정비완료">정비완료<br><br>
        	<a style="margin: auto; text-align: center;">비고(특이사항) : <textarea  rows="10" cols="30" name="re_bigo"></textarea></a><br><br>
        	<input type="submit" value="수정"  onclick="location.href='re-update.do?re_code=${repair.re_code}'">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="취소" onclick="location.href='re-list.do?re_code=${repair.re_code}'">
	</div>
	</form>
	</main>
</body>

</html>
