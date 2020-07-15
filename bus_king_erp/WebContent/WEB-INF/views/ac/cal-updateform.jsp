<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<body>
<%@include file="/common/header.jsp" %>

	<main>
	<form action="cal-update.do" method="post" style="width:'80%'">
		<div class="table100 ver2 m-b-110">
			<table data-vertable="ver2">
				<thead>
					<tr class="row100 head">
						<th class="column100 column1" data-column="column1">정산코드</th>
						<th class="column100 column2" data-column="column2">정산날짜</th>
						<th class="column100 column4" data-column="column4">카드매출합계</th>
						<th class="column100 column5" data-column="column5">현금매출합계</th>
						<th class="column100 column6" data-column="column6">일별매출합계</th>
						<th class="column100 column7" data-column="column7">설명</th>
						<th class="column100 column8" data-column="column8">비고</th>
						<th colspan="2" class="column100 column9" data-column="column9"><input type="button" 
						value="BACK" onclick="location.href='cal-list.do'"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text"  value="${dto.cal_code}" readonly="readonly" name="cal_code" id="cal_code"></td>
						<td>
							<fmt:parseDate value='${dto.cal_date}'
								var='trading_day' pattern='yyyy-mm-dd' />
							<fmt:formatDate value="${trading_day}"
								pattern="yyyy.mm.dd" />
						</td>
						<td><input type="text" name="cal_hap_c" id="cal_hap_c" value="${dto.cal_hap_c}"></td>
						<td><input type="text" name="cal_hap_m" id="cal_hap_m" value="${dto.cal_hap_m}"></td>
						<td><input type="text" name="cal_total" id="cal_total" value="${dto.cal_total}"></td>
						<td><input type="text" name="cal_nametag" id="cal_nametag" value="${dto.cal_nametag}"></td>
						<td><input type="text" name="cal_bigo" id="cal_bigo" value="${dto.cal_bigo}"></td>
						<td><input type="submit" value="EDIT">
							<input type="reset" value="CANCLE" onclick="location.href='cal-list.do'">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	
	
	</form>
	
	</main>


</body>
</html>