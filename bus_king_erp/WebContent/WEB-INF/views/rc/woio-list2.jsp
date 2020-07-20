<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<title>Insert title here</title>
<html>
<meta charset="UTF-8">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<c:forEach items="${wo2}" var="wo2">
		
		</c:forEach>
		
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	
		 google.charts.load('current', {'packages':['corechart']}); 
		 google.charts.setOnLoadCallback(drawVisualization);
		var text=[${wo2.wo2_no}]
		
		function drawVisualization() { 
			var data = google.visualization.arrayToDataTable([
				text
				/* 	['Month', '수입', '지출', '광고이익', ],
					['05월',  123,      938,         522,      ],
					['06월',  135,      1120,        599,      ],
					['07월',  157,      1167,        587,      ],
					['08월',  139,      1110,        615,      ],
					['09월',  136,      691,         629,      ]
				]); */
			var options = {
					title : '총 매출',
					vAxis: {title: '매출'},
					hAxis: {title: 'Month'}, 
					seriesType: 'bars',
					series: {5: {type: 'line'}}
				};
			
			var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}

	</script>
</head>
<body>
	<div id="chart_div" style="width:500px; height: 300px;"></div>

</body>
</html>