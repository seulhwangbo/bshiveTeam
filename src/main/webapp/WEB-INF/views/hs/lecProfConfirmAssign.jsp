<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/offLctrBanner.css" rel="stylesheet" type="text/css">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 임시로 fn 제작 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생과제제출물(교수)</title>
<style type="text/css">

</style>
</head>
<header>
	<%@ include file="../header.jsp" %>
</header>
<body>
	<div class="lctrList_main_banner">
		<div class="lctrList_main_banner_text3"><div class="lctrList_main_banner_do"></div>${lctr.lctr_name }</div>
		<div class="lctrList_main_banner_text">offline</div><div class="lctrList_main_banner_text2">학생 과제 확인</div>
		<img alt="메인배너" src="<%=request.getContextPath()%>/images/main/수강신청_banner.jpg" class="lctrList_main_banner_img">
	</div>
	<div class="container1">
		<div class="sideLeft">
			<%@ include file="../sidebarLctr.jsp" %>
		</div>
		<div class="main">
			<h1>학생과제제출물(교수)</h1>
			<c:forEach var="AssignAbmsn" items="${AssignAbmsn }">
				<h3>${AssignAbmsn.cycl }차 제출인원: ${AssignAbmsn.asmtSubCount }명</h3>
				<c:forEach var="student" items="${AssignAbmsn.studentList }">
				<table>
					<tr>
						<th>학번</th>
						<th>이름</th>
						<th>상세보기</th>
					</tr>
					<tr>
						<td>${student.unq_num }</td>
						<td>${student.stdnt_nm }</td>
						<td><button class="btn btn-outline-dark btn-sm" onclick="location.href='/hs/lecProfConfirmAssDetail?lctr_num=${student.lctr_num}&cycl=${student.cycl }&unq_num=${student.unq_num }'">보기</button> </td>
					</tr>
				</table>
				</c:forEach>
			
			</c:forEach>
			
			
			
			
			
			
			
				<c:if test="${not empty board.filegroup}">
                    <c:forEach var="filePath" items="${fn:split(View.file_group, ',')}">
                    <c:set var="fileName" value="${fn:substringAfter(filePath, '')}" />
                            <a download="${fileName }" href="download?filePath=${filePath.trim()}" type="media_type">
                                ${fileName} 다운로드 </a>
                            <br>
                        </c:forEach>
                </c:if>
		</div>
	</div>
</body>
<footer>
	<%@ include file="../footer.jsp" %>
</footer>
</html>