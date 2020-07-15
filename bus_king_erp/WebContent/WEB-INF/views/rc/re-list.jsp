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
				<th>정비 접수일</th>
				<th>정비 내역</th>
				<th>정비 비용</th>
				<th>정비 상태</th>
				<th>비고</th>

				</tr>
			<c:forEach items="${repairlist}" var="repairlist">
				<tr>
					<td>${repairlist.re_code}</td>
					<td>${repairlist.re_b_no}</td>
					<td>${repairlist.re_date}</td>
					<td>${repairlist.re_breakdown}</td>
					<td>${repairlist.re_cost}</td>
					<td>${repairlist.re_state}</td>
					<td>${repairlist.re_bigo}</td>

					<td><input type="button" value="수정"
						onclick="location.href='re-updateform.do?re_code=${repairlist.re_code}'"></td>
					<td><input type="button" value="삭제"
						onclick="location.href='re-delete.do?re_code=${repairlist.re_code}'">
				</tr>

			</c:forEach>
				<td><input type="button" background="red" value="추가하기"
					onclick="location.href='re-insertform.do'"></td>
		</table>
	</form>
	<table width="600">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="re-list.do?pg=1">◀◀</a>]
			[<a href="re-list.do?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="re-list.do?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="re-list.do?pg=${toPage+1}">▶</a>]
				[<a href="re-list.do?pg=${allPage}">▶▶</a>]
		
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