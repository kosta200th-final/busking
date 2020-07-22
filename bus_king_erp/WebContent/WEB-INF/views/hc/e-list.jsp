<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@include file="/common/header.jsp" %>
<%@include file="/common/hrSubMenu.jsp" %>
<script>
function formSubmit(){ 
	document.getElementById("frm").submit();
}
</script>
<main>
	<form action="e-list.do" method="post"  id="frm">
			<div class="table100 ver2 m-b-110">
			<table data-vertable="ver2">
				<thead>
		<input type="text" name="search" >
		<input type="submit" value="검색">
		<input type="button" onclick="location.href='e-list.do'" value="전체보기">
	
			<tr class="row100 head">
						<th class="column100 column1" data-column="column1">사원번호</th>
						<th class="column100 column2" data-column="column2">이름</th>
						<th class="column100 column3 carNum" data-column="column3">주민등록번호</th>
						<th class="column100 column4" data-column="column4">부서</th>
						<th class="column100 column5" data-column="column5">직급</th>
						<th class="column100 column6" data-column="column6">차량번호</th>
						<th class="column100 column7" data-column="column7">운전면허</th>
						<th class="column100 column8" data-column="column8">계약서 작성여부</th>
						<th class="column100 column9" data-column="column9">운전경력</th>
						<th class="column100 column10" data-column="column10">남은 휴가일</th>
						
				
				<td><input type="button" value="사원등록"
					onclick="location.href='e-insertform.do'"></td>
			</tr>
			</thead>
			<c:forEach items="${employerlist}" var="list">
				<tr>
					<td align="center">${list.e_no}</td>
					<td align="center"><a href="e-updateform.do?e_no=${list.e_no}">${list.e_name}</a></td>
					<td align="center">${list.e_jumin}</td>					
					<td align="center">${list.e_dname}</td>
					<td align="center">${list.e_position}</td>
					<td align="center">${list.e_b_no}</td>
					<td align="center">${list.e_license}</td>
					<td align="center">${list.e_contract}</td>
					<td align="center">${list.e_career}</td>
					<td align="center">${list.e_break}</td>
					
					
					<!-- <td><input type="button" value="DETAILED" class="btn"></td> -->
				</tr>
			</c:forEach>
		</table>
		
		</div>
		</form>
<table width="600" class="pgTable">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="home.do?pg=1">◀◀</a>]
			[<a href="home.do?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="home.do?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="home.do?pg=${toPage+1}">▶</a>]
				[<a href="home.do?pg=${allPage}">▶▶</a>]
		
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