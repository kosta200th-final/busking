<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/common/header.jsp" %>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>

	google.load('visualization', '1', {

	'packages' : [ 'corechart' ]

		});

		google.setOnLoadCallback(drawChart2);
 	// 차트 그리기 함수
	function drawChart2() {
		//json 데이터 받아로기
		// dataType : "json" 결과값이 json 형식
		// async :false  비동기식 옵션을 끔(동기식)
		// ajax 는 비동기식이다. 즉 기본값이 비동기식 true 이다
		// 즉 차트가 그려지기 전에는 다른 작업은 하지 못한다.
		//responseText  : 서버의 응답 텍스트
			var jsonData = $.ajax({
			
			url : "/ad/acc-list-chart.do",
			
			dataType : "json",
			
			async : false
			
			}).responseText;
			
		alert(jsonData);
		//json 데이터를 데이터 테이블로 변환
		var data = new google.visualization.DataTable(jsonData);
		
		// 차트 그리기 (PieChart, LineChart, ColumnChart)
		var chart = new google.visualization.PieChart(document
		
			.getElementById('chart_div'));
			
			//draw(데이터, 옵션)
			chart.draw(data, {
				width : 400,
				height : 240
		});

 }


</script>

	<main>
	 <div id="chart_div">
 
 	</div>
		<table border='1'>
			<tr>
				<th>사고접수번호</th>
				<th>사고버스번호</th>
				<th>직원 사원번호</th>
				<th>면허번호</th>
				<th>차량상태</th>
				<td><input type="button" value="ADD" onclick="location.href='acc-insertform.do'"></td>
			</tr>
			<c:forEach items="${accidentlist}" var="list">
				<tr>
					<td>${list.acc_no}</td>
					<td>${list.acc_b_no}</td>
					<td>${list.acc_e_no}</td>
					<td>${list.acc_e_licence}</td>
					<td>${list.acc_state}</td>
					
					<c:if test="${list.acc_state == '수리요함'}">
						<td><input type='button' onclick="location.href='acc-repair.do?acc_no=${list.acc_no}'" value='정비접수'/></td>
					</c:if>
					<c:if test="${list.acc_state == '정비접수'}">
						<td><input type='button' onclick="location.href='acc-repair.do?acc_no=${list.acc_no}'" value='운행가능'/></td>
					</c:if>
					<c:if test="${list.acc_state == '운행가능'}">
						<td><input type='button' onclick="location.href='acc-repair.do?acc_no=${list.acc_no}'" value='운행가능'/></td>
					</c:if>
					
					<td>
						<input type="button" value="EDIT" onclick="location.href='acc-updateform.do?acc_no=${list.acc_no}'">
						<input type="button" value="DELETE" onclick="location.href='acc-delete.do?acc_no=${list.acc_no}'">
						<input type="button" value="DETAILED" class="btn">
					</td>
				</tr>
				<tr>
					<td colspan="6"><aside>
						<ul>
							<li>사고난 시각 : ${list.acc_date}</li>
							<li>사고난 장소 : ${list.acc_located}</li>
							<li>사고난 내용 : ${list.acc_breakdown}</li>
						</ul>
					</aside>
					</td>
				</tr>
			</c:forEach>
		</table>
		<table width="600">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="acc-list.do?pg=1">◀◀</a>]
			[<a href="acc-list.do?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="acc-list.do?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="acc-list.do?pg=${toPage+1}">▶</a>]
				[<a href="acc-list.do?pg=${allPage}">▶▶</a>]
		
		</c:if> <c:if test="${toPage>=allPage}">
					<!-- 21>=21 :true -->
				[<span style="color: gray">▶</span>]
				[<span style="color: gray">▶▶</span>]
		
		</c:if>

			</td>
		</tr>
	</table>
	</main>
</body>
</html>