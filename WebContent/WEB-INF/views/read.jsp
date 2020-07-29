<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>

<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Blog Post - Start Bootstrap Template</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.10.2.min.js"></script> -->
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="vendor1/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/blog-post.css" rel="stylesheet">

<script type="text/javascript">
	function del_func() {
		var result = confirm('정말 삭제하시겠습니까?');
		if (result == true) {
			location.href = "delete.do?boardNum=${board.boardNum}";
			return true;
		}
		return false
	}

	
	$(function() {
			$("#btnReply").click(function() {
								var content = $("#content").val();
								var boardNum = "${board.boardNum}"
								var param = "content=" + content
											+ "&boardNum=" + boardNum;
								$.ajax({
										type : "post",
										url : "reply.do",
										data : param,
										dataType : 'text',
										success : function(result) {
										location.href = "read.do?boardNum=${board.boardNum}";
										},
										error : function() {
										alert('erro');
										}
								});
									return false;
								});

				$(".Submit")
						.click(
								function() {
									var replyNum = $(this).siblings(
											'input[type=hidden]').val();
									var content = $(this).siblings(
											'textarea[name=content]').val();
									var boardNum = "${board.boardNum}"
									var param = "content=" + content
											+ "&boardNum=" + boardNum
											+ "&replyNum=" + replyNum;
									$
											.ajax({
												type : "post",
												url : "replyComment.do",
												data : param,
												dataType : 'text',
												success : function(result) {
													location.href = "read.do?boardNum=${board.boardNum}";
												},
												error : function() {
													alert('erro');
												}
											});
									return false;
								});

				$(".btnReplyUpdate")
						.click(
								function() {
									var replyNum = $(this).siblings(
											'input[type=hidden]').val();
									var content = $(this).siblings(
											'.reContentUpdateComment').val();
									var boardNum = "${board.boardNum}"
									var param = "content=" + content
											+ "&boardNum=" + boardNum
											+ "&replyNum=" + replyNum;
									$
											.ajax({
												type : "post",
												url : "replyUpdate.do",
												data : param,
												dataType : 'text',
												success : function(result) {
													location.href = "read.do?boardNum=${board.boardNum}";
												},
												error : function() {
													alert('erro');
												}
											});
									return false;
								});

				$('.linkDel').click(
						function() {
							var replyNum = $(this).siblings(
									'input[type=hidden]').val();
							var result = confirm('정말 삭제하시겠습니까?');
							if (result == true) {
								location.href = "replyDelete.do?replyNum="
										+ replyNum;
								return true;
							}
							return false
						})
				$('.reComment').click(
						function() {
							var replyNum = $(this).siblings(
									'input[name=replyComment]').val();
							var replyContent = $(this).siblings(
									'input[name=replyCommentContent]').val();
							if (replyContent != null) {
								var replyContent = null
								$('#commentDiv' + replyNum).show();
								$('#reContentUpdate' + replyNum).show();
								$('#reContentUpdateBtn' + replyNum).show();
								return false
							} else {
								var replyContent = null
								$('#commentDiv' + replyNum).show();
								$('#reContent' + replyNum).show();
								$('#reContentReset' + replyNum).show();
								$('#reContentSubmitBtn' + replyNum).show();
								return false
							}
						})

				$('.btnReplyCancel').click(
						function() {
							var replyNum = $(this).siblings(
									'input[type=hidden]').val();
							$('#reContentUpdateBtn' + replyNum).hide();
							$('#reContentReset' + replyNum).hide();
							$('#reContentSubmitBtn' + replyNum).hide();
							$('#reContent' + replyNum).hide();
							$('#reContentUpdate' + replyNum).hide();
							$('#commentDiv' + replyNum).hide();
							return false
						})
				
			$(".otherProfileBtn").click(function() {
				var cw=screen.availWidth;    
				var ch=screen.availHeight;    

				var sw=300;    
				var sh=250;    

				var ml=(cw-sw)/2;        
				var mt=(ch-sh)/2;  
				
				var writer = $(this).siblings('input[name=otherProfileInfo]').val();
				window.open('myPage.do?messager='+writer, '개인정보','width='+sw+',height='+sh+',top='+mt+',left='+ml+', location=no, toolbar=no, menubar=no, resizable=no, scrollbars=yes')
			})		

			})
</script>


