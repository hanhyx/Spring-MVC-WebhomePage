<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Main</title>


<!-- Custom Fonts -->
<link href="vendor2/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Custom CSS -->
<link href="css/stylish-portfolio.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="js/GeoTrans.js"></script>

<script type="text/javascript">
	var x = 127.0333574;
	var y = 37.4954841;
	var map;


	function drawMap() {
		var mapOptions = {
			center : new naver.maps.LatLng(y, x),
			zoom : 9
		};
		
		map = new naver.maps.Map('map', mapOptions)

	}

	$(function() {

		$('#mapSearch').click(function() {
			var mapKeyword = $('#mapKeyword').val();

			$.ajax({
				type : 'post',
				url : 'mapSearch.do',
				data : 'mapKeyword=' + mapKeyword,
				dataType : 'json',
				success : function(rrr) {
					var kax = rrr['point']['x'];
					var kay = rrr['point']['y'];

					var geo = new GeoTrans();
					geo.init("katec", "geo");
					var pt = new Point(kax, kay);
					var out_pt = geo.conv(pt);
					var x = out_pt.x;
					var y = out_pt.y;

					map.setCenter(new naver.maps.LatLng(y, x));

					var myaddr = new naver.maps.LatLng(y, x);
					// 마커 표시
					var marker = new naver.maps.Marker({
						position : myaddr,
						map : map
					});
					// 마커 클릭 이벤트 처리
					naver.maps.Event.addListener(marker, "click", function(e) {
						if (infowindow.getMap()) {
							infowindow.close();
						} else {
							infowindow.open(map, marker);
						}
					});
					// 마크 클릭시 인포윈도우 오픈
					var infowindow = new naver.maps.InfoWindow({
						content : mapKeyword
					});
				},
				error : function() {
					alert('지도 검색어를 입력하시오.');
				}
			})
			return false;
		})

	})
</script>

</head>

<%@include file="header1.jsp"%>

<body>

	<!-- Header -->
	<header class="header" id="top">
	<div class="text-vertical-center">
		<h1>Travel Maker</h1>
		<h3>Travel Information &amp; Comment</h3>
		<br>
		<button class="btn btn-dark btn-lg js-scroll-trigger"
			data-toggle="modal" data-target="#youtube">Find Out More</button>


	</div>
	</header>

	<!-- Modal -->
	<%@include file="youtubeModal.html"%>


	<!-- About -->
<!-- 	<section id="about" class="about"> -->
<!-- 	<div class="container text-center"> -->
<!-- 		<h2>Stylish Portfolio is the perfect theme for your next project!</h2> -->
<!-- 		<p class="lead"> -->
<!-- 			This theme features some wonderful photography courtesy of <a -->
<!-- 				target="_blank" href="http://join.deathtothestockphoto.com/">Death -->
<!-- 				to the Stock Photo</a>. -->
<!-- 		</p> -->
<!-- 	</div> -->
	<!-- /.container --> </section>

	<!-- Services -->
