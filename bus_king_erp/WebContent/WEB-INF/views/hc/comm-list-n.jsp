<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@include file="/common/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main>

	<form action="comm-list-day.do" method="get">
		<select name="comm_year" id="comm_year">
			<option>==연도==</option>
			<option value="2018">2018년도</option>
			<option value="2019">2019년도</option>
			<option value="2020">2020년도</option>
		</select>&nbsp;&nbsp; <select name="comm_month">
			<option>==월==</option>
			<option value="1">1월</option>
			<option value="2">2월</option>
			<option value="3">3월</option>
			<option value="4">4월</option>
			<option value="5">5월</option>
			<option value="6">6월</option>
			<option value="7">7월</option>
			<option value="8">8월</option>
			<option value="9">9월</option>
			<option value="10">10월</option>
			<option value="11">11월</option>
			<option value="12">12월</option>
		</select>&nbsp;&nbsp; <select name="comm_day">
			<option>==일자==</option>
			<option value="1">1일</option>
			<option value="2">2일</option>
			<option value="3">3일</option>
			<option value="4">4일</option>
			<option value="5">5일</option>
			<option value="6">6일</option>
			<option value="7">7일</option>
			<option value="8">8일</option>
			<option value="9">9일</option>
			<option value="10">10일</option>
			<option value="11">11일</option>
			<option value="12">12일</option>
			<option value="13">13일</option>
			<option value="14">14일</option>
			<option value="15">15일</option>
			<option value="16">16일</option>
			<option value="17">17일</option>
			<option value="18">18일</option>
			<option value="19">19일</option>
			<option value="20">20일</option>
			<option value="21">21일</option>
			<option value="22">22일</option>
			<option value="23">23일</option>
			<option value="24">24일</option>
			<option value="25">25일</option>
			<option value="26">26일</option>
			<option value="27">27일</option>
			<option value="28">28일</option>
			<option value="29">29일</option>
			<option value="30">30일</option>
			<option value="31">31일</option>
		</select>&nbsp;&nbsp; <input type="submit" value="검색">

		<table border="1">
			<tr>
				<th>/</th>
				<th>출근</th>
				<th>결근</th>
				<th>병가</th>
				<th>휴가</th>
				<th>총원</th>

				<td><input type="button" value="추가하기"
					onclick="location.href='comm-insertform.do'"></td>
			</tr>
			<tr>
				<td>총무팀</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>인사팀</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>배차팀</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td>정비팀</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</form>
	<br>
	<br>

	<form action="comm-list-month.do" method="get">
		<select name="comm_year" id="comm_year">
			<option>==연도==</option>
			<option value="2018">2018년도</option>
			<option value="2019">2019년도</option>
			<option value="2020">2020년도</option>
		</select>&nbsp;&nbsp; <select name="comm_month">
			<option>==월==</option>
			<option value="1">1월</option>
			<option value="2">2월</option>
			<option value="3">3월</option>
			<option value="4">4월</option>
			<option value="5">5월</option>
			<option value="6">6월</option>
			<option value="7">7월</option>
			<option value="8">8월</option>
			<option value="9">9월</option>
			<option value="10">10월</option>
			<option value="11">11월</option>
			<option value="12">12월</option>
		</select>&nbsp;&nbsp; <select name="comm_day">
			<option>==사번==</option>
			<option value="0001">1번사원</option>
			<option value="0002">2번사원</option>
			<option value="0003">3번사원</option>
		</select>&nbsp;&nbsp; <input type="submit" value="검색">

		<table border="1">
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>년도</th>
				<th>월</th>
			</tr>

			<tr>
				<td>값</td>
				<td>값</td>
				<td>값</td>
				<td>값</td>
			</tr>

			<tr>
				<th>출근 일 수</th>
				<th>결근 일 수</th>
				<th>병가 일 수</th>
				<th>휴가 일 수</th>
			</tr>

			<tr>
				<td>값</td>
				<td>값</td>
				<td>값</td>
				<td>값</td>
			</tr>
		</table>
	</form>
</main>
</body>
</html>