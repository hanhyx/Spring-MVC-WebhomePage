<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
<title>글내용 확인</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	

</head>
<body>
<hr>
<br>
	<table class="table table-striped table-hover">
		<tr>
			<td>제목 : </td>
			<td>${message.title}</td>
		</tr>
		<tr>
			<td>보낸사람 : </td>
			<td>${message.sender}</td>
		</tr>
		<tr>
			<td>받은사람 : </td>
			<td>${message.receiver}</td>
		</tr>
		<tr>
			<td>작성일시 : </td>
			<td>${message.writeDate}</td>
		</tr>
		<tr>
			<td>내용 : </td>
			<td>${message.content}</td>
		</tr>
	</table>
	<hr>
	<br>
	
<!-- 	<a href="board.do">[board]</a> -->
<div class="text-center">
	<a href="message.do" >[메세지함으로]</a>
</div>	
</body>
</html>