<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>글쓰기 화면</title>
</head>
<%@include file="header11.jsp"%>
<body>
	<form action="messageWrite.do" method="post">

		<b style="font-size: 20px">받는사람 : </b> <input type="text"
			name="receiver" size="20" value="${receiver}" readonly="readonly">
		<br> <b style="font-size: 20px">제 &nbsp;&nbsp;&nbsp;&nbsp;목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </b> <input type="text"
			name="title" id="emptyTitle" size="20"> <br>
		<%@include file="write_note.html"%><br> <br>
		<div class="text-center">
			<input type="submit" id="btnSubmit" class="btn btn-primary"
				value="Sending">
		</div>
	</form>

</body>
<%@include file="footer.jsp"%>
</html>