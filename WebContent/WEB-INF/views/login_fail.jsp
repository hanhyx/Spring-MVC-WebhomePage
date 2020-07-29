<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>로그인 실패 페이지</title>
<script type="text/javascript">
	window.onload = function() {
		alert("로그인 정보가 유효하지 않습니다."+'\n'+"다시 로그인해 주세요.");
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
<!-- 	<h2>로그인에 실패하였습니다.</h2> -->
<!-- 	<h4>아이디와 패스워드를 확인해 주세요.</h4> -->
<!-- 	<a href="loginForm.do">[다시 로그인]</a> -->
<!-- 	<a href="joinForm.do">[회원가입]</a> -->
</body>
</html>