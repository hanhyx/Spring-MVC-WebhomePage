<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>�۾��� ȭ��</title>
</head>
<%@include file="header11.jsp"%>
<body>
	<form action="messageWrite.do" method="post">

		<b style="font-size: 20px">�޴»�� : </b> <input type="text"
			name="receiver" size="20" value="${receiver}" readonly="readonly">
		<br> <b style="font-size: 20px">�� &nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </b> <input type="text"
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