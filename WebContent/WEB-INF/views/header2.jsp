<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="EUC-KR">
<meta name="robots" content="noindex, nofollow">

<title>Fancy navbar login / sign in form - Bootsnipp.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">


<style type="text/css">
body {
	background: url('img/bg11.jpg');
	padding: 50px;
}

#login-dp {
	min-width: 250px;
	padding: 14px 14px 0;
	overflow: hidden;
	background-color: rgba(255, 255, 255, .8);
}

#login-dp .help-block {
	font-size: 12px
}

#login-dp .bottom {
	background-color: rgba(255, 255, 255, .8);
	border-top: 1px solid #ddd;
	clear: both;
	padding: 14px;
}

#login-dp .social-buttons {
	margin: 12px 0
}

#login-dp .social-buttons a {
	width: 49%;
}

#login-dp .form-group {
	margin-bottom: 10px;
}

.btn-fb {
	color: #fff;
	background-color: #3b5998;
}

.btn-fb:hover {
	color: #fff;
	background-color: #496ebc
}

.btn-tw {
	color: #fff;
	background-color: #55acee;
}

.btn-tw:hover {
	color: #fff;
	background-color: #59b5fa;
}

@media ( max-width :768px) {
	#login-dp {
		background-color: inherit;
		color: #fff;
	}
	#login-dp .bottom {
		background-color: inherit;
		border-top: 0 none;
	}
}
</style>
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
	$(document).ready(function() {
		// 저장된 쿠키 Id or empty
		var userInputId = getCookie("userInputId");
		$("input[name='id']").val(userInputId);

		if ($("input[name='id']").val() != "") { // 쿠키 존재시 체크박스 체크드
			$("#idSaveCheck").attr("checked", true); 
		}

		$("#idSaveCheck").change(function() { // 체크박스 체크시 7일동안 체크 쿠키 저장
			if ($("#idSaveCheck").is(":checked")) { 
				var userInputId = $("input[name='id']").val();
				setCookie("userInputId", userInputId, 7); 
			} else { // 체크박스 해제시 쿠키 삭제
				deleteCookie("userInputId");
			}
		});

		$("input[name='id']").keyup(function() { // 체크박스 체크시 7일동안 아이디 쿠키 저장
			if ($("#idSaveCheck").is(":checked")) { 
				var userInputId = $("input[name='id']").val();
				setCookie("userInputId", userInputId, 7); 
			}
		});
	});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
</script>	
</head>
<body>
	<!-- 	<link -->
	<!-- 		href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" -->
	<!-- 		rel="stylesheet"> -->

	<nav class="navbar navbar-default navbar-inverse" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.do">Travel Maker</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Link</a></li>
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Board<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="board.do">Board</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${sessionScope.loginId == null}">
				<li><p class="navbar-text">Already have an account?</p></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
						<ul id="login-dp" class="dropdown-menu">
							<li>
								<div class="row">
									<div class="col-md-12">
<!-- 										Login via -->
<!-- 										<div class="social-buttons"> -->
<!-- 											<a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> -->
<!-- 												Facebook</a> <a href="#" class="btn btn-tw"><i -->
<!-- 												class="fa fa-twitter"></i> Twitter</a> -->
<!-- 										</div> -->
<!-- 										or -->
										<form class="form" method="post" action="login.do"
											id="login-nav">
											<div class="form-group">
												<label class="sr-only" for="exampleInputEmail2">Id</label> <input
													type="text" class="form-control" name="id" id="id"
													placeholder="Id" required>
											</div>
											<div class="form-group">
												<label class="sr-only" for="exampleInputPassword2">Password</label>
												<input type="password" class="form-control" name="password"
													id="password" placeholder="Password" required>
												<div class="help-block text-right">
													<a href="searchPwForm.do">Forget the password ?</a>
												</div>
											</div>
											<div class="form-group">
												<input type="submit" class="btn btn-primary btn-block"
													value="Sign
												in"></input>
											</div>
											<div class="checkbox">
												<label> <input type="checkbox" id="idSaveCheck"> keep me
													logged-in
												</label>
											</div>
										</form>
									</div>
									<div class="bottom text-center">
										New here ? <a href="joinForm.do"><b>Join Us</b></a>
									</div>
								</div>
							</li>
						</ul></li>
				</c:if>
				<c:if test="${sessionScope.loginId != null}">

						<li class="dropdown"><a class="nav-link" href="#"
							data-toggle="dropdown"><b>${sessionScope.loginId}님</b><span
								class="caret"></span></a>
							<ul id="login-dp" class="dropdown-menu">
								<li>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<a href="myPage.do?messager=${sessionScope.loginId}" class="btn btn-primary btn-block">MyPage</a>
											</div>
											<div class="form-group">
												<a href="#" class="btn btn-primary btn-block">MessageBox</a>
											</div>
											<div class="form-group">
												<a href="logout.do" class="btn btn-primary btn-block">LogOut</a>
											</div>
										</div>
									</div>
								</li>
							</ul></li>
					</c:if>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>


</body>




</html>
