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

	<main>
	<form action="e-update.do" method="post">
		<table border="1">
		
		<tr>	
			<td>사원번호 : <input type="text" value="${dto.e_no}" name="e_no" id="e_no" placeholder="e_no" readonly="readonly"></td><tr>
			<td>이름 : <input type="text" value="${dto.e_name}" name="e_name" id="e_name" placeholder="e_name"></td><tr>
			<td>주민등록번호 : <input type="text" value="${dto.e_jumin}" name="e_jumin" id="e_jumin" placeholder="e_jumin"></td>
			<td>부서 : <select name="e_dname">
								<option>선택하세요</option>
								<option>인사부</option>
								<option>총무부</option>
								<option>운송팀</option>
								<option>정비과</option>
							</select><br>
			<td>직급 : <select name="e_position">
								<option>선택하세요</option>
								<option>사원</option>
								<option>대리</option>
								<option>과장</option>
								<option>차장</option>
								<option>부장</option>
							</select><br>	
		
		</tr>
		<tr>
			<td>운전면허 : <select name="e_license">
								<option>선택하세요</option>
								<option>있음</option>
								<option>없음</option>
							</select><br>
			<td>근로계약서 : <select name="e_contract">
								<option>선택하세요</option>
								<option>작성</option>
								<option>미작성</option>
							</select><br>
			<td>결혼여부 : <select name="e_marriage">
								<option>선택하세요</option>
								<option>미혼</option>
								<option>기혼</option>
							</select><br>
			<td>장애여부 : <select name="e_disabled">
								<option>선택하세요</option>
								<option>비장애</option>
								<option>장애</option>
							</select><br>
		</tr>
		<tr>
		<td>취미 : <input type="text" value="${dto.e_hobby}" name="e_hobby" placeholder="e_hobby"></td>
			<td>특기 : <input type="text" value="${dto.e_speciality}" name="e_speciality" placeholder="e_speciality"></td>
			<td>연락처 : <input type="text" value="${dto.e_phone}" name="e_phone" placeholder="e_phone"></td>
			<td>비밀번호 : <input type="text" value="${dto.e_pwd}" name="e_pwd" placeholder="e_pwd"></td>
			<td>이메일 : <input type="text" value="${dto.e_mail}" name="e_mail" placeholder="e_mail"></td>
		</tr>
		<tr>
		<td>주소 : <input type="text" value="${dto.e_add}" name="e_add" placeholder="e_add"></td>
			<td>운전경력 : <input type="text" value="${dto.e_career}" name="e_career" placeholder="e_career"></td>
			<td>남은 휴가일 : <input type="text" value="${dto.e_break}" name="e_break" placeholder="e_break"></td>
			<td>입사일 : <input type="date" value="${dto.e_start}" name="e_start" placeholder="e_start"></td>
			<td>퇴사일 : <input type="date" value="${dto.e_end}" name="e_end" placeholder="e_end"></td>
		</tr>
		
		<td><input type="submit" value="수정" onclick="location.href='e-updateform.do?e_no=${dto.e_no}'">
		<input type="reset" value="취소" onclick="location.href='e-list.do'">
		<input type="button" value="삭제" onclick="location.href='e-delete.do?e_no=${dto.e_no}'"></td>
	</table>
</form>
</main>

</body>
</html>