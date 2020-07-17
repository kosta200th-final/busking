<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/accountSubMenu.jsp" %>

<main>
	<form action="ac-list.do" method="post">
		<div class="table100 ver2 m-b-110">
			<table data-vertable="ver2">
				<thead>
					<tr class="row100 head">
						<th class="column100 column1"
							data-column="column1">
							<select name="cnt_code">
								<option>전체</option>
								<option>급여</option>
								<option>정비</option>
								<option>연료</option>
								<option>범칙금</option>
								<option>정산</option>
							</select>
						</th>
						<th class="column100 column2"
							data-column="column2">
							내역
						</th>
						<th class="column100 column3"
							data-column="column3">
							비용
						</th>
						<th class="column100 column4"
							data-column="column4">
							날짜
						</th>
						<th class="column100 column5"
							data-column="column5">
							매입∙매출
							<!-- <select name="ac_state">
								<option>전체</option>
								<option>매입</option>
								<option>매출</option>
							</select> -->
						</th>
						<th class="column100 column6"
							data-column="column6">
							비고
						</th>
						<td>
							<input type="submit" value="확인"></td>
						<td>
							<input type="button" name="state" value="전체"
								onclick="location.href='ac-list.do?cnt_state=전체'">
							<input type="button" name="state" value="매입"
								onclick="location.href='ac-list.do?cnt_state=매입'">
							<input type="button" name="state" value="매출"
								onclick="location.href='ac-list.do?cnt_state=매출'">
							<input type="hidden" value="${ state }"
								name="cnt_state">
						</td>
					</tr>
				</thead>
				<!--  
					AC_CODE VARCHAR2(20) primary key,
					AC_NAME VARCHAR2(40),
					AC_COST NUMBER,
					AC_DATE DATE,
					AC_STATE VARCHAR2(10),
					AC_BIGO VARCHAR2(40)
				-->
				<tbody>
					
						<c:forEach items="${accountList}" var="list">
						<tr>
							<td>${list.ac_code}</td>
							<td>${list.ac_name}</td>
							<td>${list.ac_cost}</td>
							<td>
								<fmt:parseDate value='${list.ac_date}'
									var='trading_day' pattern='yyyy-mm-dd' />
								<fmt:formatDate value="${trading_day}"
									pattern="yyyy-mm-dd" />
							</td>
							<td>${list.ac_state}</td>
							<td>${list.ac_bigo}</td>
							<td>
								<input type="button" value="EDIT"
									onclick="location.href='ac-update.do?ac_code=${list.ac_code}'">
								<input type="button" value="DETAILED"
									class="btn">
							</td>
							</tr>
						</c:forEach>
					
				</tbody>
			</table>
		</div>
	</form action=>

	<table width="600">
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