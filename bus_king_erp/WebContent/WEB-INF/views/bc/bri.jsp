<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/baechaSubMenu.jsp" %>

<html>
<head>
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <style type="text/css">
  </style>
</head>
<body>
 <main>
 
<table border="2" width="700" height="150">
		<tr>
			<td id="st1">1</td>	<td id="st2">2</td>	<td id="st3">3</td>	<td id="st4">4</td>	<td id="st5">5</td>
		</tr>
		<tr>
			<td id="st10">10</td>	<td id="st9">9</td>	<td id="st8">8</td>	<td id="st7">7</td>	<td id="st6">6</td>
		</tr>
		<tr>
			<td id="st11">11</td>	<td id="st12">12</td>	<td id="st13">13</td>	<td id="st14">14</td>	<td id="st15">15</td>
		</tr>
</table>
 

<script type="text/javascript">

		let bri = ${bri};

		for(var i = 0; i < bri.length; i++){
			var st = '#st' + bri[i][2];
			var tag = bri[i][0];
			tag += '<br>빈자리 : ' + bri[i][1];
			$(st).html(tag);
		}
	
	
</script>

</main>
</body>
</html>