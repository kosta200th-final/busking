<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@include file="/common/header.jsp" %>
<%@include file="/common/accidentSubMenu.jsp" %>   

<main>
<form action="acc-update.do" method="post" class="form">
<fieldset>
<legend style="text-align: center"><!-- <img alt="icon" src="../resources/img/regi.png" class="formImg"> --> 교통사고 수정</legend>
	<div class="form-con">
		<ul>
			<li>
				<span>접수번호</span>
				<input type="text" name="acc_no" id="acc_no" placeholder="사고접수번호" readonly="readonly" value="${accidentupdate.acc_no}">
			</li>
			<li>
				<span>버스번호</span>
				<input type="text" name="acc_b_no" id="acc_b_no" placeholder="사고버스 번호" readonly="readonly" value="${accidentupdate.acc_b_no}"> 
			</li>
			<li>
				<span>사원번호</span>
				<input type="text" name="acc_e_no" id="acc_e_no" placeholder="기사 사원번호" readonly="readonly" value="${accidentupdate.acc_e_no}"> 
			</li>
			<li>
				<span>면허번호</span>
				<input type="text" name="acc_e_license" id="acc_e_license" placeholder="면허 번호" value="${accidentupdate.acc_e_license}"> 
			</li>
			<li>
				<label for="acc_state" class="br">차량상태 </label>
				<c:if test="${accidentupdate.acc_state == '운행가능'}">
					<input type="radio" name="acc_state" value="운행가능" class="radio" checked="checked">
					운행가능
					<input type="radio" name="acc_state" value="수리요함" class="radio">
					수리요함 
					<input type="radio" name="acc_state" value="정비접수" class="radio">
					정비접수 
				</c:if>
				<c:if test="${accidentupdate.acc_state == '수리요함'}">
					<input type="radio" name="acc_state" value="운행가능" class="radio">
					운행가능
					<input type="radio" name="acc_state" value="수리요함" class="radio" checked="checked">
					수리요함 
					<input type="radio" name="acc_state" value="정비접수" class="radio">
					정비접수 
				</c:if>
				<c:if test="${accidentupdate.acc_state == '정비접수'}">
					<input type="radio" name="acc_state" value="운행가능" class="radio">
					운행가능
					<input type="radio" name="acc_state" value="수리요함" class="radio">
					수리요함 
					<input type="radio" name="acc_state" value="정비접수" class="radio" checked="checked">
					정비접수 
				</c:if>
			</li>
			<li>
				<span>사고난 일자</span>
				<fmt:parseDate value='${accidentupdate.acc_date}' var='trading_day' pattern='yyyy-MM-dd HH:mm'/>
				<fmt:formatDate value="${trading_day}" pattern="yyyy.MM.dd HH:mm"/>			
			</li>
			<li>
				<span>사고난 장소</span>
				<input type="text" name="acc_located" id="acc_located" placeholder="사고난 장소" readonly="readonly" value="${accidentupdate.acc_located}"> 
			</li>
			<li>
				<span>사고난 내용</span>
				<textarea rows="10" cols="30"  name="acc_breakdown" id="acc_breakdown" readonly="readonly">${accidentupdate.acc_breakdown}</textarea>
			</li>
		</ul>
		<div class="btn-wrap">
			<input type="submit" value="수정" class="editBtn formBtn">
			<input type="button" value="취소" class="editBtn formBtn red" onclick="location.href='acc-list.do'">
		</div>	
	</div>	
	</fieldset>
	</form>
	</main>
</body>
</html>