<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>�������</title>
<script type="text/javascript">
	window.onload = function(){
		var replyResult = '${replyResult}';
		var boardNum = '${boardNum}';
		if(replyResult=='true'){
			alert('���� �Ϸ�!');
		}else{
			alert('���� ����!');
		}
		location.href="read.do?boardNum=" + boardNum;
	}
</script>
</head>
<body>

</body>
</html>