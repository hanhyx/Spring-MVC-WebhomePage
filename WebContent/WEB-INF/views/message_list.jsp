<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>�޼��� ���</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
<script type="text/javascript">
$(function() {
	$("#receivingMessageBoxBtn").click(
			function() {
				$('#sendingMessageBox').hide();
				$('#receivingMessageBox').show();
		})
	$("#sendingMessageBoxBtn").click(
			function() {
				$('#receivingMessageBox').hide();
				$('#sendingMessageBox').show();
		})	
})
</script>
</head>
<body>
<div class="text-center">
<hr>
<input type="button" id="receivingMessageBoxBtn" value="���� �޼���">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" id="sendingMessageBoxBtn" value="���� �޼���">
<hr>
</div>
	<!-- ���� �޼���  -->
	<div id="receivingMessageBox">
	<h2>���� �޼���</h2>
	<br>
	<table class="table table-striped table-hover" border="1">
		<tr>
			<td>����</td>
			<td>�������</td>
			<td>�����ð�</td>
			<td>����</td>
		</tr>
		<c:if test="${empty receiveMessage.messageList}">
			<tr>
				<td colspan="4">���� �޼����� �����ϴ�.</td>
			</tr>
		</c:if>
		<c:if test="${not empty receiveMessage.messageList}">
			<c:forEach items="${receiveMessage.messageList}" var="messageVO">
				<tr>
					<td><a
						href="messageReceiveRead.do?message_num=${messageVO.message_num}">
							${messageVO.title} </a></td>
					<td>${messageVO.sender}</td>
					<td><fmt:formatDate value="${messageVO.writeDate}" type="both"
							dateStyle="short" timeStyle="short" /></td>
					<td><input type="hidden" value="${messageVO.message_num}">
						<a href="messageREDelete.do?message_num=${messageVO.message_num}">[����]</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<hr>	
	<div class="text-center">
		<!-- 	�ϴ� ������ ��ũ �κ� -->
		<c:forEach begin="${receiveMessage.startPage}"
			end="${receiveMessage.endPage}" var="p" step="1">
			<a href="message.do?page=${p}">${p} </a>
		</c:forEach>
	</div>
	</div>

	<!-- ���� �޼���  -->
	<div id="sendingMessageBox" style="display: none;">
	<br>
	<h2>���� �޼���</h2>
	<br>
	<table class="table table-striped table-hover" border="1">
		<tr>
			<td>����</td>
			<td>�������</td>
			<td>�ۼ��ð�</td>
			<td>Ȯ�ο���</td>
			<td>����</td>
		</tr>
		<c:if test="${empty sendMessage.messageList}">
			<tr>
				<td colspan="5">���� �޼����� �����ϴ�.</td>
			</tr>
		</c:if>
		<c:if test="${not empty sendMessage.messageList}">
			<c:forEach items="${sendMessage.messageList}" var="messageVO">
				<tr>
					<td><a
						href="messageSendRead.do?message_num=${messageVO.message_num}">
							${messageVO.title} </a></td>
					<td>${messageVO.receiver}</td>
					<td><fmt:formatDate value="${messageVO.writeDate}" type="both"
							dateStyle="short" timeStyle="short" /></td>
					<c:if test="${messageVO.checked == 0}">		
					<td>��Ȯ��</td>	
					</c:if>
					<c:if test="${messageVO.checked != 0}">		
					<td>Ȯ��</td>	
					</c:if>		
					<td>
						<a href="messageSEDelete.do?message_num=${messageVO.message_num}">[����]</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<hr>
	<div class="text-center">
		<!-- 	�ϴ� ������ ��ũ �κ� -->
		<c:forEach begin="${sendMessage.startPage}"
			end="${sendMessage.endPage}" var="p" step="1">
			<a href="message.do?page=${p}">${p} </a>
		</c:forEach>
	</div>
	</div>

	<!-- 	�Ʒ� ��ư -->

</body>
</html>