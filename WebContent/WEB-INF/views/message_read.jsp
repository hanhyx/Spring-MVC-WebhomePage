<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
<title>�۳��� Ȯ��</title>

<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	

</head>
<body>
<hr>
<br>
	<table class="table table-striped table-hover">
		<tr>
			<td>���� : </td>
			<td>${message.title}</td>
		</tr>
		<tr>
			<td>������� : </td>
			<td>${message.sender}</td>
		</tr>
		<tr>
			<td>������� : </td>
			<td>${message.receiver}</td>
		</tr>
		<tr>
			<td>�ۼ��Ͻ� : </td>
			<td>${message.writeDate}</td>
		</tr>
		<tr>
			<td>���� : </td>
			<td>${message.content}</td>
		</tr>
	</table>
	<hr>
	<br>
	
<!-- 	<a href="board.do">[board]</a> -->
<div class="text-center">
	<a href="message.do" >[�޼���������]</a>
</div>	
</body>
</html>