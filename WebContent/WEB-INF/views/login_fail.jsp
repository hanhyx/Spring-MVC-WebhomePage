<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>�α��� ���� ������</title>
<script type="text/javascript">
	window.onload = function() {
		alert("�α��� ������ ��ȿ���� �ʽ��ϴ�."+'\n'+"�ٽ� �α����� �ּ���.");
		// 		location.href="${pageContext.request.contextPath}/";
		// 		history.go(-1);
		if ('referrer' in document) {
			window.location = document.referrer;
			/* OR */
			//location.replace(document.referrer);
		} else {
			window.history.back();
		}
	}
</script>
</head>
<body>
<!-- 	<h2>�α��ο� �����Ͽ����ϴ�.</h2> -->
<!-- 	<h4>���̵�� �н����带 Ȯ���� �ּ���.</h4> -->
<!-- 	<a href="loginForm.do">[�ٽ� �α���]</a> -->
<!-- 	<a href="joinForm.do">[ȸ������]</a> -->
</body>
</html>