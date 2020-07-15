<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@include file="/common/header.jsp"%>

<main>
	<form action="a-insert.do" method="post">
		<table border="1">
			<tr>
				<th>차량번호</th>
				<th>노선</th>
				<th>버스기사</th>
				<th>근무조</th>
			</tr>
			<tr>
				<td><select name="a_b_no">
						<option>선택</option>
						<c:forEach items="${blist}" var="blist">
							<option>${blist.b_no}</option>
						</c:forEach>
				</select></td>
				<td>&nbsp;<select name="a_r_no">
						<option>선택</option>
						<c:forEach items="${rlist}" var="rlist">
							<option>${rlist.r_no}</option>
						</c:forEach>
				</select></td>
				<td>&nbsp;<select name="a_e_no">
						<option>선택</option>
						<c:forEach items="${elist}" var="elist">
							<option>${elist.e_no}:${elist.e_name}</option>
						</c:forEach>
				</select></td>
				<td>&nbsp;<select name="a_time">
						<option>A조</option>
						<option>B조</option>
				</select></td>
				<td>&nbsp;<input type="submit" value="추가하기">&nbsp;
					&nbsp;
				</td>
			</form>
				<td>
				<%-- <c:if test="${zo eq 'A조'}">
					<input type="radio" name="zo" value="A조" onclick="location.href='a-list.do?pg=1&time=A조'" checked="checked">A조
					<input type="radio" name="zo" value="B조" onclick="location.href='a-list.do?pg=1&time=B조'">B조
					<c:set target="${zo}" value="A조" />
				</c:if>
				<c:if test="${zo eq 'B조'}">
					<input type="radio" name="zo" value="A조" onclick="location.href='a-list.do?pg=1&time=A조'">A조
					<input type="radio" name="zo" value="B조" onclick="location.href='a-list.do?pg=1&time=B조'" checked="checked">B조
					<c:set target="${zo}" value="B조" />
				</c:if> --%>
					<input type="button" name="zo" value="A조" onclick="location.href='a-list.do?time=A조'">&nbsp;
					<input type="button" name="zo" value="B조" onclick="location.href='a-list.do?time=B조'">&nbsp;
				</td>
				<input type="hidden" value="${zo }" name="time">
			</tr>
			<tr>
				<td><br></td>
			</tr>


			<form action="" method="post">
				<c:forEach items="${allocationlist}" var="list">
					<tr>
						<td>${list.a_b_no}&nbsp;</td>
						<td>${list.a_r_no}&nbsp;</td>
						<td>${list.a_e_no}&nbsp;</td>

						<td>${list.a_time}&nbsp;</td>

						<td><input type="button" value="EDIT"
							onclick="location.href='a-update.do?a_b_no=${list.a_b_no}&a_r_no=${list.a_r_no}&a_e_no=${list.a_e_no}'"></td>
						<td><input type="button" value="DELETE"
							onclick="location.href='a-delete.do?a_b_no=${list.a_b_no}&a_r_no=${list.a_r_no}&a_e_no=${list.a_e_no}'"></td>
					</tr>
				</c:forEach>
		</table>
	</form>
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