<!-- 	<section id="services" class="services bg-primary text-white"> -->
<!-- 	<div class="container"> -->
<!-- 		<div class="row text-center"> -->
<!-- 			<div class="col-lg-10 mx-auto"> -->
<!-- 				<h2>Our Services</h2> -->
<!-- 				<hr class="small"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-3 col-sm-6"> -->
<!-- 						<div class="service-item"> -->
<!-- 							<span class="fa-stack fa-4x"> <i -->
<!-- 								class="fa fa-circle fa-stack-2x"></i> <i -->
<!-- 								class="fa fa-cloud fa-stack-1x text-primary"></i> -->
<!-- 							</span> -->
<!-- 							<h4> -->
<!-- 								<strong>Service Name</strong> -->
<!-- 							</h4> -->
<!-- 							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p> -->
<!-- 							<a href="#" class="btn btn-light">Learn More</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-3 col-sm-6"> -->
<!-- 						<div class="service-item"> -->
<!-- 							<span class="fa-stack fa-4x"> <i -->
<!-- 								class="fa fa-circle fa-stack-2x"></i> <i -->
<!-- 								class="fa fa-compass fa-stack-1x text-primary"></i> -->
<!-- 							</span> -->
<!-- 							<h4> -->
<!-- 								<strong>Service Name</strong> -->
<!-- 							</h4> -->
<!-- 							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p> -->
<!-- 							<a href="#" class="btn btn-light">Learn More</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-3 col-sm-6"> -->
<!-- 						<div class="service-item"> -->
<!-- 							<span class="fa-stack fa-4x"> <i -->
<!-- 								class="fa fa-circle fa-stack-2x"></i> <i -->
<!-- 								class="fa fa-flask fa-stack-1x text-primary"></i> -->
<!-- 							</span> -->
<!-- 							<h4> -->
<!-- 								<strong>Service Name</strong> -->
<!-- 							</h4> -->
<!-- 							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p> -->
<!-- 							<a href="#" class="btn btn-light">Learn More</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-3 col-sm-6"> -->
<!-- 						<div class="service-item"> -->
<!-- 							<span class="fa-stack fa-4x"> <i -->
<!-- 								class="fa fa-circle fa-stack-2x"></i> <i -->
<!-- 								class="fa fa-shield fa-stack-1x text-primary"></i> -->
<!-- 							</span> -->
<!-- 							<h4> -->
<!-- 								<strong>Service Name</strong> -->
<!-- 							</h4> -->
<!-- 							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p> -->
<!-- 							<a href="#" class="btn btn-light">Learn More</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- /.row (nested) -->
<!-- 			</div> -->
			<!-- /.col-lg-10 -->
<!-- 		</div> -->
		<!-- /.row -->
<!-- 	</div> -->
	<!-- /.container --> </section>

	<!-- Callout -->
<!-- 	<aside class="callout"> -->
<!-- 	<div class="text-vertical-center"> -->
<!-- 		<h1>Vertically Centered Text</h1> -->
<!-- 	</div> -->
<!-- 	</aside> -->

	<!-- Portfolio -->
	<section id="portfolio" class="portfolio">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 mx-auto text-center">
				<h2>Best Article</h2>
				<hr class="small">
				<div class="row">

					<c:if test="${not empty bestPicList.boardList}">
						<c:forEach items="${bestPicList.boardList}" var="boardVO">

							<div class="col-md-6">
								<div class="portfolio-item">

									<c:if test="${not empty boardVO.mainPic}">
										<a href="read.do?boardNum=${boardVO.boardNum}"><img
											class="img-portfolio img-fluid" width="450" height="300"
											src="img/${boardVO.mainPic.originName}"></a>
									</c:if>
									<c:if test="${empty boardVO.mainPic}">
										<a href="read.do?boardNum=${boardVO.boardNum}"><img
											class="img-portfolio img-fluid" width="450" height="300"
											src="img/no-photo-main.jpg"></a>
									</c:if>


								</div>
							</div>

						</c:forEach>
					</c:if>

				</div>
				<!-- /.row (nested) -->
				<a href="board.do" class="btn btn-dark">View More BoardList</a>
			</div>
			<!-- /.col-lg-10 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container --> </section>


	<!-- Map Search -->
	<aside class="call-to-action bg-primary text-white">
	<div class="container text-center">
		<form>
		<center>
			<div class="col-md-5 input-group">
				<input type="text" class="form-control" placeholder="Search Map"
					id="mapKeyword" name="mapKeyword"> <input
					class="btn btn-primary" type="submit" id="mapSearch"
					value="Search"></input>
			</div>
			</center>
		</form>
	</div>
	</aside>

	<!-- Map -->
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=1aAj908XC0P93DkPzp2n"></script>
	<section id="contact" class="map">


	<div id="map" style="width: 100%; height: 100%;"></div>
	<script>
		drawMap();
	</script> </section>

	<!-- Custom scripts for this template -->
	<script src="js/stylish-portfolio.js"></script>
	<hr>
</body>

<%@include file="footer.jsp"%>

</html>
