<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@include file="/common/header.jsp" %>
<%@include file="/common/repairSubMenu.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script> 
function formSubmit(){ 
	document.getElementById("frm").submit();
}
</script>
<style type="text/css">
#ma {
border:1px;
text-align: center;
margin-right: auto;
width: 350;
line-height:1.5;
 }

</style>
<head>
<meta charset="UTF-8">
<title>자재 리스트</title>
</head>
<body>
	<main>
 	 <!-- <script language="javascript"> -->
	 <form action="" method="post" id="frm">
			<div class="table100 ver2 m-b-110">
			<table data-vertable="ver2" id=ma>
				<thead>
				<tr class="row100 head">
							<th class="column100 column1" data-column="column1">No</th>
							<th class="column100 column2" data-column="column2">입/출고</th>
							<th class="column100 column3" data-column="column3">종류</th>
							<th class="column100 column4" data-column="column4">수량</th>
							<th class="column100 column5" data-column="column4">입/출고 날짜</th>
						</tr>
			<c:forEach items="${wo2}" var="wo2">
			<tr>
				<td>${wo2.wo2_no}</td>
				<td>${wo2.wo2_iptype}</td>
				<td>${wo2.wo2_type}</td>
				<td>${wo2.wo2_number} 개</td>
			<td><fmt:parseDate value='${wo2.wo2_date}' var='wo2_date' pattern='yyyy-mm-dd'/>
             <fmt:formatDate value="${wo2_date}" pattern="yyyy.mm.dd"/></td>
				<!-- <input type="submit" value="수정"></td> -->
				<!-- <td><input type="button" value="수정" name="button" onclick="myfun()"></td> -->
				</tr>
			</c:forEach>	
		</thead></table></div><br><br>
		<input type="button" value="입고/출고 입력" onclick="location.href='woio-insertform.do'">
		<input type="button" value="수량목록" onclick="location.href='wo-list.do'">
		</form>
	 <table width="600" class="pgTable">
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