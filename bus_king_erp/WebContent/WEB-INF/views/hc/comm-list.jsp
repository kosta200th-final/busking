<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@include file="/common/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main>

    <script lang="javascript">
    function showPopup() {window.open("comm-insertform.do", "a", "width=400, height=300, left=100, top=50");}
    </script>
	
	<form action="comm-list.do" method="get">
		<select name="comm_year_d" id="comm_year_d">
			<option>==연도==</option>
<!-- 			<option value="2018">2018년도</option>
			<option value="2019">2019년도</option> -->
			<option value="2020">2020년도</option>
		</select>&nbsp;&nbsp; <select name="comm_month_d">
		<option>==월==</option>
<!-- 			<option value="01">1월</option>
			<option value="02">2월</option>
			<option value="03">3월</option>
			<option value="04">4월</option>
			<option value="05">5월</option>
			<option value="06">6월</option> -->
			<option value="07">7월</option>
			<option value="08">8월</option>
<!-- 			<option value="09">9월</option>
			<option value="10">10월</option>
			<option value="11">11월</option>
			<option value="12">12월</option> -->
		</select>&nbsp;&nbsp; <select name="comm_day_d">
			<option>==일자==</option>
			<option value="01">1일</option>
			<option value="02">2일</option>
			<option value="03">3일</option>
			<option value="04">4일</option>
			<option value="05">5일</option>
			<option value="06">6일</option>
			<option value="07">7일</option>
			<option value="08">8일</option>
			<option value="09">9일</option>
			<option value="10">10일</option>
			<option value="11">11일</option>
			<option value="12">12일</option>
			<option value="13">13일</option>
			<option value="14">14일</option>
			<option value="15">15일</option>
<!-- 			<option value="16">16일</option>
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
			<option value="31">31일</option> -->
		</select>&nbsp;&nbsp; <input type="submit" value="검색"> &nbsp;&nbsp;
			
			<input type="button" value="추가하기"
					onclick="location.href='comm-insertform.do'"> &nbsp;&nbsp;
					
			 <input type="button" value="팝업창 호출" onclick="showPopup();" />	

		<table border="1">
			<tr>
				<th>/</th>
				<th>출근</th>
				<th>결근</th>
				<th>병가</th>
				<th>휴가</th>
				<th>총원</th>
			</tr>
			
			<c:forEach items="${comm_list_d}" var="d_list">
			<tr>
				<td>${d_list.c2_e_dname}</td>
				<td>${d_list.c2_chul}</td>
				<td>${d_list.c2_gyul}</td>
				<td>${d_list.c2_byung}</td>
				<td>${d_list.c2_hyu}</td>
				<td>${d_list.c2_chong}</td>
			</tr>
			</c:forEach>
		</table>
	</form>
	<br>
	<br>

	<form action="comm-list.do">
		<select name="comm_year_m" id="comm_year_m">
			<option>==연도==</option>
<!-- 			<option value="2018">2018년도</option>
			<option value="2019">2019년도</option> -->
			<option value="2020">2020년도</option>
		</select>&nbsp;&nbsp; <select name="comm_month_m">
			<option>==월==</option>
<!-- 			<option value="01">1월</option>
			<option value="02">2월</option>
			<option value="03">3월</option>
			<option value="04">4월</option>
			<option value="05">5월</option>
			<option value="06">6월</option> -->
			<option value="07">7월</option>
			<option value="08">8월</option>
<!-- 			<option value="09">9월</option>
			<option value="10">10월</option>
			<option value="11">11월</option>
			<option value="12">12월</option> -->
		</select>&nbsp;&nbsp; <select name="comm_e_no_m">
			<option>==사번==</option>
			<option value="0001">1번사원</option>
			<option value="0002">2번사원</option>
			<option value="0003">3번사원</option>
			<option value="0004">4번사원</option>
			<option value="0005">5번사원</option>
			<option value="0006">6번사원</option>
			<option value="0007">7번사원</option>
		</select>&nbsp;&nbsp; <input type="submit" value="검색">

		<table border="1">
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>년도</th>
				<th>월</th>
			</tr>
			
			<c:forEach items="${comm_list_m}" var="m_list">
			<tr>
				<td>${m_list.comm_e_no}</td>
				<td>${m_list.comm_e_name}</td>
				<td>${m_list.comm_year}</td>
				<td>${m_list.comm_month}</td>
			</tr>
			</c:forEach>

			<tr>
				<th>출근 일 수</th>
				<th>결근 일 수</th>
				<th>병가 일 수</th>
				<th>휴가 일 수</th>
			</tr>

			<c:forEach items="${comm_list_m}" var="m_list">
			<tr>
				<td>${m_list.c3_chul}</td>
				<td>${m_list.c3_gyul}</td>
				<td>${m_list.c3_byung}</td>
				<td>${m_list.c3_hyu}</td>
			</tr>
			</c:forEach>
		</table>
	</form>
</main>
</body>
</html>