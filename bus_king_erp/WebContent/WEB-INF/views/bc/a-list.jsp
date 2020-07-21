<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/baechaSubMenu.jsp"%>

<style>
.allocselect{
	width: 25%;
    float: left;
    margin-left: 2.5%;
    background: transparent;
}
.aSelect {
	width: 120px
}
</style>

<main>
	<div class="table100 ver2 m-b-110">
		<form action="a-insert.do" method="post">

			<table>

				<tr align="left">
					<th>&nbsp;차량번호 : <select class="aSelect" name="a_b_no">
							<option>선택</option>
							<c:forEach items="${blist}" var="blist">
								<option>${blist.b_no}</option>
							</c:forEach>
					</select></th>
					<th>노선 : <select name="a_r_no">
							<option>선택</option>
							<c:forEach items="${rlist}" var="rlist">
								<option>${rlist.r_no}</option>
							</c:forEach>
					</select></th>
					<th>버스기사 : <select class="aSelect" name="a_e_no">
							<option>선택</option>
							<c:forEach items="${elist}" var="elist">
								<option>${elist.e_no}:${elist.e_name}</option>
							</c:forEach>
					</select></th>
					<th>근무조 : <select name="a_time">
							<option>A조</option>
							<option>B조</option>
					</select></th>
					<th><input class="button modifyBtn editBtn" type="submit"
						value="배차하기"></th>

					</form>
				</tr>
			</table>
			<br>

			<table class="allocselect">
				<tr>
					<form action="a-list.do" method="post">
						<td>&nbsp;근무조 : <select name="time" id="time">
								<option>전체</option>
								<option>A조</option>
								<option>B조</option>
						</select></td>
						<td><input type="submit" value="보기"
							class="button modifyBtn editBtn"></td>
					</form>
					<td>&nbsp;&nbsp;</td>
					<form action="a-list.do" method="post">
						<td>노선 : <select name="a_r">
							<option>전체</option>
							<c:forEach items="${rlist}" var="rlist">
								<option>${rlist.r_no}</option>
							</c:forEach>
						</select></td>
						<td><input type="submit" value="보기"
							class="button modifyBtn editBtn"></td>
					</form>
				</tr>
				
			</table>
				<table>
					<tr class="row100 head">
						<th>차량번호</th>
						<th>노선</th>
						<th>버스기사</th>
						<th>근무조</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
					<c:forEach items="${allocationlist}" var="list">
						<tr align="center">
							<td>${list.a_b_no}</td>
							<td>${list.a_r_no}</td>
							<td>${list.a_e_no}</td>

							<td>${list.a_time}</td>

							<td><input type="button" value="EDIT"
								class="button modifyBtn editBtn"
								onclick="location.href='a-update.do?a_b_no=${list.a_b_no}&a_r_no=${list.a_r_no}&a_e_no=${list.a_e_no}'"></td>
							<td><input type="button" value="DELETE"
								class="button modifyBtn editBtn"
								onclick="location.href='a-delete.do?a_b_no=${list.a_b_no}&a_r_no=${list.a_r_no}&a_e_no=${list.a_e_no}'"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<table width="600">
				<tr>
					<td align="center">
						<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
							<!-- 5>10 : false / 15>10 : true -->
			[<a href="a-list.do?pg=1">◀◀</a>]
			[<a href="a-list.do?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
							<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
							var="i">
							<c:if test="${i==pg}">[${i}]</c:if>
							<c:if test="${i!=pg}">
				[<a href="a-list.do?pg=${i}">${i}</a>]
			</c:if>
						</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
							<!-- 20<21 : true -->
				[<a href="a-list.do?pg=${toPage+1}">▶</a>]
				[<a href="a-list.do?pg=${allPage}">▶▶</a>]
		
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