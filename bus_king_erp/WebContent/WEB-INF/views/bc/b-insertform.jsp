<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>

<style>
.rSelect {
	width: 80px !important
}
</style>

<body>

<%@include file="/common/header.jsp" %>
<%@include file="/common/baechaSubMenu.jsp" %>

<main>
<form action="b-insert.do" method="post" class="form">
	<fieldset>
	<legend style="text-align: center"><!-- <img alt="icon" src="../resources/img/regi.png" class="formImg"> --> 차량 등록</legend>
	<div class="form-con" align="center">
		<ul>
			<li>
				<input type="text" name="b_no" placeholder="번호판" style="display: inline; width: 130px">
				<input type="text" name="b_year" placeholder="연식" style="display: inline; width: 100px">
			</li>
			<li>
				<span>연료</span>
				<select name="b_energy" class="rSelect"><option>휘발유</option>
					<option>경유</option>
					<option>LPG</option>
					<option>천연가스</option>
					<option>전기</option>
				</select>
				<span>구분</span>
				<select name="b_type" class="rSelect"><option>마을</option><option>시내</option></select>
			</li>
			<li>
				<input type="text" name="b_acc" placeholder="사고횟수" style="display: inline; width: 115px">
				<input type="text" name="b_mile" placeholder="주행거리" style="display: inline; width: 115px">	
			</li>	
		</ul>
		<input hidden="hidden" type="date" name="b_start" id="currentDate1" readonly="readonly">
		<input hidden="hidden" type="date" name="b_recent" id="currentDate2" readonly="readonly">
		<div class="btn-wrap">
			<input type="submit" value="추가" class="editBtn formBtn">
			<input type="reset" value="취소" class="editBtn formBtn red" onclick="location.href='b-list.do'">
		</div>
	</div>
	</fieldset>
</form>
</main>	
<script>
  document.getElementById('currentDate1').value = new Date().toISOString().substring(0, 10);;
  document.getElementById('currentDate2').value = new Date().toISOString().substring(0, 10);;
</script>
</body>
</html>