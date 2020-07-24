<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/common/header.jsp" %>
<%@include file="/common/repairSubMenu.jsp" %>
<script> 
function formSubmit(){ 
	document.getElementById("frm").submit();
}
</script>
<style type="text/css">
#ma{
text-align: center;
width: 350;
line-height:1.5;
}
</style> 
<meta charset="UTF-8">
<title>차량점검리스트</title>

</head>
<body>
	<main>
	<form action="" method="post" id="frm">
				<div class="table100 ver2 m-b-110">
			<table data-vertable="ver2" id=ma>
				<thead>
				<tr class="row100 head">
							<th class="column100 column1" data-column="column1">No</th>
							<th class="column100 column2" data-column="column2">버스 차량번호</th>
							<th class="column100 column3" data-column="column3">주유 타입</th>
							<th class="column100 column4" data-column="column4">주유 날짜</th>
							<th class="column100 column5" data-column="column5">결제 날짜</th>
							<th class="column100 column6" data-column="column6">충전 & 주유 량</th>
							<th class="column100 column7" data-column="column7">충전&주유 비용</th>
							<th class="column100 column8" data-column="column8">회계처리 내용</th>
							<th class="column100 column9" data-column="column9">비고(특이사항)</th>
							<th class="column100 column10" data-column="column10"></th>
							<th class="column100 column11" data-column="column11"></th>
							<th class="column100 column1@" data-column="column12"></th>
						</tr>
			</thead>
			<tbody>
			<c:forEach items="${fuel}" var="fuel">
				<tr>
					<td>${fuel.f_code}</td>
					<td>${fuel.f_b_no}</td>
					<td>${fuel.f_b_energy}</td>
				<td><fmt:parseDate value='${fuel.f_date}' var='f_date' pattern='yyyy-mm-dd'/>
	             <fmt:formatDate value="${f_date}" pattern="yyyy.mm.dd"/></td>
	             <td><fmt:parseDate value='${fuel.f_date2}' var='f_date2' pattern='yyyy-mm-dd'/>
	             <fmt:formatDate value="${f_date2}" pattern="yyyy.mm.dd"/></td>
					<td>${fuel.f_charge}(L/Kw)</td>
					<td>${fuel.f_cost}원</td>
					<td>${fuel.f_payment}</td>
					<td>${fuel.f_nametag}</td>
					<td>${fuel.f_bigo}</td>
					<td><input type="button" value="결제" class="editBtn formBtn" style="background: #1FD0F3; color: white;" 
						onclick="location.href='location.href='f-update.do?f_code=${fuel.f_code}'"></td>
					<td><input type="button" value="삭제" class="editBtn formBtn red" style="background: #F84B4B; color: white;" 
						onclick="location.href='f-delete.do?f_code=${fuel.f_code}'"></td>
						
					<%-- 	
					<td><input type='button' style="background-color: red" onclick="location.href='f-update.do?f_code=${fuel.f_code}'" value='결제'/></td>
					<td><input type="button" style="background: yellow" value="삭제"
						onclick="location.href='f-delete.do?f_code=${fuel.f_code}'"> --%>
				</tr></c:forEach>
				</tbody>
			</table>
		</div>
		
		<input type="button" style="margin: auto; background: skyblue" value="추가하기"
					onclick="location.href='f-insertform.do'">
		
	</form>
		<table style=width:600 class="pgTable">
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