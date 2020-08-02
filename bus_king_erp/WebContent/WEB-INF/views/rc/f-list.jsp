<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, kr.kosta.bus.mapper.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/repairSubMenu.jsp"%>
<style>

.bussub {
	float: right;
	margin-right: 2.5%;
	
	/* margin-left: 2.5%; */
    padding-left: 0px;
    padding: 5px 10px;
    font-size: 12px;
    border: solid .5px #60ad5e;
    color: #4c8c4a;
    /* background: transparent; */
    cursor: pointer;
}
</style>
<script type="text/javascript"> 
	function bnt1(f_code) {
		//alert(c_no);
		if (confirm("삭제하시겠습니까?") == true) {
			location.href="f-delete.do?f_code="+f_code;
		} else {
			return;
		}
	}
/* 
	   function delete_btn(acc_no) {
		      //alert(acc_no);
		      if(confirm("삭제하시겠습니까?") == true) {
		         location.href="acc-delete.do?acc_no="+acc_no;
		      }else{
		         return;
		      }
		   } */
</script>
<style type="text/css">
#ma {
	text-align: center;
	width: 350;
	line-height: 1.5;
}
</style>
<meta charset="UTF-8">
<title>차량점검리스트</title>

</head>
<body>
	<main>
			<div class="table100 ver2 m-b-110">
				<br> 
				<input type="button" value="추가하기"
					class="bussub button modifyBtn"
					onclick="location.href='f-insertform.do'"><br>
				<table data-vertable="ver2">
						<tr class="row100 head">
							<th>No</th>
							<th>버스 차량번호</th>
							<th>주유 타입</th>
							<th>주유 날짜</th>
							<th>결제 날짜</th>
							<th>충전 & 주유 량</th>
							<th>충전&주유 비용</th>
							<th>결제내역</th>
							<th>회계내역</th>
							<th>비고(특이사항)</th>
							<th></th>
							<th></th>
						</tr>
						<c:forEach items="${fuel}" var="list">
							<tr align="center">
								<td class="code">${list.f_code}</td>
								<td>${list.f_b_no}</td>
								<td>${list.f_b_energy}</td>
								<td><fmt:parseDate value='${list.f_date}' var='f_date'
										pattern='yyyy-mm-dd' /> <fmt:formatDate value="${f_date}"
										pattern="yyyy.mm.dd" /></td>
								<td><fmt:parseDate value='${list.f_date2}' var='f_date2'
										pattern='yyyy-mm-dd' /> <fmt:formatDate value="${f_date2}"
										pattern="yyyy.mm.dd" /></td>
								<td>${list.f_charge}(L/Kw)</td>
								<td>${list.f_cost}원</td>
								<td>${list.f_payment}</td>
								<td>${list.f_nametag}</td>
								<td>${list.f_bigo}</td>
								<td><input type="button" value="결제" class="type button all"
									onclick="location.href='f-update.do?f_code=${list.f_code}&f_payment=결제완료'">
<%-- 								
								<input type="button" value="삭제" class="type button red"
									onclick="location.href='re-delete.do?re_code=${repairlist.re_code}'"> --%>
							<input type="button" value="삭제" class="button type red"
							 		onclick="bnt1(${list.f_code})">
								</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		<table style="width: 600" class="pgTable">
			<tr>
				<td align="center">
					<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
						<!-- 5>10 : false / 15>10 : true -->
			[<a href="f-list?pg=1">◀◀</a>]
			[<a href="f-list.do?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
						<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
						var="i">
						<c:if test="${i==pg}">[${i}]</c:if>
						<c:if test="${i!=pg}">
				[<a href="f-list.do?pg=${i}">${i}</a>]
			</c:if>
					</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
						<!-- 20<21 : true -->
				[<a href="f-list.do?pg=${toPage+1}">▶</a>]
				[<a href="f-list.do?pg=${allPage}">▶▶</a>]
		
		</c:if> <c:if test="${toPage>=allPage}">
						<!-- 21>=21 :true -->
				[<span style="color: gray">▶</span>]
				[<span style="color: gray">▶▶</span>]
		
		</c:if>
				</td>
			</tr>
		</table>
	</main>
</body>
</html>
