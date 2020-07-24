<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/hrSubMenu.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="UTF-8">
<style type="text/css">
#tb1 {
   text-align: center;
   width: 1400;
   height:100;
   border: 1;
   line-height: 1.5;
   margin: auto;
}
border
="1"
 
style
="width
:
 
500;"
</style>

<main>

	<h1>월별 사원별 급여정보</h1>
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

<div class="table100 ver2 m-b-110">
	<table data-vertable="ver2">
		<c:forEach items="${paylist}" var="list">
				<tr class="row100 head">
					<th class="column100 column1">사번</th>
					<td style="text-align: center;">${list.pay_e_no}</td>
					<th class="column100 column2">성함</th>
					<td style="text-align: center;">${list.pay_e_name}</td>
					<th class="column100 column3">해당년도</th>
					<td style="text-align: center;">${list.pay_year}</td>
				</tr>

				<tr>
					<th class="column100 column4">부서(팀)명</th>
					<td style="text-align: center;">${list.pay_e_dname}</td>
					<th class="column100 column5">직급</th>
					<td style="text-align: center;">${list.pay_e_position}</td>
					<th class="column100 column6">해당월</th>
					<td style="text-align: center;">${list.pay_month}</td>
				</tr>
		</c:forEach>
	</table></div><br><br>
	
<div class="table100 ver2 m-b-110">	
   <table id="tb1" border="1">
   	<c:forEach items="${paylist}" var="list">
      <tr>
         <th rowspan="2" class="column100 column1">근태내역</th>
         <td>출근일수</td>
         <td>근무시간</td>
         <td>특근시간</td>
      </tr>
      <tr>
         <td>${list.pay_chul} 일</td>
         <td>${list.pay_work} 시간</td>
         <td>${list.pay_work_t} 시간</td>
      </tr>
      <tr>
         <th rowspan="4" class="column100 column1">지급내역</th>
         <td>기본급</td>
         <td>특근수당</td>
         <td>식대</td>
      </tr>
      <tr>
         <td>${list.pay_p} 원</td>
         <td>${list.pay_p_t} 원</td>
         <td>${list.pay_bob} 원</td>
      </tr>
      <tr>
         <td>차량지원비</td>
         <td>만근수당</td>
         <td rowspan="2"></td>
      </tr>
      <tr>
         <td>${list.pay_car} 원</td>
         <td>${list.pay_m} 원</td>
      </tr>
      <tr>
         <th rowspan="2" class="column100 column1">공제내역</th>
         <td>세금공제</td>
         <td rowspan="2" colspan="2"></td>
      </tr>
      <tr>
         <td>${list.pay_tax} 원</td>        
      </tr>
      <tr>
         <th colspan="2" class="column100 column1">월급합계</th>
         <td colspan="2">\ ${list.pay_total} 원</td>
      </tr>
      </c:forEach>
   </table></div>
   </form>
   </main>
</body>
</html>