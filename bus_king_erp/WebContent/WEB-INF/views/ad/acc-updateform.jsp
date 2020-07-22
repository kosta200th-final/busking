<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
${accidentupdate}
	<form action="acc-update.do" method="post">
		<input type="text" name="acc_no" id="acc_no" placeholder="사고접수번호" readonly="readonly" value="${accidentupdate.acc_no}"> <br>
		<input type="text" name="acc_b_no" id="acc_b_no" placeholder="사고버스 번호" readonly="readonly" value="${accidentupdate.acc_b_no}"> <br>
		<input type="text" name="acc_e_no" id="acc_e_no" placeholder="기사 사원번호" readonly="readonly" value="${accidentupdate.acc_e_no}"> <br>
		<input type="text" name="acc_e_licence" id="acc_e_licence" placeholder="면허 번호" readonly="readonly" value="${accidentupdate.acc_e_licence}"> <br>
		
		<c:if test="${accidentupdate.acc_state == '운행가능'}">
			<input type="radio" name="acc_state" value="운행가능" checked="checked">운행가능
			<input type="radio" name="acc_state" value="수리요함">수리요함 
			<input type="radio" name="acc_state" value="정비접수">정비접수 
		</c:if>
		<c:if test="${accidentupdate.acc_state == '수리요함'}">
			<input type="radio" name="acc_state" value="운행가능">운행가능
			<input type="radio" name="acc_state" value="수리요함" checked="checked">수리요함 
			<input type="radio" name="acc_state" value="정비접수">정비접수 
		</c:if>
		<c:if test="${accidentupdate.acc_state == '정비접수'}">
			<input type="radio" name="acc_state" value="운행가능">운행가능
			<input type="radio" name="acc_state" value="수리요함">수리요함 
			<input type="radio" name="acc_state" value="정비접수" checked="checked">정비접수 
		</c:if>
		<br>
		
		
		<fmt:parseDate value='${accidentupdate.acc_date}' var='trading_day' pattern='yyyy-MM-dd HH:mm'/><fmt:formatDate value="${trading_day}" pattern="yyyy.MM.dd HH:mm"/> <br>
		<input type="text" name="acc_located" id="acc_located" placeholder="사고난 장소" readonly="readonly" value="${accidentupdate.acc_located}"> <br>
		<input type="text" name="acc_breakdown" id="acc_breakdown" placeholder="사고난 내용" readonly="readonly" value="${accidentupdate.acc_breakdown}"> <br>
		<input type="submit" value="수정">
		<input type="button" value="취소" onclick="location.href='acc-list.do'">
		
	</form>
</main>

</body>
</html>