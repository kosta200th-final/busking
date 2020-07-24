<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/hrSubMenu.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main>

	<%-- 	<c:forEach items="${paylist}" var="list">
		<option value="${list.pay_year}">${list.pay_year}년도</option>
	</c:forEach> --%>

	<form action="pay-list.do" method="get">
		<select name="pay_year" id="pay_year">
			<option>==연도==</option>
			<!-- 		<option value="2018">2018년도</option>
		<option value="2019">2019년도</option> -->
			<option value="2020">2020년도</option>
		</select>&nbsp;&nbsp; <select name="pay_month">
			<option>==월==</option>
			<!-- 		<option value="1">1월</option>
		<option value="2">2월</option>
		<option value="3">3월</option>
		<option value="4">4월</option>
		<option value="5">5월</option> -->
			<option value="6">6월</option>
			<option value="7">7월</option>
			<!-- 		<option value="8">8월</option>
		<option value="9">9월</option>
		<option value="10">10월</option>
		<option value="11">11월</option>
		<option value="12">12월</option> -->
		</select>&nbsp;&nbsp; <select name="pay_e_no">
			<option>==사번==</option>
			<option value="E0001">1번사원</option>
			<option value="E0002">2번사원</option>
			<option value="E0003">3번사원</option>
			<option value="E0004">4번사원</option>
			<option value="E0005">5번사원</option>
			<option value="E0006">6번사원</option>
			<option value="E0007">7번사원</option>
			<option value="E0008">8번사원</option>
			<option value="E0009">9번사원</option>
			<option value="E0010">10번사원</option>
			<option value="E0011">11번사원</option>
			<option value="E0012">12번사원</option>
			<option value="E0013">13번사원</option>
			<option value="E0014">14번사원</option>
			<option value="E0015">15번사원</option>
			<option value="E0016">16번사원</option>
			<option value="E0017">17번사원</option>
			<option value="E0018">18번사원</option>
			<option value="E0019">19번사원</option>
		</select>&nbsp;&nbsp; <input type="submit" value="검색">
		
				<input type="button" value="추가하기"
					onclick="location.href='pay-insertform.do'">

		<table border="1">
			<tr>
				<th>페이코드</th>
				<th>직원번호</th>
				<th>이름</th>
				<th>부서명</th>
				<th>직급</th>
				<th>네임태그</th>
				<th>비고</th>

				<th>지급년도</th>
				<th>지급월</th>
				<th>지급날짜</th>
				<th></th>
				<th></th>
				<th>출근일 수</th>
				<th>근무시간</th>
				<th>특근시간</th>
				<th>기본급</th>

				<th>특근수당</th>
				<th>식대</th>
				<th>차량지원비</th>
				<th>만근수당</th>
				<th>세금공제</th>
				<th>급여총합</th>
			</tr>

			<c:forEach items="${paylist}" var="list">
				<tr>
					<td>${list.pay_code}</td>
					<td></td>
					<td>${list.pay_e_name}</td>
					<!-- fk로 참조하는 데이터 필드의 변수명은... DTO 와 동일해야함... -->
					<td>${list.pay_e_dname}</td>
					<td>${list.pay_e_position}</td>
					<td>${list.pay_nametag}</td>
					<td>${list.pay_bigo}</td>

					<td>${list.pay_year}</td>
					<td>${list.pay_month}</td>

					<%-- <td>${list.pay_day}</td> --%>

					<td><fmt:parseDate value='${list.pay_day}' var='pay_day'
							pattern='yyyy-mm-dd' /> <fmt:formatDate value="${pay_day}"
							pattern="yyyy.mm.dd" /></td>
					<td></td>
					<td></td>

					<td>${list.pay_chul}</td>
					<td>${list.pay_work}</td>
					<td>${list.pay_work_t}</td>
					<td>${list.pay_p}</td>

					<td>${list.pay_p_t}</td>
					<td>${list.pay_bob}</td>
					<td>${list.pay_car}</td>
					<td>${list.pay_m}</td>
					<td>${list.pay_tax}</td>
					<td>${list.pay_total}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</main>
</body>
</html>