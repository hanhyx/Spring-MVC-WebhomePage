<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>로그인 성공 페이지</title>
<script type="text/javascript">
	window.onload = function() {
// 		alert('로그아웃 되었습니다.');
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
<!-- 	<h2>로그인 완료</h2> -->
<!-- 	<a href="board.do">[게시판]</a> -->
<!-- 	<a href="myPage.do">[마이페이지]</a> -->
</body>
</html>