<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/repairSubMenu.jsp"%>
<script>
	function formSubmit() {
		document.getElementById("frm").submit();
	}
</script>
<style type="text/css">
#ma {
	text-align: center;
	width: 350;
	line-height: 1.5;
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
							<th class="column100 column1" data-column="column1">정비코드</th>
							<th class="column100 column2" data-column="column2">버스 차량번호</th>
							<th class="column100 column3" data-column="column3">정비 접수일</th>
							<th class="column100 column4" data-column="column4">정비 완료일</th>
							<th class="column100 column5" data-column="column5">정비 내역</th>
							<th class="column100 column6" data-column="column6">가격</th>
							<th class="column100 column7" data-column="column7">정비 상태</th>
							<th class="column100 column8" data-column="column8">비고</th>
							<th class="column100 column9" data-column="column9"></th>
							<th class="column100 column10" data-column="column10"></th>
						</tr>

						<c:forEach items="${repairlist}" var="repairlist">
							<tr>
								<td>${repairlist.re_code}</td>
								<td>${repairlist.re_b_no}번버스</td>
								<td><fmt:parseDate value='${repairlist.re_date}'
										var='re_date' pattern='yyyy-mm-dd' /> <fmt:formatDate
										value="${re_date}" pattern="yyyy.mm.dd" /></td>
								<td><fmt:parseDate value='${repairlist.re_date2}'
										var='re_date2' pattern='yyyy-mm-dd' /> <fmt:formatDate
										value="${re_date2}" pattern="yyyy.mm.dd" /></td>
								<td>${repairlist.re_breakdown}</td>
								<td>${repairlist.re_cost}원</td>
								<td>${repairlist.re_state}</td>
								<td>${repairlist.re_bigo}</td>
								<td><input type="button" value="수정" class="editBtn formBtn" style="background: #1FD0F3; color: white;" 
									onclick="location.href='re-updateform.do?re_code=${repairlist.re_code}'"></td>
								<td><input type="button" value="삭제"
									class="editBtn formBtn red" style="background: #F84B4B; color: white;" 
									onclick="location.href='re-delete.do?re_code=${repairlist.re_code}'"></td>
							</tr>
						</c:forEach>
					</thead>
				</table>
			</div>
			<input type="button" class="editBtn formBtn" style="background: yellow"   value="추가하기"
				onclick="location.href='re-insertform.do'">
		</form>
		<table width="600" class="pgTable">
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