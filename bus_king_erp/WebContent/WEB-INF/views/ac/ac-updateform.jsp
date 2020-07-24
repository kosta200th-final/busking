<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<body>
<%@include file="/common/header.jsp" %>
<%@include file="/common/accountSubMenu.jsp" %>

	<main>
		<form action="ac-update.do" method="post" style="width:'80%'">
		<div class="table100 ver2 m-b-110">
			<table data-vertable="ver2">
				<thead>
					<tr class="row100 head">
						<th class="column100 column1" data-column="column1">정산코드</th>
						<th class="column100 column2" data-column="column2">내역</th>
						<th class="column100 column4" data-column="column4">비용</th>
						<th class="column100 column5" data-column="column5">날짜</th>
						<th class="column100 column6" data-column="column6">매입∙매출</th>
						<th class="column100 column7" data-column="column7">비고</th>
						<th colspan="2" class="column100 column9" data-column="column9"><input type="button" 
						value="BACK" onclick="location.href='ac-list.do'"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text"  value="${dto.ac_code}" readonly="readonly" name="ac_code" id="ac_code"></td>
						<td>
							<fmt:parseDate value='${dto.ac_date}'
								var='trading_day' pattern='yyyy-mm-dd' />
							<fmt:formatDate value="${trading_day}"
								pattern="yyyy.mm.dd" />
						</td>
						<td><input type="text" name="ac_name" id="ac_name" value="${dto.ac_name}"></td>
						<td><input type="text" name="ac_cost" id="ac_cost" value="${dto.ac_cost}"></td>
						<td><input type="text" name="ac_state" id="ac_state" value="${dto.ac_state}"></td>
						<td><input type="text" name="ac_bigo" id="ac_bigo" value="${dto.ac_bigo}"></td>
						<td><input type="submit" value="EDIT">
							<input type="reset" value="CANCLE" onclick="location.href='ac-list.do'">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</form>
	</main>

</body>
</html>