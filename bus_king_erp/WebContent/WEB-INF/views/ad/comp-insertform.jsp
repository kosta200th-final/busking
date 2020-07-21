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
<form action="comp-insert.do" method="post">
		<select name="c_b_no">
			<option>버스 번호</option>
			<c:forEach items="${blist}" var="blist">
				<option>${blist.b_no}</option>
			</c:forEach>
		</select>
		<select name="c_e_no">
			<option>직원 사원번호</option>
			<c:forEach items="${elist}" var="elist">
				<option>${elist.e_no}</option>
			</c:forEach>
		</select>
		<select name="c_e_name">
			<option>직원 이름</option>
			<c:forEach items="${elist}" var="elist">
				<option>${elist.e_name}</option>
			</c:forEach>
		</select>
		<br>	
		<!-- <input type="text" name="c_b_no" id="c_b_no" placeholder="버스 번호"> <br>
		<input type="text" name="c_e_name" id="c_e_name" placeholder="기사 이름"> <br>
		<input type="text" name="c_e_no" id="c_e_no" placeholder="기사 사원번호"> <br> -->
		<select name="c_type">
			<option value="분류" selected="selected">분류</option>
			<option value="칭찬">칭찬</option>
			<option value="불만">불만</option>
			<option value="제안">제안</option>
			<option value="건의">건의</option>
			<option value="기타">기타</option>
		</select>		
		<input type="text" name="c_title" id="c_title" placeholder="제목"> <br>
		<textarea rows="10" cols="30"  name="c_content" id="c_content">내용</textarea> <br>
		<input type="date" name="c_date" id="c_date" placeholder="날짜"> <br>
		<input type="submit" value="추가">
		<input type="button" value="취소" onclick="location.href='comp-list.do'">
		
	</form>
</main>	

</body>
</html>