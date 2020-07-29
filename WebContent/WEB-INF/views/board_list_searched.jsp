<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${boardPageSearched.boardList}" var="boardVO">
		<div class="card mb-4">
			<c:if test="${not empty boardVO.mainPic.originName}">
				<img class="card-img-top" width="750" height="250"
					src="img/${boardVO.mainPic.originName}" alt="Card image cap">
			</c:if>
			<div class="card-body">
			<div class="row">
				<div class="col-md-10">
				<h2 class="card-title">${boardVO.boardNum}.
					${boardVO.title}</h2>
				</div>
				<div class="col-md-2 text-right">
					<c:if test="${boardVO.replyCount > 0}">
						Reply. <span style="color: red; font-size: 16;">(${boardVO.replyCount})
						</span>
					</c:if>
				
				</div>
				</div>

<%-- 				<p class="card-text">${boardVO.content}</p> --%>
				<a href="read.do?boardNum=${boardVO.boardNum}"
					class="btn btn-primary">Read More &rarr;</a>
			</div>
			<div class="card-footer text-muted">
				<div class="row">
					<div class="col-md-3">
						<fmt:formatDate value="${boardVO.writeDate}" type="both"
							dateStyle="short" timeStyle="short" />
					</div>		
					<div class="col-md-5">		
						<div class="dropdown">
							By <c:if test="${sessionScope.loginId == boardVO.writer}">${boardVO.writer}</c:if>
							<c:if test="${sessionScope.loginId != boardVO.writer}">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">${boardVO.writer}<span
								class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu"
								style="background-color: #FDEBC8;">
									<li>
									<input type="hidden" name="otherProfileInfo" value="${boardVO.writer}" />
									<a class="otherProfileBtn" href="#">profile</a>
									</li>
								<li><a href="messageForm.do?receiver=${boardVO.writer}">message</a></li>
							</ul>
							</c:if>
							
						</div>
					</div>
					<div class="col-md-4 text-right">
					
					 Hit: <b>${boardVO.readCount}</b>
					 </div>
				</div>
			</div>
		</div>
	</c:forEach>

	<!-- Pagination -->
	<ul class="pagination justify-content-center mb-4">
		<c:if test="${boardPageSearched.currentPage <= boardPageSearched.startPage}">
		<c:if test="${boardPageSearched.startPage != 1}">
			<li class="page-item"><a class="page-link"
				href="board.do?page=${boardPageSearched.startPage -1 }">&larr; 이전</a></li>
		</c:if>
		</c:if>
		<c:if
			test="${boardPageSearched.currentPage > boardPageSearched.startPage}">
			<li class="page-item"><a class="page-link"
				href="board.do?page=${boardPageSearched.currentPage -1}">&larr;
					Newer</a></li>
		</c:if>
		<div>
			<!-- 	하단 페이지 링크 부분 -->
			<c:forEach begin="${boardPageSearched.startPage}"
				end="${boardPageSearched.endPage}" var="p" step="1">
				<c:if test="${boardPageSearched.currentPage == p}">${p}</c:if>
				<c:if test="${boardPageSearched.currentPage != p}">
					<a href="board.do?page=${p}">${p}</a>
				</c:if>

			</c:forEach>
		</div>
		<c:if
			test="${boardPageSearched.currentPage < boardPageSearched.endPage}">
			<li class="page-item"><a class="page-link"
				href="board.do?page=${boardPageSearched.currentPage +1}">Older
					&rarr;</a></li>
		</c:if>
		<c:if test="${boardPageSearched.currentPage >= boardPage.endPage}">
		<c:if test="${boardPageSearched.endPage != boardPage.totalPage}">
			<li class="page-item"><a class="page-link" href="board.do?page=${boardPageSearched.endPage + 1}">다음
					&rarr;</a></li>
		</c:if>
		</c:if>
	</ul>

</body>
</html>