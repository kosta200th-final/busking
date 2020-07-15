<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>

<body>

<%@include file="/common/header.jsp" %>

<main>
<form action="b-insert.do" method="post">
			<input type="text" name="b_no" id="b_no" placeholder="b_no"><br>
			<input type="text" name="b_year" id="b_year"placeholder="b_year"><br>
			<input type="text" name="b_energy" id="b_energy"placeholder="b_energy"><br>
			<input type="date" name="b_start" id="b_start"placeholder="b_start(ex yyyy-mm-dd)"><br>
			<input type="text" name="b_type" id="b_type"placeholder="b_type"><br>
			
			<input type="text" name="b_acc" id="b_acc"placeholder="b_acc"><br>
			<input type="text" name="b_state" id="b_state"placeholder="b_state"><br>
			<input type="text" name="b_mile" id="b_mile"placeholder="b_mile"><br>
			<input type="date" name="b_recent" id="b_recent"placeholder="b_recent(ex yyyy-mm-dd)"><br>
			<input type="submit" value="추가">
</main>	

</body>
</html>