</head>
<%@include file="header1.jsp"%>
<body>


	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Post Content Column -->
			<div class="col-lg-12">

				<!-- Title -->
				<h1 class="mt-4">${board.title}</h1>

				<!-- Author -->
				<p class="lead">
					<div class="dropdown">&nbsp;&nbsp;By&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${sessionScope.loginId == board.writer}"><b style="font-size: 20px">${board.writer}</b></c:if>
					<c:if test="${sessionScope.loginId != board.writer}">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" style="font-size: 20px">${board.writer}<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu" style="background-color: #FDEBC8	;">
						<li>
							<input type="hidden" name="otherProfileInfo" value="${board.writer}" />
							<a class="otherProfileBtn" href="#">profile</a>
						</li>
						<li><a href="messageForm.do?receiver=${board.writer}">message</a></li>
						
					</ul>
					</c:if>
					</div>
				</p>

				<hr>


				<!-- Date/Time -->
				<p>
					Posted on ${board.writeDate}
					<c:if test="${sessionScope.loginId == board.writer}">
						<a href="updateForm.do?boardNum=${board.boardNum}"
							class="btn btn-primary">Update</a>
						<a onclick="del_func()" href="#" class="btn btn-primary">Delete</a>
					</c:if>
				</p>


				<hr>

				<!-- Preview Image -->
				<!--           <img class="img-fluid rounded" src="http://placehold.it/900x300" alt=""> -->
				<c:if test="${not empty board.downPic}">
					<div id="carouselExampleIndicators" class="carousel slide my-4"
						data-ride="carousel">

						<ol class="carousel-indicators">
							<c:forEach items="${board.downPic}" var="pictureVO"
								varStatus="vst">
								<c:if test="${vst.count == 1}">
									<li data-target="#carouselExampleIndicators"
										data-slide-to="${vst.count-1}" class="active"></li>
								</c:if>
								<c:if test="${vst.count != 1}">
									<li data-target="#carouselExampleIndicators"
										data-slide-to="${vst.count-1}"></li>
								</c:if>
							</c:forEach>
						</ol>
						<div class="carousel-inner" role="listbox">
							<c:forEach items="${board.downPic}" var="pictureVO"
								varStatus="vst">
								<c:if test="${vst.count == 1}">
									<div class="carousel-item active">
										<img class="d-block img-fluid" width="900" height="350"
											src="img/${pictureVO.originName}">
									</div>
								</c:if>
								<c:if test="${vst.count != 1}">
									<div class="carousel-item">
										<img class="d-block img-fluid" width="900" height="350"
											src="img/${pictureVO.originName}">
									</div>
								</c:if>
							</c:forEach>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</c:if>

				<hr>

				<!-- Post Content -->
				<div class="card my-4">
					<div class="card-body">
						<p>${board.content}</p>
						<script type="text/javascript">
							
						</script>
					</div>
				</div>



				<hr>

				<!-- Comments Form -->
				<div class="card my-4">
					<h5 class="card-header">Leave a Comment:</h5>
					<div class="card-body">
						<form>
							<div class="form-group">
								<textarea class="form-control" name="content" id="content"
									rows="3"></textarea>
							</div>
							<button type="submit" class="btn btn-primary" id="btnReply">Submit</button>
						</form>
					</div>
				</div>

				<!-- Single Comment -->

				<!-- Comment with nested comments -->
				<c:if test="${not empty replyPage.boardList}">
					<c:forEach items="${replyPage.boardList}" var="replyVO">
						<div class="media mb-4">
							<c:if test="${replyVO.seq > 0}">
								<c:forEach begin="1" end="${replyVO.lvl}">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</c:forEach>
							</c:if>

<%-- 							<c:if test="${replyVO.profilePicPath !=null}"> --%>
								<img class="d-flex mr-3 rounded-circle"
									src="img/${replyVO.profilePicPath}" width="50" height="50"
									alt="">
<%-- 							</c:if> --%>

