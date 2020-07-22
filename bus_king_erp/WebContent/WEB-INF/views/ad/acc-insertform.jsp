<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>

<%@include file="/common/header.jsp" %>
<%@include file="/common/accidentSubMenu.jsp" %>

<main>
<form action="acc-insert.do" method="post">
		<input type="text" name="acc_no" id="acc_no" placeholder="사고접수번호"> <br>
		<select name="acc_b_no">
			<option>버스 번호</option>
			<c:forEach items="${blist}" var="blist">
				<option>${blist.b_no}</option>
			</c:forEach>
		</select>
		<select name="acc_e_no">
			<option>직원 사원번호</option>
			<c:forEach items="${elist}" var="elist">
				<option>${elist.e_no}</option>
			</c:forEach>
		</select>
		<select name="acc_e_licence">
			<option>직원 면허번호</option>
			<c:forEach items="${elist}" var="elist">
				<option>${elist.e_license}</option>
			</c:forEach>
		</select>
		<br>
		<input type="radio" name="acc_state" value="수리요함">수리요함
		<input type="radio" name="acc_state" value="수리접수">수리접수 
		<input type="radio" name="acc_state" value="운행가능">운행가능 <br>
		<input type="date" name="acc_date" id="acc_date" placeholder="사고난 시각"> <br>
		<input type="text" name="acc_located" id="acc_located" placeholder="사고난 장소"> <br>
		<textarea rows="10" cols="30"  name="acc_breakdown" id="acc_breakdown">사고난 내용</textarea> <br>
		<input type="submit" value="추가">
		<input type="button" value="취소" onclick="location.href='acc-list.do'">
	</form>
</main>	

</body>
</html>