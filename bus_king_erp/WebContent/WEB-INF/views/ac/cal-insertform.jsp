<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp" %>

<main>
<form action="cal-insert.do" method="post">
	
	<div class="table100 ver2 m-b-110">
			<table data-vertable="ver2">
				<thead>
					<tr class="row100 head">
						<th class="column100 column1" data-column="column1">정산코드</th>
						<th class="column100 column2" data-column="column2">정산날짜</th>
						<th class="column100 column3" data-column="column3">차량번호</th>
						<th class="column100 column4" data-column="column4">카드매출합계</th>
						<th class="column100 column5" data-column="column5">현금매출합계</th>
						<th class="column100 column6" data-column="column6">일별매출합계</th>
						<th class="column100 column7" data-column="column7">설명</th>
						<th class="column100 column8" data-column="column8">비고</th>
						<th colspan="2" class="column100 column9" data-column="column9"><input type="submit" value="추가"></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><input type="text" name="cal_code" id="cal_code" placeholder="정산코드"></td>
							<td><input type="date" name="cal_date" id="cal_date" placeholder="정산날짜"></td>
							<td><input type="text" name="cal_b_no" id="cal_b_no"placeholder="차량번호"></td>
							<td><input type="text" name="cal_hap_c" id="cal_hap_c"placeholder="카드매출합계"> </td>
							<td><input type="text" name="cal_hap_m" id="cal_hap_m"placeholder="현금매출합계"></td>
							<td><input type="text" name="cal_total" id="cal_total"placeholder="일별매출합계"></td>
							<td><input type="text" name="cal_nametag" id="cal_nametag"placeholder="설명"> </td>
							<td><input type="text" name="cal_bigo" id="cal_bigo"placeholder="비고"></td>
						</tr>
				</tbody>
			</table>
		</div>
	
</form>
</main>	

</body>
</html>