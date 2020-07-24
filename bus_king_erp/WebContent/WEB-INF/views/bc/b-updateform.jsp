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
<form action="b-update.do" method="post" class="form">
	<fieldset>
	<legend style="text-align: center"><!-- <img alt="icon" src="../resources/img/regi.png" class="formImg"> --> 차량 정보 수정</legend>
		<div class="form-con">
			<ul>
				<li>
					<span>번호판</span><input type="text" value="${ dto.b_no }" name="b_no" readonly="readonly"> 
				</li>
				<li>
					<div class="miniform"> <span>연식</span><input type="text" value="${ dto.b_year }" name="b_year" readonly="readonly" style="display: inline; width: 130px"> </div>
					<div class="miniform"> <span>연료</span><input type="text" value="${ dto.b_energy }" name="b_energy" readonly="readonly" style="display: inline; width: 130px"> </div>
				</li>
				<li>
					<span>등록날짜</span><input type="date" value="${ dto.b_start }" name="b_start" readonly="readonly"> 
				</li>
				<li>
					<span>* 구분</span><select name="b_type"><option>마을</option><option>시내</option></select>
				</li>
				<li>
					<div class="miniform"><span>* 사고횟수</span><input type="text" value="${ dto.b_acc }" name="b_acc" style="display: inline; width: 130px"></div>
					<div class="miniform"><span>* 주행거리</span><input type="text" value="${ dto.b_mile }" name="b_mile" style="display: inline; width: 130px"></div>
				</li>
				<li>
					<span>최근정비일</span><input type="date" value="${ dto.b_recent }" name="b_recent" readonly="readonly">
				</li>
				<div class="btn-wrap">
					<input type="submit" value="수정" class="editBtn formBtn">
					<input type="reset" value="취소" class="editBtn formBtn red" onclick="location.href='b-list.do'">
				</div>
			</ul>
		</div>
	</fieldset>
</form>
</main>

</body>
</html>