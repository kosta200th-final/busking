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
<meta charset="UTF-8">
<title>자재 리스트</title>
</head>
<body>
	<main>
 	 <script language="javascript">
  function showPopup() { 
	  window.open("re-list.do", "리스트", "width=1400, height=300, left=100, top=50"); 
	  } 

  </script>
	   <form action="" method="">
		<table id="ma">
			<tr>
				<th>코드값</th>
				<th>종류</th>
				<th>총 수량</th>
				<th>개당 가격</th></tr>
			<c:forEach items="${Wonlyolist}" var="wonlyolist">
			<tr>
				<td>${wonlyolist.wo_code}</td>
				<td>${wonlyolist.wo_type}</td>
				<td>${wonlyolist.wo_total}</td>
				<td>${wonlyolist.wo_cost}</td>
				 <td><input type="button" value="수정"
				onclick="location.href='wo-updateform.do?wo_code=${wonlyolist.wo_code}'"></td> 
				<!-- <input type="submit" value="수정"></td> -->
				<!-- <td><input type="button" value="수정" name="button" onclick="myfun()"></td> -->
				</tr>
			</c:forEach>	
		</table>
				<input type="button" value="점검접수현황" onclick="showPopup();" />
				<input type="submit" value="발주 메일" onclick="window.location ='mailto:email@address.com' "/>
				<input type="button" value="입/출고 내역등록"
						onclick="location.href='woio-list.do'">
	 </form>
	</main>
</body>
</html>