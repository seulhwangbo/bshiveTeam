<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/css/offLctrBanner.css" rel="stylesheet" type="text/css">

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>평가 이후 확인 페이지</title>
    <style type="text/css">
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f4f4f4;
            color: #333;
            font-weight: bold;
        }

        td {
            background-color: #fafafa;
        }

        tr:nth-child(even) td {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        input[type="button"] {
            padding: 8px 15px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            font-size: 14px;
        }

        input[type="button"]:hover {
            background-color: #45a049;
        }

        .modal {
            display: none;  /* 기본적으로 숨김 */
            position: fixed;
            z-index: 1; /* 화면 앞에 표시 */
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4); /* 배경 어두운 색 */
        }

        /* 모달 내용 스타일 */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* 원하는 크기로 설정 */
            max-width: 500px;
        }

        /* 닫기 버튼 */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>

<header><%@ include file="../header.jsp" %></header>
<body>
    <div class="lctrList_main_banner">
        <div class="lctrList_main_banner_text3"><div class="lctrList_main_banner_do"></div>${lctr.lctr_name }</div>
        <div class="lctrList_main_banner_text">offline</div><div class="lctrList_main_banner_text2">최종성적 확인</div>
        <img alt="메인배너" src="<%=request.getContextPath()%>/images/main/수강신청_banner.jpg" class="lctrList_main_banner_img">
    </div>
    <div class="container1">
        <div class="sidebar">
            <%@ include file="../sidebarLctr.jsp" %> <!-- 사이드바 포함 -->
        </div>
        <main>
 			<input type="hidden" name="lctr_num" value="${lctr_num}">
              <table>
    <thead>
        <tr>
            <th>학생 이름</th>
            <th>강의 평가</th>
            <th>성적 확인</th>
        </tr>
    </thead>
    <tbody>
       <tbody>
    <tr>
        <td>${stdntName}</td> <!-- 학생 이름 -->
        <td>${evalStatus}</td> <!-- 강의 평가 상태 -->
        <td>
            <!-- evalStatus가 '강의 평가 완료'일 때만 링크를 활성화 -->
            <c:choose>
                <c:when test="${evalStatus == '강의 평가 완료'}">
                    <a href="/hb/detailResult?lctr_num=${lctr_num}&unq_num=${unq_num}" class="btn btn-primary">성적 확인</a>
                </c:when>
                <c:otherwise>
                    <button class="btn btn-secondary" disabled>성적 확인</button>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
</tbody>
</table>
        </main>
    </div>
    <footer>
        <%@ include file="../footer.jsp" %>
    </footer>
</body>
</html>