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

<style type="text/css">
body {
	background: url('img/bg11.jpg');
	padding: 50px;
}

#login-dp {
	min-width: 250px;
	max-width: 260px;
	max-height: 390px;
	margin: 8px -130px 10px;
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
	padding: 14px 60px;
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

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/blog-home.css" rel="stylesheet">

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
	
	$(function() {
		$('#myProfileBtn').mouseover(
				function() {
					$('#myProfileSession').show();
			})
		$('#myProfileBtn').mouseout(
				function() {
					$('#myProfileSession').hide();
			})	
			
			$("#messageBoxBtn").click(function() {
				var cw=screen.availWidth;     
				var ch=screen.availHeight;    

				var sw=800;    
				var sh=600;    

				var ml=(cw-sw)/2;        
				var mt=(ch-sh)/2;
				
				window.open('message.do', 'MessageBox','width='+sw+',height='+sh+',top='+mt+',left='+ml+', location=no, toolbar=no, menubar=no, resizable=no, scrollbars=yes')
			})
			
			$("#searchPwFormBtn").click(function() {
				var cw=screen.availWidth;     
				var ch=screen.availHeight;    

				var sw=800;    
				var sh=600;    

				var ml=(cw-sw)/2;        
				var mt=(ch-sh)/2;
				
				window.open('searchPwForm.do', 'findingPw','width='+sw+',height='+sh+',top='+mt+',left='+ml+', location=no, toolbar=no, menubar=no, resizable=no, scrollbars=yes')
			})	
	})
</script>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
		<div class="col-md-8">
			<a class="navbar-brand" href="main.do" style="font-size: 20px">Travel Maker</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		<div class="col-md-4">
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="main.do" style="font-size: 16px">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#" style="font-size: 16px">About</a></li>
					<li class="nav-item"><a class="nav-link" href="board.do" style="font-size: 16px">Board</a>
					</li>
					<c:if test="${sessionScope.loginId == null}">
						<li class="dropdown"><a class="nav-link" href="#"
							data-toggle="dropdown"><b style="font-size: 16px">LogIn</b><span class="caret"></span></a>
							<ul id="login-dp" class="dropdown-menu">
								<li>
									<div class="row">
										<div class="col-md-12">
<!-- 											Login via -->
<!-- 											<div class="social-buttons"> -->
<!-- 												<a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> -->
<!-- 													Facebook</a> <a href="#" class="btn btn-tw"><i -->
<!-- 													class="fa fa-twitter"></i> Twitter</a> -->
<!-- 											</div> -->
<!-- 											or -->
											<form class="form" method="post" action="login.do"
												id="login-nav">
												<div class="form-group">
													<label class="sr-only" for="exampleInputEmail2">Id</label>
													<input type="text" class="form-control" name="id" id="id"
														placeholder="Id" required>
												</div>
												<div class="form-group">
													<label class="sr-only" for="exampleInputPassword2">Password</label>
													<input type="password" class="form-control" name="password"
														id="password" placeholder="Password" required>
													<div class="help-block text-right">
														<a href="#" id="searchPwFormBtn">Forget the password ?</a>
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
							data-toggle="dropdown"><b style="font-size: 14px">${sessionScope.loginId}님</b><span
								class="caret"></span></a>
							<ul id="login-dp" class="dropdown-menu">
								<li>
									<div class="row">
										<div class="col-md-12">
<!-- 											<div class="form-group"> -->
<%-- 												<a href="myPage.do?messager=${sessionScope.loginId}" class="btn btn-primary btn-block">MyPage</a> --%>
<!-- 											</div> -->

												<div class="form-group" id="myProfileBtn">
													<a href="#" class="btn btn-primary btn-block">MyProfile</a>
												</div>
												<div class="form-group" id="myProfileSession"
													style="display: none;">
													<table>
														<tr>
															<td><img class="d-flex mr-3 rounded-circle"
																src="img/${memberInfo.profilePicPath}" width="50"
																height="50" alt=""></td>
															<td>${memberInfo.id}</td>
														</tr>
														<tr>
															<td>NO.</td>
															<td>${memberInfo.member_num}</td>
														</tr>
														<tr>
															<td>Name:</td>
															<td>${memberInfo.name}</td>
														</tr>
														<tr>
															<td>Phone:</td>
															<td>${memberInfo.phone}</td>
														</tr>
														<tr>
															<td>Email:</td>
															<td>${memberInfo.email}</td>
														</tr>
													</table>
												</div>
												<div class="form-group">
													<a href="changeProfileForm.do?id=${memberInfo.id}"
														class="btn btn-primary btn-block">ChangeProfile</a>
												</div>

												<div class="form-group">
<!-- 												<a href="message.do" class="btn btn-primary btn-block">MessageBox</a> -->
												<a class="btn btn-primary btn-block" id="messageBoxBtn" href="#">MessageBox</a>
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
			</div>
		</div>
	</nav>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
