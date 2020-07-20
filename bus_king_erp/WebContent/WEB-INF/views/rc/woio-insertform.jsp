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
	  <form action="woio-insert.do" method="post">
		<table id="ma">
			<tr>

				<th>입/출고</th>
				<th>종류</th>
				<th>수량</th>
				<th>날짜</th></tr>
			<tr>
				<td><input type="hidden" name="wo2_no" value="${wo2.wo2_no}"></td>
				<td><select name="wo2_iptype">
		   		 <option value="입고">입고</option>
		   		 <option value="출고">출고</option></select>
				<td><select name="wo2_type">
		   		 <option value="타이어">타이어</option>
		   		 <option value="워셔액">워셔액</option>
		   		 <option value="베터리">베터리</option>
		   		 <option value="와이퍼">와이퍼</option>
		   		 <option value="체인">체인</option>
		   		 <option value="점퍼케이블">점퍼케이블</option>
		   		 </select>
				<td><input type="number" name="wo2_number" value="${wo2.wo2_number}"></td>
				<td><input type="date" name="wo2_date" value="${wo2.wo2_date}"></td>
				<td><input type="submit" value="등록" ></td>
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