<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>수정하기 화면</title>
</head>
<%@include file="header11.jsp"%>
<body>
	<form action="update.do" method="post">

		<b style="font-size: 20px">제목 : </b><input type="text" name="title"
			value="${original.title}" id="emptyTitle" size="20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<b style="font-size: 20px">카테고리 : </b><select name="boardCategory"
			id="boardCategory">
			<option value="0">선택없음</option>
			<option value="1">경기도</option>
			<option value="2" />강원도
			</option>
			<option value="3" />충청도
			</option>
			<option value="4" />전라도
			</option>
			<option value="5" />경상도
			</option>
			<option value="6" />제주도
			</option>
		</select> <br> <br>

		<%@include file="write_note.html"%>

		<br> <br> <input type="hidden" name="boardNum"
			value="${original.boardNum}">
		<div class="text-center">
			<input type="submit" id="btnSubmit" class="btn btn-primary"
				value="UPDATE">
		</div>

	</form>

</body>
<%@include file="footer.jsp"%>
</html>