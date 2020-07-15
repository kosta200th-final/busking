<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@include file="/common/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
ma{
text-align: center;
margin: auto;
}
</style>
<meta charset="UTF-8">
<title>차량점검리스트</title>

</head>
<body>
	<main>
	<form action="" method="post">
		<table id="ma">
			<tr>
				<th>No</th>
				<th>버스 차량번호</th>
				<th>주유 타입</th>
				<th>주유 날짜</th>
				<th>충전 & 주유 량</th>
				<th>충전&주유 비용</th>
				<th>결제여부</th>
				<th>회계처리 내용</th>
				<th>비고(특이사항)</th>

				</tr>
			<c:forEach items="${fuel}" var="fuellist">
				<tr>
					<td>${fuellist.f_code}</td>
					<td>${fuellist.f_b_no}</td>
					<td>${fuellist.f_b_energy}</td>
					<td>${fuellist.f_date}</td>
					<td>${fuellist.f_charge}</td>
					<td>${fuellist.f_cost}</td>
					<td>${fuellist.f_payment}</td>
					<td>${fuellist.f_nametage}</td>
					<td>${fuellist.f_bigo}</td>
					

					<td><input type="button" value="수정"
						onclick="location.href='f-updateform.do?f_code=${fuellist.f_code}'"></td>
					<td><input type="button" value="삭제"
						onclick="location.href='f-delete.do?f_code=${fuellist.f_code}'">
				</tr>

			</c:forEach>
				<td><input type="button" background="red" value="추가하기"
					onclick="location.href='f-insertform.do'"></td>
		</table>
	</form>
	<table width="600">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="f-list?pg=1">◀◀</a>]
			[<a href="f-list.do?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="f-list.do?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="f-list.do?pg=${toPage+1}">▶</a>]
				[<a href="f-list.do?pg=${allPage}">▶▶</a>]
		
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