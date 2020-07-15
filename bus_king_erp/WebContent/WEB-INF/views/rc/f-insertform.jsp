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
	1<input type="text" id="f_code" hidden="" name="f_code"><br><br>
	2<input type="text" id="f_b_no"  name="f_b_no"><br><br>
	3<input type="text" id="f_b_energy"  name="f_b_energy"><br><br>
	4<input type="date" id="f_date" name="f_date"><br><br>
	5<input type="text" id="f_charge"  name="f_charge"><br><br>
	6<input type="text" id="f_cost"  name="f_cost"><br><br>
	7<input type="text" id="f_payment"  name="f_payment"><br><br>
	8<input type="text" id="f_nametag"  name="f_nametag"><br><br>
	9<input type="text" id="f_bigo"  name="f_bigo">
        	
	<input type="submit" value="확인" >&nbsp;&nbsp;&nbsp;
	<input type="reset" value="취소" >
	</div>
	</form>
	</main>
</body>

</html>
