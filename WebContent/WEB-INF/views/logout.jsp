<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>�α׾ƿ�</title>
<script type="text/javascript">
	window.onload = function() {
		alert('�α׾ƿ� �Ǿ����ϴ�.');
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

</body>
</html>