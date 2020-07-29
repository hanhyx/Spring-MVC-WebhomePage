<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>로그인 화면</title>
<style type="text/css">
	div, form{
		width: 60%;
		height: 100px;
		margin: auto;
		text-align: center;
	}
	form{
		border: dotted;
		border-color: grey;
	}
	table{
		margin: auto;
	}
</style>
</head>
<body>
	<div>
		<h2>로그인 페이지</h2>
		<form action="login.do" method="post">
		<table>
			<tr>
				<td>아이디 : </td>
				<td>
					<input type="text" name="id" size="10" required>
				</td>
			</tr>
			<tr>
				<td>패스워드 : </td>
				<td>
					<input type="password" name="password" size="10" required>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="LOGIN">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>