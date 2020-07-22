<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@include file="/common/header.jsp" %> 
<%@include file="/common/repairSubMenu.jsp" %>
<html>
<meta charset="UTF-8">
<head>
<style type="text/css">
ma {
border:1px;
text-align: center;
margin-right: auto;
 }
</style>
	<title>Home</title>
</head>
<body>
<main>
<form action="re-update.do" method="post">
<h1 style="text-align: center;">차량 점검 </h1><br><br>
	<div align="center">
			<div style="width: auto;">

			접수 번호 : <input type="text" name="re_code" value="${dto.re_code}"><br><br>
			차량 번호 :<input type="text" name="re_b_no" value="${dto.re_b_no}"><br><br>
			접수 날짜 : <fmt:parseDate value='${dto.re_date}' var='re_date' pattern='yyyy-mm-dd'/>
             <fmt:formatDate value="${re_date}" pattern="yyyy.mm.dd"/><br><br>
         	완료 날짜 :<input type="date" name="re_date2"><br><br>
			정비 내역 :<input type="text" name="re_breakdown" value="${dto.re_breakdown}"><br><br>
			정비 가격 :<input type="text" name="re_cost" value="${dto.re_cost}"><br><br>
			<label for = "re_state">정비 상태 : </label>
			<input type = "radio" name = "re_state" value = "정비중">정비중
        	<input type = "radio" name = "re_state" value = "정비완료">정비완료<br><br>
        	<a style="margin: auto; text-align: center;">비고(특이사항) : <textarea  rows="10" cols="30" name="re_bigo" value="${dto.re_bigo}">
        	</textarea></a><br>
        	<br> 
        	<input type="submit" value="수정"  onclick="location.href='re-update.do?re_code=${repair.re_code}'">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="취소" onclick="location.href='re-list.do?re_code=${repair.re_code}'"> 
	</div>
	</form>
	</main>
</body>

</html>
