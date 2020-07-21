<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/hrSubMenu.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	function formSubmit() {
		document.getElementById("frm").submit();
	}
</script>

<script lang="javascript">
	function showPopup() {
		window.open("comm-insertform.do", "a",
				"width=400, height=300, left=100, top=50");
	}
</script>

<main>
	<h1>부서별 근태 현황</h1>
	<form action="comm-list.do" method="get" id="frm">
		<div class="table100 ver2 m-b-110">
			<select name="comm_year_d" id="comm_year_d">
				<option>==연도==</option>
				<option value="2020">2020년도</option>
			</select>&nbsp;&nbsp; <select name="comm_month_d">
				<option>==월==</option>
				<option value="06">6월</option>
				<option value="07">7월</option>
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
			</select>
			<!-- <a class="okBtn" onclick="formSubmit(); return false;">검색</a> -->
			<input type="submit" value="검색"><br>
			</div>
			</form>
			
			<form action="comm-list.do" method="get" id="frm">
			<div class="table100 ver2 m-b-110">
			<table data-vertable="ver2">
				<thead>
					<tr class="row100 head">
						<th class="column100 column1" data-column="column1">부서</th>
						<th class="column100 column2" data-column="column2">출근</th>
						<th class="column100 column3" data-column="column3">결근</th>
						<th class="column100 column4" data-column="column4">병가</th>
						<th class="column100 column5" data-column="column5">휴가</th>
						<th class="column100 column6" data-column="column6">총원</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${comm_list_d}" var="d_list">
						<tr>
							<td style="text-align: center;">${d_list.c2_e_dname}</td>
							<td style="text-align: center;">${d_list.c2_chul}</td>
							<td style="text-align: center;">${d_list.c2_gyul}</td>
							<td style="text-align: center;">${d_list.c2_byung}</td>
							<td style="text-align: center;">${d_list.c2_hyu}</td>
							<td style="text-align: center;">${d_list.c2_chong}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
	<br>
	<br>

	<!-- 		<input type="button" value="추가하기" onclick="location.href='comm-insertform.do'"> &nbsp;&nbsp; 
		<input type="button" value="팝업창 호출" onclick="showPopup();" />
 -->

	<h1>사원별 근태 현황</h1>
	<form action="comm-list.do" id="frm">
		<select name="comm_year_m">
			<option>==연도==</option>
			<option value="2020">2020년도</option>
		</select>&nbsp;&nbsp; <select name="comm_month_m">
			<option>==월==</option>
			<option value="06">6월</option>
			<option value="07">7월</option>
		</select>&nbsp;&nbsp; <select name="comm_e_no_m">
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
		</select><input type="submit" value="검색">

		<div class="table100 ver2 m-b-110">
			<table data-vertable="ver2">
				<thead>
					<tr class="row100 head">
						<th class="column100 column1" data-column="column1">사번</th>
						<th class="column100 column2" data-column="column2">년도</th>
						<th class="column100 column3" data-column="column3">이름</th>
						<th class="column100 column4" data-column="column4">월</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${comm_list_m}" var="m_list">
						<tr>
							<td style="text-align: center;">${m_list.comm_e_no}</td>
							<td style="text-align: center;">${m_list.comm_e_name}</td>
							<td style="text-align: center;">${m_list.comm_year}</td>
							<td style="text-align: center;">${m_list.comm_month}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table data-vertable="ver2">
				<thead>
					<tr class="row100 head">
						<th class="column100 column1" data-column="column1">출근 일 수</th>
						<th class="column100 column2" data-column="column2">결근 일 수</th>
						<th class="column100 column3" data-column="column3">병가 일 수</th>
						<th class="column100 column4" data-column="column4">휴가 일 수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${comm_list_m}" var="m_list">
						<tr>
							<td style="text-align: center;">${m_list.c3_chul}</td>
							<td style="text-align: center;">${m_list.c3_gyul}</td>
							<td style="text-align: center;">${m_list.c3_byung}</td>
							<td style="text-align: center;">${m_list.c3_hyu}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
</main>
</body>
</html>