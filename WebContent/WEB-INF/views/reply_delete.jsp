<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>삭제결과</title>
<script type="text/javascript">
	window.onload = function(){
		var replyResult = '${replyResult}';
		var boardNum = '${boardNum}';
		if(replyResult=='true'){
			alert('삭제 완료!');
		}else{
			alert('삭제 실패!');
		}
		location.href="read.do?boardNum=" + boardNum;
	}
</script>
</head>
<body>

</body>
</html>