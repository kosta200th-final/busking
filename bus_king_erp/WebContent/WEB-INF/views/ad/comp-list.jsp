<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/common/header.jsp" %>
<%@include file="/common/accidentSubMenu.jsp" %>	
<main>
	<div class="table100 ver2 m-b-110">
		<table data-vertable="ver2">
			<thead>
				<tr class="row100 head">
					<th class="column100 column1" data-column="column1">번호</th>
					<th class="column100 column2" data-column="column2">제목</th>
					<th class="column100 column3" data-column="column3" style="width: 15%">분류</th>
					<th class="column100 column4" data-column="column4" style="width: 10%">작성날짜</th>
					<th class="column100 column5" data-column="column5" style="width: 10%">비고</th>
					<th>
						<a class="okBtn" onclick="location.href='comp-insertform.do'">추가</a>
					</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${complaintlist}" var="list">
				<tr>
					<td class="code">${list.c_no}</td>
					<td class="centre">${list.c_title}</td>
					<td class="centre">${list.c_type}</td>
					<td class="date">
						<fmt:parseDate value='${list.c_date}' var='trading_day' pattern='yyyy-mm-dd' /> 
						<fmt:formatDate value="${trading_day}" pattern="yyyy/mm/dd" />
					</td>
					<td>
						<!-- 비고 -->
					</td>
					<td class="btn-width">
						 <span class="btn-wrap">
						<input type="button" value="수정" class="button type green" onclick="location.href='comp-updateform.do?c_no=${list.c_no}'">
						<input type="button" value="삭제" class="button type red" onclick="location.href='comp-delete.do?c_no=${list.c_no}'">
						<input type="button" value="더보기" class="button type all btn">
					</span>
						<aside>
							<ul>
								<li>민원내용 : ${list.c_content}</li>
								<li>버스번호 : ${list.c_b_no}</li>
								<li>직원사번 : ${list.c_e_no}</li>
								<li>직원이름 : ${list.c_e_name}</li>
							</ul>
						</aside>
					</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
<table width="600" class="pgTable">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="comp-list.do?pg=1">◀◀</a>]
			[<a href="comp-list.do?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="comp-list.do?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="comp-list.do?pg=${toPage+1}">▶</a>]
				[<a href="comp-list.do?pg=${allPage}">▶▶</a>]
		
		</c:if> <c:if test="${toPage>=allPage}">
					<!-- 21>=21 :true -->
				[<span style="color: gray">▶</span>]
				[<span style="color: gray">▶▶</span>]
		
		</c:if>
			</td>
		</tr>
	</table>
</main>
	