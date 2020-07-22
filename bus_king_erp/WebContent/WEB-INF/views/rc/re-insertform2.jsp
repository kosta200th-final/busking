<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp" %>

<main>
<form action="cal-insert.do" method="post">
	
	<div class="table100 ver2 m-b-110">
			<table data-vertable="ver2">
				<thead>
					<tr class="row100 head">
						<th width="150">No</th>
						<th width="150">버스 차량번호</th>
						<th width="150">정비 접수일</th>
						<th width="150">정비 완료일</th>
						<th width="150">정비 내역</th>
						<th width="150">정비 비용</th>
						<th width="150">정비 상태</th>
						<th width="150">비고</th>
						</tr>
						
				</thead>
				<tbody>
						<tr>
							<td><input type="text" name="re_b_no" id="re_b_no" placeholder="버스번호" ></td>
							<td><input type="date" name="re_date" id="re_date" placeholder="re_date" ></td>
							<td><select name="re_breakdown">
							    <option value="">정비 상태</option>
							    <option value="학생">자가점검</option>
							    <option value="회사원">차량사고</option>
							    <option value="기타">차량노후</option>
							</select></td>
							<td><input type="number" name="re_cost" id="re_cost" placeholder="가격"></td>
							<td><input type = "radio" name = "re_state" value ="접수" placeholder="접수"></td>
							<td><input type="text" name="re_bigo" id=""re_bigo""placeholder="비고(특이사항)"></td>
						</tr>
				</tbody>
			</table>
		</div>
	
</form>
</main>	

</body>
</html>