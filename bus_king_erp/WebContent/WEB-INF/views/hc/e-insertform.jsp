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
<form action="e-insert.do" method="post">
			사원번호 : <input type="text" name="e_no" id="e_no" placeholder="e_no"><br> <!-- 사원번호 -->
			이름 : <input type="text" name="e_name" id="e_name" placeholder="e_name"><br> <!-- 이름 -->
			주민등록번호 : <input type="text" name="e_jumin" id="e_jumin" placeholder="e_jumin"><br> <!-- 주민등록번호 -->
			부서 : <select name="e_dname">
								<option>선택하세요</option>
								<option>인사부</option>
								<option>총무부</option>
								<option>운송팀</option>
								<option>정비과</option>
							</select><br>
			직급 : <select name="e_position">
								<option>선택하세요</option>
								<option>사원</option>
								<option>대리</option>
								<option>과장</option>
								<option>차장</option>
								<option>부장</option>
							</select><br>
			운전면허 : <select name="e_license">
								<option>선택하세요</option>
								<option>있음</option>
								<option>없음</option>
							</select><br>
			근로계약서 : <select name="e_contract">
								<option>선택하세요</option>
								<option>작성</option>
								<option>미작성</option>
							</select><br>
			결혼여부 : <select name="e_marriage">
								<option>선택하세요</option>
								<option>미혼</option>
								<option>기혼</option>
							</select><br>
			장애여부 : <select name="e_disabled">
								<option>선택하세요</option>
								<option>비장애</option>
								<option>장애</option>
							</select><br>
			비밀번호 : <input type="text" name="e_pwd" id="e_pwd" placeholder="e_pwd"><br>  <!-- 비밀번호 -->			
			취미 : <input type="text" name="e_hobby" id="e_hobby" placeholder="e_hobby"><br>  <!-- 취미 -->
			특기 : <input type="text" name="e_speciality" id="e_speciality" placeholder="e_speciality"><br>  <!-- 특기 -->
			연락처 : <input type="text" name="e_phone" id="e_phone" placeholder="e_phone"><br>  <!-- 연락처 -->
			이메일 : <input type="text" name="e_mail" id="e_mail" placeholder="e_mail"><br>  <!-- 이메일 -->
			주소 : <input type="text" name="e_add" id="e_add" placeholder="e_add"><br>  <!-- 주소 -->
			운전경력 : <input type="text" name="e_career" id="e_career" placeholder="e_career"><br>  <!-- 운전경력 -->
			남은 휴가일 : <input type="text" name="e_break" id="e_break" placeholder="e_break"><br>  <!-- 남은 휴가일 수 -->
			입사일 : <input type="date" name="e_start" id="e_start" placeholder="e_start"><br>  <!-- 입사일 -->
			퇴사일 : <input type="date" name="e_end" id="e_end" placeholder="e_end"><br>  <!-- 퇴사일 -->
			
			<input type="submit" value="등록">
			</form>
</main>	

</body>
</html>