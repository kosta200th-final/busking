<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/repairSubMenu.jsp"%>
<style>
.bussub {
	float: right;
	margin-right: 2.5%;
	
	/* margin-left: 2.5%; */
    padding-left: 0px;
    padding: 5px 10px;
    font-size: 12px;
    border: solid .5px #60ad5e;
    color: #4c8c4a;
    /* background: transparent; */
    cursor: pointer;
}
</style>
<title>차량점검리스트</title>

</head>
<body>
	<main>
		<form action="" method="post" >
			<div class="table100 ver2 m-b-110">
			<br>
				<input type="button" value="추가하기" class="bussub button modifyBtn"
				onclick="location.href='re-insertform.do'"><br>
				<table data-vertable="ver2">
						<tr class="row100 head">
						<th>정비코드</th>
						<th>버스 차량번호</th>
						<th>정비 접수일</th>
						<th>정비 완료일</th>
						<th>정비 내역</th>
						<th>가격</th>
						<th>정비 상태</th>
						<th>비고</th>
						<th></th>
						<th></th>
						<th></th>
						</tr>

						<c:forEach items="${repairlist}" var="repairlist">
							<tr align="center">
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
								<td class="last" colspan="7" style="background: transparent">
								<input type="button"  value="정비완료" class="type button all"
									onclick="location.href='re-ac.do?re_code=${repairlist.re_code}&re_b_no=${repairlist.re_b_no}&re_state=정비완료'">
								<input type="button"  value="수정" class="type button blue"
									onclick="location.href='re-updateform.do?re_code=${repairlist.re_code}'">
							<input type="button"  value="삭제" class="type button red"
									onclick="location.href='re-delete.do?re_code=${repairlist.re_code}'"> 
								</td>
							</tr>
						</c:forEach>
					</thead>
				</table>
			</div>

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