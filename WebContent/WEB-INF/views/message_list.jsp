<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>메세지 목록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
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
<input type="button" id="receivingMessageBoxBtn" value="받은 메세지">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" id="sendingMessageBoxBtn" value="보낸 메세지">
<hr>
</div>
	<!-- 받은 메세지  -->
	<div id="receivingMessageBox">
	<h2>받은 메세지</h2>
	<br>
	<table class="table table-striped table-hover" border="1">
		<tr>
			<td>제목</td>
			<td>보낸사람</td>
			<td>받은시간</td>
			<td>삭제</td>
		</tr>
		<c:if test="${empty receiveMessage.messageList}">
			<tr>
				<td colspan="4">받은 메세지가 없습니다.</td>
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
						<a href="messageREDelete.do?message_num=${messageVO.message_num}">[삭제]</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<hr>	
	<div class="text-center">
		<!-- 	하단 페이지 링크 부분 -->
		<c:forEach begin="${receiveMessage.startPage}"
			end="${receiveMessage.endPage}" var="p" step="1">
			<a href="message.do?page=${p}">${p} </a>
		</c:forEach>
	</div>
	</div>

	<!-- 보낸 메세지  -->
	<div id="sendingMessageBox" style="display: none;">
	<br>
	<h2>보낸 메세지</h2>
	<br>
	<table class="table table-striped table-hover" border="1">
		<tr>
			<td>제목</td>
			<td>받은사람</td>
			<td>작성시간</td>
			<td>확인여부</td>
			<td>삭제</td>
		</tr>
		<c:if test="${empty sendMessage.messageList}">
			<tr>
				<td colspan="5">보낸 메세지가 없습니다.</td>
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
					<td>미확인</td>	
					</c:if>
					<c:if test="${messageVO.checked != 0}">		
					<td>확인</td>	
					</c:if>		
					<td>
						<a href="messageSEDelete.do?message_num=${messageVO.message_num}">[삭제]</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<hr>
	<div class="text-center">
		<!-- 	하단 페이지 링크 부분 -->
		<c:forEach begin="${sendMessage.startPage}"
			end="${sendMessage.endPage}" var="p" step="1">
			<a href="message.do?page=${p}">${p} </a>
		</c:forEach>
	</div>
	</div>

	<!-- 	아래 버튼 -->

</body>
</html>