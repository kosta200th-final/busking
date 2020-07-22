<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
	<%@include file="/common/header.jsp" %>
	<%@include file="/common/baechaSubMenu.jsp" %>
	
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

	<main>
		<div class="table100 ver2 m-b-110">
		<br>
		<input type="button" value="추가하기" class="bussub button modifyBtn"
						onclick="location.href='b-insertform.do'">
			<table>
				<tr class="row100 head">
					<th>차량번호</th>
					<th>연식</th>
					<th>연료</th>
					<th>운행 시작 날짜</th>
					<th>구분</th>
					<th>사고횟수</th>
					<th>상태</th>
					<th>정비</th>
					<th>수정</th>
					<th>삭제</th>
					<th>상세보기</th>
					<th style="background-color: #333; color:#333">.</th>
				</tr>
				<c:forEach items="${buslist}" var="list">
					<tr align="center">
						<td>${list.b_no}</td>
						<td>${list.b_year}년</td>
						<td>${list.b_energy}</td>
						
						<td>${list.b_start}</td>
						<td>${list.b_type}</td>
						<td>${list.b_acc}</td>
						<td>${list.b_state}</td>
	
		
						<td><input type="button" value="정비접수" class="button modifyBtn editBtn"
							onclick="location.href='b-repair.do?b_no=${list.b_no}&b_state=${list.b_state}'"></td>
						<td><input type="button" value="EDIT" class="button modifyBtn editBtn"
							onclick="location.href='b-update.do?b_no=${list.b_no}'"></td>
						<td><input type="button" value="DELETE" class="button modifyBtn editBtn"
							onclick="location.href='b-delete.do?b_no=${list.b_no}'"></td>
						<td><input type="button" value="DETAILED" class="button modifyBtn editBtn btn"></td>
						
				
						<td colspan="6"><aside>
							<ul>
								<li>주행거리 : ${list.b_mile}</li>
								<li>최근 정비 날짜 : ${list.b_recent}</li>
							</ul>
						</aside></td>
					</tr>
				</c:forEach>
			</table>
			
		</div>
	<table width="600">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="b-list.do?pg=1">◀◀</a>]
			[<a href="b-list.do?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="b-list.do?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="b-list.do?pg=${toPage+1}">▶</a>]
				[<a href="b-list.do?pg=${allPage}">▶▶</a>]
		
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