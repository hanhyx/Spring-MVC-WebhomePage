<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>�α��� ȭ��</title>
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
		<h2>�α��� ������</h2>
		<form action="login.do" method="post">
		<table>
			<tr>
				<td>���̵� : </td>
				<td>
					<input type="text" name="id" size="10" required>
				</td>
			</tr>
			<tr>
				<td>�н����� : </td>
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