<%-- 							<c:if test="${replyVO.profilePicPath ==null}"> --%>
<!-- 								<img class="d-flex mr-3 rounded-circle" src="img/no_profile.png" -->
<!-- 									width="50" height="50" alt=""> -->
<%-- 							</c:if> --%>

							<div class="media-body">

								<div class="dropdown">
									<h5 class="mt-0">
									<c:if test="${sessionScope.loginId == replyVO.writer}">${replyVO.writer}</c:if>
									<c:if test="${sessionScope.loginId != replyVO.writer}">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">${replyVO.writer}<span
											class="caret"></span>
										</a>
										<ul class="dropdown-menu" role="menu" style="background-color: #FDEBC8;">
												<li><input type="hidden" name="otherProfileInfo"
													value="${replyVO.writer}" /> <a class="otherProfileBtn"
													href="#">profile</a></li>
												<li><a href="messageForm.do?receiver=${replyVO.writer}">message</a></li>
										</ul>
											</c:if>	
									</h5>
								</div>
								<p>${replyVO.content}</p>
								<script type="text/javascript">
									
								</script>

							</div>

							<div class="row">
								<div class="col-lg-8">
									<ul class="list-unstyled mb-0 " style="font-size: 14">
										<c:if test="${sessionScope.loginId != null}">
											<li><a class="reComment" href="#">[Reply]</a><input
												type="hidden" name="replyComment"
												value="${replyVO.replyNum}" /></li>
										</c:if>
										<c:if test="${sessionScope.loginId == replyVO.writer}">
											<li><a class="reComment" href="#">[Update]</a><input
												type="hidden" name="replyComment"
												value="${replyVO.replyNum}" /> <input type="hidden"
												name="replyCommentContent" value="${replyVO.content}" /></li>
											<li><a class="linkDel" href="#">[Delete]</a> <input
												type="hidden" name="replyNum" value="${replyVO.replyNum}"
												id="replyDelete" /></li>
										</c:if>
									</ul>
								</div>
							</div>

						</div>
						<!-- ReplyComments Form -->
						<div class="card my-4" id="commentDiv${replyVO.replyNum}"
							style="display: none">
							<div class="card-body">
								<form>
									<textarea class="form-control reContent" name="content"
										id="reContent${replyVO.replyNum}" rows="3"
										style="display: none"></textarea>
									<textarea class="form-control reContentUpdateComment"
										name="content" placeholder="${replyVO.content}"
										id="reContentUpdate${replyVO.replyNum}" rows="3"
										style="display: none"></textarea>
									<input type="hidden" name="replyNum"
										value="${replyVO.replyNum}" id="reCommentUpdate" /> <br>

									<button type="reset" class="btn btn-primary"
										id="reContentReset${replyVO.replyNum}" style="display: none;">reset</button>
									<button type="button" class="btn btn-primary btnReplyCancel"
										id="btnReplyCancel">cancel</button>
									<button type="submit" class="btn btn-primary btnReplySubmit"
										id="reContentSubmitBtn${replyVO.replyNum}"
										style="display: none;">Submit</button>
									<button type="submit" class="btn btn-primary btnReplyUpdate"
										id="reContentUpdateBtn${replyVO.replyNum}"
										style="display: none;">Update</button>
								</form>
							</div>
						</div>


					</c:forEach>
					<div align="center">
						<!-- 	하단 페이지 링크 부분 -->
						<c:forEach begin="${replyPage.startPage}"
							end="${replyPage.endPage}" var="p" step="1">
							<c:if test="${replyPage.currentPage == p}">${p}</c:if>
							<c:if test="${replyPage.currentPage != p}">
								<a href="read.do?boardNum=${board.boardNum}&page=${p}">${p}
								</a>
							</c:if>
						</c:forEach>
					</div>
				</c:if>
			</div>


			<!-- Sidebar Widgets Column -->
<!-- 			<div class="col-md-4"> -->

				<!-- Search Widget -->
<!-- 				<div class="card my-4"> -->
<!-- 					<h5 class="card-header">Search</h5> -->
<!-- 					<div class="card-body"> -->
<!-- 						<div class="input-group"> -->
<!-- 							<input type="text" class="form-control" -->
<!-- 								placeholder="Search for..."> <span -->
<!-- 								class="input-group-btn"> -->
<!-- 								<button class="btn btn-secondary" type="button">Go!</button> -->
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

				<!-- Categories Widget -->
<!-- 				<div class="card my-4"> -->
<!-- 					<h5 class="card-header">Categories</h5> -->
<!-- 					<div class="card-body"> -->
<!-- 						<div class="row"> -->
<!-- 							<div class="col-lg-6"> -->
<!-- 								<ul class="list-unstyled mb-0"> -->
<!-- 									<li><a href="categorySearch.do?boardCategory=1">경기도</a></li> -->
<!-- 									<li><a href="categorySearch.do?boardCategory=2">강원도</a></li> -->
<!-- 									<li><a href="categorySearch.do?boardCategory=3">충청도</a></li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 							<div class="col-lg-6"> -->
<!-- 								<ul class="list-unstyled mb-0"> -->
<!-- 									<li><a href="categorySearch.do?boardCategory=4">전라도</a></li> -->
<!-- 									<li><a href="categorySearch.do?boardCategory=5">경상도</a></li> -->
<!-- 									<li><a href="categorySearch.do?boardCategory=6">제주도</a></li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

				<!-- Side Widget -->
<!-- 				<div class="card my-4"> -->
<!-- 					<h5 class="card-header">Side Widget</h5> -->
<!-- 					<div class="card-body">You can put anything you want inside -->
<!-- 						of these side widgets. They are easy to use, and feature the new -->
<!-- 						Bootstrap 4 card containers!</div> -->
<!-- 				</div> -->

<!-- 			</div> -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Custom scripts for this template -->
	<script src="js/stylish-portfolio.js"></script>

	<hr />
</body>

<%@include file="footer.jsp"%>

</html>
