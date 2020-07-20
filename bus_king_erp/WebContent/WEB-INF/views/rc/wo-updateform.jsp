<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%-- <%@include file="/common/header.jsp" %> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
id.ma {
border:1px;
text-align: center;
margin-right: auto;
 }
</style>
<head>
<script type="text/javascript">


</script>
<meta charset="UTF-8">
<title>자재 리스트</title>
</head>
<body>
	<main>
	  <form action="wo-update.do" method="post">
		<table id="ma">
			<tr>
				<th>코드값</th>
				<th>종류</th>
				<th>총 수량</th>
				<th>개당 가격</th></tr>
			<%-- <c:forEach items="${Wonlyolist}" var="wonlyolist"> --%>
			<tr>
				<td><input type="text" name="wo_code" value="${dto.wo_code}"></td>
				<td><input type="text" name="wo_type" value="${dto.wo_type}"></td>
				<td><input type="number" name="wo_total" id="wo_total" value="${dto.wo_total }"></td>
				<td><input type="text" name="wo_cost" value="${dto.wo_cost}"></td>
				<td><input type="submit" value="수정" ></td>
			</tr>
			

<%-- 			
			<input type="text" name="wo_code" id="wo_code" value="${wonlyolist.wo_code}">
			<input type="text" name="wo_type" id="wo_type"  value="${wonlyolist.wo_type}">
			<input type="number" name="wo_total" id="wo_total" value="${wonlyolist.wo_total}">
			<input type="text" name="wo_cost" id="wo_cost" value="${wonlyolist.wo_cost}"> --%>
		</table>
		</form>
	</main>
</body>
</html>