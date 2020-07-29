<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

<head>

<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>Blog Home - Start Bootstrap Template</title>

<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/blog-home.css" rel="stylesheet">

<script type="text/javascript">
$(function() {

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

			<!-- Blog Entries Column -->
			<div class="col-md-8">

				<h1 class="my-4">
					Page Heading
					<c:if test="${sessionScope.loginId != null}">
						<a href="writeForm.do" class="btn btn-primary">Write</a>
					</c:if>
				</h1>

				<!-- Total Board List -->
				<c:if test="${not empty boardPage.boardList}">
					<%@include file="board_list_total.jsp"%>
				</c:if>

				<!-- Searched Board List -->
				<c:if test="${not empty boardPageSearched.boardList}">
					<%@include file="board_list_searched.jsp"%>
				</c:if>

				<!-- category Board List -->
				<c:if test="${not empty categoryPage.boardList}">
					<%@include file="board_list_category.jsp"%>
				</c:if>




			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">

				<!-- Search Widget -->

				<div class="card my-4">
					<h5 class="card-header">Search</h5>
					<div class="card-body">
						<form action="boardListSearch.do" method="post">
						<div class="input-group">
							<b style="font-size: 20px">카테고리 : &nbsp;&nbsp;</b><select
									name="boardCategory" id="boardCategory">
									<option value="0">선택없음</option>
									<option value="1">경기도</option>
									<option value="2" />강원도
									</option>
									<option value="3" />충청도
									</option>
									<option value="4" />전라도
									</option>
									<option value="5" />경상도
									</option>
									<option value="6" />제주도
									</option>
								</select>
								</div><br>
							<div class="input-group">
								
								<input type="text" class="form-control"
									placeholder="Search Title" name="keyword"> <span
									class="input-group-btn"> <input
									class="btn btn-secondary boardListSearchBtn" type="submit"
									value="Go!"></input>
								</span>
							</div>
						</form>
					</div>
				</div>

				<!-- Categories Widget -->
				<div class="card my-4">
					<h5 class="card-header">Categories</h5>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="categorySearch.do?boardCategory=1">경기도</a></li>
									<li><a href="categorySearch.do?boardCategory=2">강원도</a></li>
									<li><a href="categorySearch.do?boardCategory=3">충청도</a></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="categorySearch.do?boardCategory=4">전라도</a></li>
									<li><a href="categorySearch.do?boardCategory=5">경상도</a></li>
									<li><a href="categorySearch.do?boardCategory=6">제주도</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Side Widget -->
<!-- 				<div class="card my-4"> -->
<!-- 					<h5 class="card-header">Side Widget</h5> -->
<!-- 					<div class="card-body">You can put anything you want inside -->
<!-- 						of these side widgets. They are easy to use, and feature the new -->
<!-- 						Bootstrap 4 card containers!</div> -->
<!-- 				</div> -->

			</div>

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
