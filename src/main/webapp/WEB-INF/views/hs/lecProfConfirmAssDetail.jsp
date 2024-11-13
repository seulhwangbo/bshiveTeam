<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/offLctrBanner.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생제출물상세확인</title>
<style type="text/css">
	
    /* 메인 콘텐츠 영역 */
    .main {
        width: 70%;
        background-color: #fff;
        padding: 30px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    /* 과제제출 제목 스타일 */
    h1 {
        font-size: 28px;
        color: #134b84;
        border-bottom: 2px solid #134b84;
        padding-bottom: 15px;
        margin-bottom: 20px;
    }

    /* 테이블 스타일 */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th {
        background-color: #134b84;
        color: white;
        font-weight: normal;
        text-align: center !important;
        padding: 12px;
        font-size: 16px;
        width: 180px;
    }

    td {
        padding: 20px;
        text-align: left;
        background-color: #fff;
        color: #333;
        font-size: 14px;
    }

    /* 텍스트 입력 영역 스타일 */
    .form-control {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
        line-height: 1.6;
    }

    /* 텍스트영역 */
    textarea.form-control {
        height: 100px;
    }

    /* 파일 업로드 입력 필드 */
    .form-control-file {
        width: 100%;
        padding: 8px;
        margin: 5px 0;
        font-size: 14px;
    }
    
    /* 제출 안내 스타일 */
    td[colspan="4"] {
        font-size: 12px;
        color: #F15F5F;
        text-align: center;
        padding-left: 10px;
        padding-top: 10px;
    }
    
    ul {
    	list-style-type: none;
    }
    
    button {
		margin-left: 10px;
		cursor: pointer; /* 마우스 커서 변경 */
		border: none;
		color: red;
		background-color: white;
	}
</style>
<script type="text/javascript">
	// 목록으로 이동 시 저장 안된다는 경고
	function confirmRedirect() {
	    // alert 메시지 표시 후 확인을 누르면 해당 URL로 이동
	    const isConfirmed = confirm("목록으로 이동 시 수정사항이 저장되지 않습니다. 이동하시겠습니까?");
	    
	    if (isConfirmed) {
			// 확인 버튼을 클릭하면 해당 경로로 이동
			location.href = '/hs/lecProfConfirmAssign?lctr_num=${hsAssignWrite.lctr_num}';
	    }
	}
</script>
</head>
<header>
	<%@ include file="../header.jsp" %>
</header>
<body>
	<div class="lctrList_main_banner">
		<div class="lctrList_main_banner_text3"><div class="lctrList_main_banner_do"></div>${lctr.lctr_name }</div>
		<div class="lctrList_main_banner_text">offline</div><div class="lctrList_main_banner_text2">과제확인</div>
		<img alt="메인배너" src="<%=request.getContextPath()%>/images/main/수강신청_banner.jpg" class="lctrList_main_banner_img">
	</div>
	<div class="container1">
	<div class="sideLeft">
		<%@ include file="../sidebarLctr.jsp" %>
	</div>
	<div class="main">
		<h1>학생제출물확인</h1>
		<table>
			<tr>
				<th>차수</th>
				<td>${hsAssignWrite.cycl }차</td>
				<th>강의명</th>
				<td>${hsAssignWrite.lctr_name }</td>
			</tr>
			<tr>
				<th>주제</th>
				<td colspan="3">${hsAssignWrite.asmt_tpc }</td>
			</tr>
			<tr>
				<th>상세내용</th>
				<td colspan="3">${hsAssignWrite.asmt_dtl_cn }</td>
			</tr>
		</table>
		<table>
			<tr>
				<th>이름</th>
				<td colspan="3">${hsAssignWrite.unq_num } ${hsAssignWrite.stdnt_nm }</td>
			</tr>
			<tr>
				<th>제출 내용</th>
				<td>${hsAssigStdUpd.crans_cnt  }</td>
			</tr>
			<div class="form-group">
				<tr>
					<th><label for="file">제출문서</label></th>
					<td>
						<div>
	            			<c:forEach var="filePath" items="${filePath1}">
	                			<a download="${filePath.dwnld_file_nm}" href="download?filePath=${filePath.file_path_nm}" type="media_type">
	                   				${filePath.dwnld_file_nm}
	                			</a>
	                			<br>
	            			</c:forEach>
	        			</div>
					</td>
				</tr>
			</div>
		</table>
		<form action="scoreAsmt" method="post">
			<input type="hidden" name="lctr_num" value="${hsAssignWrite.lctr_num }">
			<input type="hidden" name="cycl" value="${hsAssignWrite.cycl }">
			<input type="hidden" name="unq_num" value="${hsAssignWrite.unq_num }">
			<h5>과제 점수</h5>
			<div class="form-floating">
	  			<input type="text" name="cycl_scr" class="form-control" id="floatingInput" placeholder="숫자만 입력하세요" required="required" value="${hsAssigStdUpd.cycl_scr }">
	  			
	  			<label for="floatingInput" style="color: grey;">숫자만 입력하세요</label>
	  		</div>
			<button type="button" class="btn btn-outline-primary" style="text-align: center;" onclick="confirmRedirect()">목록</button>
	        <button type="submit" class="btn btn-outline-primary" style="text-align: center;">입력</button>
        </form>
	</div>
	</div>
</body>
<footer>
	<%@ include file="../footer.jsp" %>
</footer>
</html>