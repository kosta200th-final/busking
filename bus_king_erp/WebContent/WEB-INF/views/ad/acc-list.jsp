<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/common/header.jsp" %>
<%@include file="/common/accidentSubMenu.jsp" %>

<main>
   <div class="table100 ver2 m-b-110">
      <table data-vertable="ver2" class="accTable">
         <thead>
            <tr class="row100 head">
               <th class="column100 column1" data-column="column1">접수번호</th>
               <th class="column100 column2" data-column="column2">버스번호</th>
               <th class="column100 column3" data-column="column3">사원번호</th>
               <th class="column100 column4" data-column="column4">면허번호</th>
               <th class="column100 column5" data-column="column5">차량상태</th>
               <th class="column100 column6" data-column="column6">확인</th>
               <th class="column100 column7" data-column="column7">
                  <a class="okBtn" onclick="location.href='acc-insertform.do'">추가</a>&nbsp;&nbsp;
                  <a id="addBtn" class="okBtn" onclick="location.href='acc-chart.do'">교통사고차트</a>
               </th>
<!--                <th style="color:#333">.</th> -->
            </tr>
         </thead>
         <tbody>
            <c:forEach items="${accidentlist}" var="list">
               <tr>
                  <td class="code">${list.acc_no}</td>
                  <td class="carNum">${list.acc_b_no}</td>
                  <td class="price" style="text-align:center">${list.acc_e_no}</td>
                  <td class="price" style="text-align:center">${list.acc_e_license}</td>
                  <td class="state"><span>${list.acc_state}</span></td>
                  <c:if test="${list.acc_state == '운행가능'}">
                     <td class="result"><span></span></td>
                  </c:if>
                  <c:if test="${list.acc_state == '수리요함'}">
                     <td class="result">
                        <a href="acc-repair.do?acc_no=${list.acc_no}" class="stateBtn">정비접수</a>   
                     </td>
                  </c:if>
                  <c:if test="${list.acc_state == '정비접수'}">
                     <td class="result">
                        <%-- <a href="acc-repair.do?acc_no=${list.acc_no}" class="stateBtn">운행가능</a> --%>
                     </td>
                  </c:if>
                  <td class="btn-width" >
                     <span class="btn-wrap">
                        <input type="button" value="수정"
                           class="button type green"
                           onclick="location.href='acc-updateform.do?acc_no=${list.acc_no}'">
                        <input type="button" value="삭제"
                           class="button type red"
                           onclick="location.href='acc-delete.do?acc_no=${list.acc_no}'">
                        <input type="button" value="더보기"
                           class="button type all btn">
                     </span>
                     <aside>
                        <ul>
                           <li>
                              사고난 시각 :
                              <fmt:parseDate
                                 value='${list.acc_date}' var='trading_day'
                                 pattern='yyyy-MM-dd HH:mm' />
                              <fmt:formatDate
                                 value="${trading_day}" pattern="yyyy/MM/dd HH:mm" />
                           </li>
                           <li>
                              사고난 장소 : ${list.acc_located}
                           </li>
                           <li>
                              사고난 내용 : ${list.acc_breakdown}
                           </li>
                        </ul>
                     </aside>
                  </td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
   </div>
      
     <table width="600" class="pgTable">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="acc-list.do?pg=1">◀◀</a>]
			[<a href="acc-list.do?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="acc-list.do?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="acc-list.do?pg=${toPage+1}">▶</a>]
				[<a href="acc-list.do?pg=${allPage}">▶▶</a>]
		
		</c:if> <c:if test="${toPage>=allPage}">
					<!-- 21>=21 :true -->
				[<span style="color: gray">▶</span>]
				[<span style="color: gray">▶▶</span>]
		
		</c:if>
			</td>
		</tr>
	</table>
</main>

<script type="text/javascript"> 

$("span:contains('수리요함')").css({color:"#A72734"});
$("span:contains('정비접수')").css({color:"green"});
$("span:contains('운행가능')").css({color:"#0062C1"});

</script>
</html>