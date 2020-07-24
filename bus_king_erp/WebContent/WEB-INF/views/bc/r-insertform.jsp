<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>

<style>
.miniform{
	width: 50%;
	display: inline;
	float: left;
}
</style>

<body>

<%@include file="/common/header.jsp" %>
<%@include file="/common/baechaSubMenu.jsp" %>

<main>
<form action="r-insert.do" method="post" class="form">
	<fieldset>
		<legend style="text-align: center"><!-- <img alt="icon" src="../resources/img/regi.png" class="formImg"> --> 노선 등록</legend>
		<div class="form-con">
			<ul>
				<li>
					<span>노선번호</span> <input type="text" name="r_no" style="display: inline; width: 80px"> 
				</li>
				<li>
				<div class="miniform"> <span>출발지</span><br><input type="text" name="r_start" style="display: inline; width: 130px"> </div>
				<div class="miniform"> <span>도착지</span><br><input type="text" name="r_end" style="display: inline; width: 130px"> </div> 
				</li>
				<li>
					<div class="miniform"> <span>첫차시간</span><input type="text" name="r_s_time" style="display: inline; width: 130px"> </div>
					<div class="miniform"> <span>막차시간</span><input type="text" name="r_e_time" style="display: inline; width: 130px"> </div>
				</li>
				<li>
					<span>배차간격(분)</span><input type="text" name="r_interval"> 
				</li>
				<li>
					<span>노선도(이미지)</span><input type="text" name="r_map"> 
				</li>
				<li>
					<div class="miniform"> <span>성인요금(카드)</span><input type="text" name="r_pay_adult" style="display: inline; width: 130px"> </div>
					<div class="miniform"> <span>성인요금(현금)</span><input type="text" name="r_pay_adult2" style="display: inline; width: 130px"> </div>
				</li>
				<li>
					<div class="miniform"> <span>청소년요금(카드)</span><input type="text" name="r_pay_teen" style="display: inline; width: 130px"> </div>
					<div class="miniform"> <span>청소년요금(현금)</span><input type="text" name="r_pay_teen2" style="display: inline; width: 130px"> </div>
				</li>
				<li>
					<div class="miniform"> <span>어린이요금(카드)</span><input type="text" name="r_pay_kid" style="display: inline; width: 130px"> </div>
					<div class="miniform"> <span>어린이요금(현금)</span><input type="text" name="r_pay_kid2" style="display: inline; width: 130px"> </div>
				</li>
				<div class="btn-wrap">
					<input type="submit" value="추가" class="editBtn formBtn">
					<input type="reset" value="취소" class="editBtn formBtn red" onclick="location.href='r-list.do'">
				</div>
			</ul>
		</div>
	</fieldset>
</form>
</main>	

</body>
</html>