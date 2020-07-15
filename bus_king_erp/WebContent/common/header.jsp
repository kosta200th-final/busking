<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ERP for Bus Operators</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/header.css" />" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Gothic+A1|Arimo" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" 
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/js/gnb.js" />"></script>
    <script src="<c:url value="/resources/js/aside.js" />"></script>
</head>
<body>
    
    <!-- HEADER -->
    <div class="wrap">
        <header>
             <h1><a href="#">BUSKING</a></h1>
             <nav class="gnb">
                 <a href="#" class="on">배차</a>
                 <a href="#">인사</a>
                 <a href="#">회계</a>
                 <a href="#">정비</a>
                 <a href="#">사고∙범칙금</a>
             </nav>
        </header>
             
            <div class="lnb bus on">
                <div class="lnb-con on">
                    <a href="#" class="on">차량관리</a>
                    <a href="#">노선관리</a>	<!-- /bus_king_erp/bc/r-list.do -->
                    <a href="#">배차정보</a>
                    <a href="#">운행정보</a>
                </div>
            </div>
            
            <div class="lnb labor">
                <div class="lnb-con">
                    <a href="#">인사관리</a>
                    <a href="#">근태관리</a>
                    <a href="#">급여정보</a>
                    <a href="#">정산관리</a>
                </div>
            </div>
            
            <div class="lnb acct">
               <div class="lnb-con">
                    <a href="#">매입매출</a>
                </div>
            </div>
            
            <div class="lnb repair">
                <div class="lnb-con">
                    <a href="#">정비관리</a>
                    <a href="#">연료관리</a>
                </div>
            </div>
            
            <div class="lnb fine">
                <div class="lnb-con">
                    <a href="#">교통사고관리</a>
                    <a href="#">범칙금관리</a>
                    <a href="#">민원관리</a>
                </div>
            </div>
    </div>
    
</body>
</html>