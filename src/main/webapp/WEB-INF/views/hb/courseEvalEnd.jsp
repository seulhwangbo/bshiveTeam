<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/offLctrBanner.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>평가 완료</title>
</head>
<header> <%@ include file="../header.jsp" %> </header>
<body>
<div class="lctrList_main_banner">
		<div class="lctrList_main_banner_text3"><div class="lctrList_main_banner_do"></div>${lctr.lctr_name}</div>
		<div class="lctrList_main_banner_text">offline</div><div class="lctrList_main_banner_text2">결과 확인</div>
		<img alt="메인배너" src="<%=request.getContextPath()%>/images/main/수강신청_banner.jpg" class="lctrList_main_banner_img">
</div>
    <div class="container1">
        <div class="sidebar">
            <%@ include file="../sidebarLctr.jsp" %> <!-- 사이드바 포함 -->
        </div>
     <main>
    <h2>이 강의에 대한 평가는 이미 완료되었습니다.</h2>
    <p>다시 평가를 진행할 수 없습니다. 다른 강의를 평가해 주세요.</p>
    <a href="/hs/hsClassMain?lctr_num=${lctr.lctr_num }">홈으로 돌아가기</a>
     </main>
 </div>
    <footer> <%@ include file="../footer.jsp" %> </footer>
</body>
</html>   

