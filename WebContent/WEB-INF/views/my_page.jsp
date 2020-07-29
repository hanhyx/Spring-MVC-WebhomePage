<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>마이페이지</title>
</head>
<body>
	<h2>회원 정보</h2>
	<table>
		<tr>
			<td><img class="d-flex mr-3 rounded-circle"
				src="img/${memberInfo.profilePicPath}" width="50" height="50" alt=""> </td>
			<td>${memberInfo.id}</td>
		</tr>
		<tr>
			<td>Name:</td>
			<td>${memberInfo.name}</td>
		</tr>
		<tr>
			<td>Phone:</td>
			<td>${memberInfo.phone}</td>
		</tr>
		<tr>
			<td>Email:</td>
			<td>${memberInfo.email}</td>
		</tr>
	</table>
<!-- 	<a href="main.do">[Main]</a> -->
<!-- 	<a href="board.do">[Board]</a> -->
</body>
</html>