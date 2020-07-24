<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/accidentSubMenu.jsp"%>
<main>

	<div class="table100 ver2 m-b-110">
		<table data-vertable="ver2" class="accTable">
			<thead>
				<tr class="row100 head">
					<th class="column100 column1" data-column="column1">범칙금코드</th>
					<th class="column100 column2" data-column="column2" style="width:10%">버스번호</th>
					<th class="column100 column3" data-column="column3">사원번호</th>
					<th class="column100 column4" data-column="column4">면허번호</th>
					<th class="column100 column5" data-column="column5">직원이름</th>
					<th class="column100 column6" data-column="column6">금액</th>
					<th class="column100 column7" data-column="column7">납부상태</th>
					<th class="column100 column8" data-column="column8">위반일시</th>
					<th class="column100 column9" data-column="column9">확인</th>
					<th colspan="2" class="column100 column10" data-column="column10">
						<a class="okBtn" onclick="location.href='p-insertform.do'">추가</a>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${penaltylist}" var="list">
					<tr>
						<td class="code">${list.p_code}</td>
						<td class="carNum">${list.p_b_no}</td>
						<td class="carNum">${list.p_e_no}</td>
						<td class="carNum">${list.p_e_license}</td>
						<td class="carNum">${list.p_e_name}</td>
						<td class="carNum">${list.p_cost}</td>
						<td class="carNum"><span>${list.p_payment}</span></td>
						<td class="date"><fmt:parseDate value='${list.p_date}'
								var='trading_day' pattern='yyyy-mm-dd' /> <fmt:formatDate
								value="${trading_day}" pattern="yyyy/mm/dd" /></td>


						<%-- 			
						
						<td class="result">
							<a href="p-ac.do?p_code=${list.p_code}" class="stateBtn">납부완료</a>
						</td>
						 --%>

						<%-- <td>
                     <input type='button' onclick="location.href='p-ac.do?p_code=${list.p_code}'" value='납부완료'/>
                  </td> --%>
						<c:if test="${list.p_payment == '납부완료'}">
							<td class="result"></td>
						</c:if>
						<c:if test="${list.p_payment == '납부전'}">
							<td class="result"><a href="p-ac.do?p_code=${list.p_code}"
								class="stateBtn">납부완료</a></td>
						</c:if>






						<td class="btn-width"><span class="btn-wrap"> <input
								type="button" value="수정" class="button type green"
								onclick="location.href='p-updateform.do?p_code=${list.p_code}'">
								<input type="button" value="삭제" class="button type red"
								onclick="location.href='p-delete.do?p_code=${list.p_code}'">
								<input type="button" value="더보기" class="button type all btn">
						</span>
							<aside>
								<ul>
									<li>위반장소 : ${list.p_located}</li>
									<li>담당경찰서 : ${list.p_police}</li>
									<li>내용 : ${list.p_history}</li>
									<li>비고 : ${list.p_bigo}</li>
								</ul>
							</aside></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<table width="600" class="pgTable">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="p-list.do?pg=1">◀◀</a>]
			[<a href="p-list.do?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="p-list.do?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="p-list.do?pg=${toPage+1}">▶</a>]
				[<a href="p-list.do?pg=${allPage}">▶▶</a>]
		
		</c:if> <c:if test="${toPage>=allPage}">
					<!-- 21>=21 :true -->
				[<span style="color: gray">▶</span>]
				[<span style="color: gray">▶▶</span>]
		
		</c:if>

			</td>
		</tr>
	</table>
</main>
<script type="text/javascript">
	$("span:contains('납부전')").css({
		color : "#A72734"
	});
	$("span:contains('납부완료')").css({
		color : "#0062C1"
	});
</script>

</body>
</html>