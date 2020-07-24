<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp" %>
<%@include file="/common/accidentSubMenu.jsp" %>
<main>
<div id="chart_div" style="height: 500px;"></div>
<!-- google charts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

		// 구글 차트
		google.charts.load('current', {'packages': ['corechart']}); //차트 스타일
		google.charts.setOnLoadCallback(drawChart);

		//차트 그리기 함수
		function drawChart() {
			
			// json 데이터를 데이터 테이블로 변환
			var data = google.visualization.arrayToDataTable(${str})  
		        
			// 옵션
			var options = {
				title: '면허번호별 교통사고 횟수',
			}
			
			// 차트 그리기
	      	var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

			chart.draw(data, options);
       	}
</script>

<button type="button" onclick="location.href='acc-list.do'" >뒤로</button>

</main>
</html>