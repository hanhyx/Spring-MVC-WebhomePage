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



</head>
<%@include file="header1.jsp"%>
<body>


	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<div class="col-lg-1"></div>

			<!-- Post Content Column -->
			<div class="col-lg-10">

				<!-- Title -->
				<h1 class="mt-4">제목</h1>

				<hr>

				<!-- Preview Image -->
				<!--           <img class="img-fluid rounded" src="http://placehold.it/900x300" alt=""> -->
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="7"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="8"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="9"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="10"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="11"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="12"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="13"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="14"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="15"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="16"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="17"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="18"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="19"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="20"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="21"></li>
						
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="img/slide0001.jpg"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0002.jpg"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0003.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0004.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0005.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0006.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0007.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0008.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0009.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0010.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0011.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0012.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0013.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0014.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0015.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0016.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0017.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0018.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0019.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0020.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0021.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="img/slide0022.jpg"
								alt="Third slide">
						</div>
						
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

				<hr>

				<!-- Post Content -->
				<div class="card my-4">
					<div class="card-body">
						<p> &nbsp;&nbsp;&nbsp;&nbsp;3차 프로젝트인 스프링 웹 프로젝트를 여행 관련 사이트로 정한 이유는 다가올 겨울 휴가철을 대비해 여행 대한 정보와 의견을 얻을 수 있는 사이트의 필요성이 주된 이유로 시작되었다.</p>
						<p> &nbsp;&nbsp;&nbsp;&nbsp;이를 여태 교육받은 것을 사용하여 좀 더 많은 기능을 사이트 구축에 활용하여 교육에 대한 숙련 및 자신의 실력 발전을 목적을 두고 프로젝트를 시작하였다.</p>
						<p> &nbsp;&nbsp;&nbsp;&nbsp;진행 과정에서 여러 어려움이 발생 하였는데 제공된 API나 부트스트랩의 충돌 및 자식 댓글 삭제 시 문제 등 주어진 시간에 비해 원활하지 못한 점이 아쉬움으로 남았다.</p>
						<p> &nbsp;&nbsp;&nbsp;&nbsp;하지만 교육을 통해 배운 것을 사용하여 웹 페이지를 구축하고 이를 통해 여러 상황에 적합한 사용법과 프로그래밍에 익숙해진 점은 이 프로젝트를 통해 얻은 가장 큰 성과라고 할 수 있다.</p>
						<p> &nbsp;&nbsp;&nbsp;&nbsp;또한 스스로의 부족함을 진단하고 앞으로 배울 교육을 통해 더 발전된 웹 페이지를 구축하는 것에 대한 기대감을 가진다.</p>
					</div>
				</div>

				<hr>

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
