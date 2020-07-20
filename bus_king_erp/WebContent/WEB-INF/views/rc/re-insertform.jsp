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
<form action="re-insert.do" method="post">
<h1 style="text-align: center;">차량 점검 등록</h1>
	<div align="center">
			<input type="text" name="re_code" id="re_code"  hidden=""><br><br>
<%-- 			<select name="re_b_no">
			<c:forEach items="${repairlist}" var="repairlist">
		    <option value="${repairlist.re_b_no}">버스번호</option>
		    </c:forEach>
			</select> --%>
			버스 번호 :<input type="text" name="re_b_no" id="re_b_no" placeholder="버스번호" ><br><br>
			접수 날짜 :<input type="date" name="re_date" id="re_date" placeholder="re_date" ><br><br>
			<!-- <input type="date" name="re_date2" id="re_date2" hidden=""><br><br> -->
			<label for = "re_breakdown">정비 상태 : </label>
			<input type = "radio" name = "re_breakdown" value = "자가점검">자가점검(비고에자제요청)
			<input type = "radio" name = "re_breakdown" value = "차량사고">차량사고
        	<input type = "radio" name = "re_breakdown" value = "차량노후">차량노후<br><br>
			정비 가격 :<input type="text" name="re_cost" id="re_cost"placeholder="가격"><br><br>
			<label for = "re_state">정비 상태 : </label>
			<input type = "radio" name = "re_state" value ="접수">접수<br><br>
        	<a style="margin: auto; text-align: center;">비고(특이사항) : 
        	<textarea  rows="10" cols="30" name="re_bigo"></textarea></a><br><br>
	<input type="submit" value="확인" >&nbsp;&nbsp;&nbsp;
	<input type="reset" value="취소" >
	</div>
	</form>
	</main>
</body>

</html>

 