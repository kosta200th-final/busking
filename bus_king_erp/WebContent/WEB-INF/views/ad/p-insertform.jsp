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
<form action="p-insert.do" method="post">
		<select name="p_b_no">
			<option>버스 번호</option>
			<c:forEach items="${blist}" var="blist">
				<option>${blist.b_no}</option>
			</c:forEach>
		</select>
		<select name="p_e_no">
			<option>직원 사원번호</option>
			<c:forEach items="${elist}" var="elist">
				<option>${elist.e_no}</option>
			</c:forEach>
		</select>
		<select name="p_e_license">
			<option>직원 면허번호</option>
			<c:forEach items="${elist}" var="elist">
				<option>${elist.e_license}</option>
			</c:forEach>
		</select>
		<br>
		<!-- <input type="text" name="p_b_no" id="p_b_no" placeholder="버스 번호"> <br>
		<input type="text" name="p_e_no" id="p_e_no" placeholder="기사 사원번호"> <br> 
		<input type="text" name="p_e_licence" id="p_e_licence" placeholder="면허 번호"> <br>-->
		<input type="text" name="p_cost" id="p_cost" placeholder="부과 금액"> <br>
		<input type="radio" name="p_payment" value="납부전" checked="checked">납부전
		<input type="radio" name="p_payment" value="납부완료" >납부완료 <br>
		<input type="date" name="p_date" id="p_date" placeholder="위반 일시"> <br>
		<input type="text" name="p_located" id="p_located" placeholder="위반장소"> <br>
		<input type="text" name=p_police id="p_police" placeholder="담당경찰서"> <br>
		<input type="text" name="p_history" id="p_history" placeholder="내용"> <br>
		<input type="text" name="p_bigo" id="p_bigo" placeholder="비고"> <br>
		<input type="submit" value="추가">
		<input type="button" value="취소" onclick="location.href='p-list.do'">
	</form>
</main>	

</body>
</html>