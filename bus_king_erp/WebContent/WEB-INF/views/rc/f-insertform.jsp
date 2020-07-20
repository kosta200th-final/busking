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
<form action="f-insert.do" method="post">
<h1 style="text-align: center;">주유 등록</h1>
	<div align="center">

	    <input type="text" name="f_code" id="f_code" placeholder="f_code" value="${fuel.f_code}" hidden=""><br><br>
	       버스 번호 :<input type="text" name="f_b_no" id="f_b_no" placeholder="버스번호" value="${fuel.f_b_no}"><br><br>
	   <label for = "f_b_energy">주유 타입 : </label>
	    <input type = "radio" name = "f_b_energy" id="f_b_energy" value = "전기">전기
        <input type = "radio" name = "f_b_energy"id="f_b_energy" value = "경유">경유<br><br>
		접수 날짜 :<input type="date" name="f_date" id="f_date"placeholder="re_date"><br><br>
		주유 량 :<input type="number" name="f_charge" id="f_charge" placeholder="숫자로만 입력"><br><br>
		주유 비 :<input type="number" name="f_cost" id="f_cost"placeholder="숫자로만 입력"><br><br>
		<label for = "f_payment">결제 여부 : </label>
		<input type = "radio" name = "f_payment" id="f_payment"value = "미결제">미결제
       	<input type = "radio" name = "f_payment" id="f_payment" value = "결제완료">결제완료<br><br>
	          요약 :<input type="text" name="f_nametag" id="f_nametag" placeholder="차량번호/날짜/주유 비"><br><br>
                   비고(특이사항) : <textarea  rows="10" cols="30" name="f_bigo"></textarea><br><br>
	<input type="submit" value="확인" >&nbsp;&nbsp;&nbsp;
	<input type="reset" value="취소" >
	</div>
	</form>
	</main>
</body>

</html>
