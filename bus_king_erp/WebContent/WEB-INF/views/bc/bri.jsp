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

<style>
.routeimg{
	background-image: url('../resources/img/nosun.png');
	background-size: 1000px 400px;
	padding: 10px;
	margin-left: 10%;
	margin-right: 10%;
	margin-top: 5%;
	position: inherit;
	width: 1000px;
	height: 400px;
}
.nosun{
	background: transparent;
	border: 1;
	width: 600px;
    height: 365px;
    margin-top: -31px;
    margin-left: 182px;
}

td{
	width: 120px;
}
</style>

<body>
 <main>
<div class="routeimg">
	<table class="nosun">
				<tr align="center">
					<td id="st1"></td>
					<td id="st2"></td>
					<td id="st3"></td>
					<td id="st4"></td>
					<td id="st5"></td>
				</tr>
				<tr align="center">
					<td id="st10"></td>
					<td id="st9"></td>
					<td id="st8"></td>
					<td id="st7"></td>
					<td id="st6"></td>
				</tr>
				<tr align="center">
					<td id="st11"></td>
					<td id="st12"></td>
					<td id="st13"></td>
					<td id="st14"></td>
					<td id="st15"></td>
				</tr>
			</table>
 </div>

<script type="text/javascript">

		let bri = ${bri};

		for(var i = 0; i < bri.length; i++){
			var st = '#st' + bri[i][2];
			var tag = '<span style="background-color:#FFF">' + bri[i][0] + '<br>빈자리 : ' + bri[i][1] + "</span>";
			$(st).html(tag);
		}
	
	
</script>

</main>
</body>
</html>