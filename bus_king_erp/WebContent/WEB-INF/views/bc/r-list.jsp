<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
	<%@include file="/common/header.jsp" %>
	<%@include file="/common/baechaSubMenu.jsp" %>
	
<style>

.routesub {
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
		<input type="button" value="추가하기" class="button modifyBtn routesub" onclick="location.href='r-insertform.do'">
			<table border="1">
				<tr class="row100 head">
					<th>노선번호</th>
					<th>출발지</th>
					<th>도착지</th>
					<th>첫차 시간</th>
					<th>막차 시간</th>
					<th>배차 간격</th>
					<th>수정</th>
					<th>삭제</th>
					<th>상세보기</th>
					<th style="background-color: #333; color:#333">.</th>
					
				</tr>
				<c:forEach items="${routelist}" var="list">
					<tr align="center">
						<td>${list.r_no}</td>
						<td>${list.r_start}</td>
						<td>${list.r_end}</td>
						
						<td>${list.r_s_time}</td>
						<td>${list.r_e_time}</td>
						<td>${list.r_interval}</td>
	
						<td><input type="button" value="EDIT" class="button modifyBtn editBtn"
							onclick="location.href='r-update.do?r_no=${list.r_no}'"></td>
						<td><input type="button" value="DELETE" class="button modifyBtn editBtn"
							onclick="location.href='r-delete.do?r_no=${list.r_no}'"></td>
						<td><input type="button" value="DETAILED" class="button modifyBtn editBtn btn"></td>

						<td colspan="6"><aside>
							<ul>
								<li>어른요금&nbsp;&nbsp;카드 : ${list.r_pay_adult} 현금 : ${list.r_pay_adult2}</li>
								<li>청소년요금 &nbsp;&nbsp;카드 : ${list.r_pay_teen} 현금 : ${list.r_pay_teen2}</li>
								<li>어린이요금 &nbsp;&nbsp;카드 : ${list.r_pay_kid} 현금 : ${list.r_pay_kid2}</li>
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
			[<a href="r-list.do?pg=1">◀◀</a>]
			[<a href="r-list.do?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="r-list.do?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="r-list.do?pg=${toPage+1}">▶</a>]
				[<a href="r-list.do?pg=${allPage}">▶▶</a>]
		
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