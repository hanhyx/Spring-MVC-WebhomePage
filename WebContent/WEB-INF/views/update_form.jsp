<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>�����ϱ� ȭ��</title>
</head>
<%@include file="header11.jsp"%>
<body>
	<form action="update.do" method="post">

		<b style="font-size: 20px">���� : </b><input type="text" name="title"
			value="${original.title}" id="emptyTitle" size="20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<b style="font-size: 20px">ī�װ� : </b><select name="boardCategory"
			id="boardCategory">
			<option value="0">���þ���</option>
			<option value="1">��⵵</option>
			<option value="2" />������
			</option>
			<option value="3" />��û��
			</option>
			<option value="4" />����
			</option>
			<option value="5" />���
			</option>
			<option value="6" />���ֵ�
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