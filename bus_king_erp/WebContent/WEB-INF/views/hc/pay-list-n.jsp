<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
	<%@include file="/common/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	<main>
	
<%-- 	<c:forEach items="${paylist}" var="list">
		<option value="${list.pay_year}">${list.pay_year}년도</option>
	</c:forEach> --%>
	
	<form action="pay-list.do" method="get">
	<select name="pay_year" id="pay_year">
		<option value="2018">2018년도</option>
		<option value="2019">2019년도</option>
		<option value="2020">2020년도</option>
	</select>&nbsp;&nbsp;
	
	<select name="pay_month">
		<option value="5">5월</option>
		<option value="6">6월</option>
		<option value="7">7월</option>
		<option value="8">8월</option>
	</select>&nbsp;&nbsp;
	
	<select name="pay_e_no">
		<option value="0001">1번사원</option>
		<option value="0002">2번사원</option>
		<option value="0003">3번사원</option>
	</select>&nbsp;&nbsp;
	
	<input type="submit" value="검색">
	
	
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
				
				<td><input type="button" value="추가하기"
					onclick="location.href='pay-insertform.do'"></td>
			</tr>
		</table>
	</form>
	</main>
</body>
</html>