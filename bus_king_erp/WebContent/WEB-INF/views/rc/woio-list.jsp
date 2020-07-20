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

  </script>
	   <form action="" method="post">
		<table id="ma">
			<tr>
				<th>No</th>
				<th>입/출고</th>
				<th>종류</th>
				<th>수량</th>
				<th>입/출고 날짜</th>
			<c:forEach items="${wo2}" var="wo2">
			<tr>
				<td>${wo2.wo2_no}</td>
				<td>${wo2.wo2_iptype}</td>
				<td>${wo2.wo2_type}</td>
				<td>${wo2.wo2_number}</td>
			<td><fmt:parseDate value='${wo2.wo2_date}' var='wo2_date' pattern='yyyy-mm-dd'/>
             <fmt:formatDate value="${wo2_date}" pattern="yyyy.mm.dd"/></td>
				<!-- <input type="submit" value="수정"></td> -->
				<!-- <td><input type="button" value="수정" name="button" onclick="myfun()"></td> -->
				</tr>
			</c:forEach>	
		</table>
				<input type="button" value="글쓰기"
				onclick="location.href='woio-insertform.do'">
				<input type="button" value="수량목록"
				onclick="location.href='wo-list.do'">
	 </form>
	 <table width="600">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="woio-list.do?pg=1">◀◀</a>]
			[<a href="woio-list.do?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="woio-list.do?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="woio-list.do?pg=${toPage+1}">▶</a>]
				[<a href="woio-list.do?pg=${allPage}">▶▶</a>]
		
		</c:if> <c:if test="${toPage>=allPage}">
					<!-- 21>=21 :true -->
				[<span style="color: gray">▶</span>]
				[<span style="color: gray">▶▶</span>]
		
		</c:if>

			</td>
		</tr>
	</table>
	</main>
</body>
</html>
	</main>
</body>
</html>