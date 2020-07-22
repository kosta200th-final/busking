<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@include file="/common/header.jsp" %>
<%@include file="/common/accountSubMenu.jsp" %>
<script>
function formSubmit(){ 
	document.getElementById("frm").submit();
}
</script>
<main>
	<form action="" method="post" id="frm">
		<div class="table100 ver2 m-b-110">
			<table data-vertable="ver2">
				<thead>
					<tr class="row100 head">
						<th class="column100 column1" data-column="column1">정산코드</th>
						<th class="column100 column2" data-column="column2">정산날짜</th>
						<th class="column100 column3 carNum" data-column="column3">차량번호</th>
						<th class="column100 column4" data-column="column4">카드매출합계</th>
						<th class="column100 column5" data-column="column5">현금매출합계</th>
						<th class="column100 column6" data-column="column6">일별매출합계</th>
						<th class="column100 column7" data-column="column7">설명</th>
						<th class="column100 column8" data-column="column8">비고</th>
						<th colspan="2" class="column100 column9" data-column="column9">
							<!-- <input	type="button" value="추가" class="addBtn"
							onclick="location.href='cal-insertform.do'"> -->
							<a class="okBtn" href="cal-insertform.do" 
							onclick="formSubmit(); return false;">추가</a>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${callist}" var="list">
						<tr>
							<td class="code">${list.cal_code}</td>
							<td class="date"><fmt:parseDate value='${list.cal_date}'
								var='trading_day' pattern='yyyy-mm-dd' />
							<fmt:formatDate value="${trading_day}"
								pattern="yyyy-mm-dd" /></td>
							<td class="carNum">${list.cal_b_no}</td>
							<td class="price">${list.cal_hap_c}</td>
							<td class="price">${list.cal_hap_m}</td>
							<td class="price">${list.cal_total}</td>
							<td class="note">${list.cal_nametag}</td>
							<td class="bigo">${list.cal_bigo}</td>
							<td class="last">
								<input type="button" value="수정" class="button modifyBtn editBtn"
								onclick="location.href='cal-update.do?cal_code=${list.cal_code}'">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
	
	<table width="600" class="pgTable">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="cal-list.do?pg=1">◀◀</a>]
			[<a href="cal-list.do?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="cal-list.do?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="cal-list.do?pg=${toPage+1}">▶</a>]
				[<a href="cal-list.do?pg=${allPage}">▶▶</a>]
		
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