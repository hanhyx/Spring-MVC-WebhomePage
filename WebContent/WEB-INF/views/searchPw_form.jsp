<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>

<style type="text/css">
body {
	background: url('img/bg.jpg');
	padding: 50px;
}
/* #joinForm { */
/* 	margin: auto; */
/* 	width: 75%; */
/* 	text-align: center; */
/* } */
</style>
<!-- Bootstrap -->
<link href="webapp/resources/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="webapp/resources/image/icon/HalfLife.ico" rel="shortcuticon">
<!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ���) -->
<script src="//code.jquery.com/jquery.js"></script>
<!-- ��� ������ �÷������� �����ϰų� (�Ʒ�) �ʿ��� ������ ���ϵ��� �����ϼ��� -->
<script src="webapp/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- Respond.js ���� IE8 ���� ������ ����� Ȱ��ȭ�ϼ��� (https://github.com/scottjehl/Respond) -->
<script src="webapp/resources/bootstrap/js/respond.js"></script>
<!-- ��ư ��Ʈ -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	
	
<script type="text/javascript">
$(function() {
	var id;
	var question;
	
	$("#chkOldIdBtn").click(
			function() {

	
		var id = $('#checkingId').val();

		if ($("#checkingId").val() == '') {
			alert('���̵� �Է����ּ���.');
			return;
		}
		var param = "id="+id;

		$.ajax({
			type : "post",
			url : "chkOldId.do",
			data : param,
			dataType : 'text',
			success : function(result) {
				var question = result;
				if (question != "false") {
					alert("�ùٸ� ���̵��Դϴ�.");
					$("#idChkBtn").val('Y');
					$("#idRemember").val(id);					
					$("#questionSentence").text(question);
					$('#checkingIdForm').hide();
					$('#checkingQuestionForm').show();
				} else {
					alert("�߸��� ���̵��Դϴ�.");
					$("#idChkBtn").val('N');
				}
			},
			error : function() {
				alert("ajax ����");
			}
		});
	});
	
	$("#chkOldQueBtn").click(
			function() {
		var answer = $('#checkingQue').val();
		var id = $(this).siblings(
		'input[type=hidden]').val();

		if ($("#checkingQue").val() == '') {
			alert('�亯�� �Է����ּ���.');
			return;
		}
		var param = "id="+ id + "&answer=" + answer;

		$.ajax({
			type : "post",
			url : "chkOldQue.do",
			data : param,
			dataType : 'text',
			success : function(result) {
				var chkIdR = result;
				if (chkIdR == "true") {
					alert("�ùٸ� �亯�Դϴ�.");
					$("#queChkBtn").val('Y');
					$("#idRemember2").val(id);
				} else {
					alert("�߸��� �亯�Դϴ�.");
					$("#queChkBtn").val('N');
				}
			},
			error : function() {
				alert("ajax ����");
			}
		});
	});
	
	function join_agree_prev() {
		
		$('.join-agree-area').show();
		$('#joinForm').hide();
	}

	
		//����� ���������� ����
		var modalContents = $(".modal-contents");
		var modal = $("#defaultModal");
		var provision = $('#provision');
		var memberInfo = $('#memberInfo');
		var divId = $('#divId');

		$("#join_agree_next").on("click", function(event) {
			var id = $(this).siblings(
			'input[type=hidden]').val();
			
			$("#idSentence").val(id);
			
			if($("#checkingId").val() == ''){
				modalContents.text("���̵� �Է� �ٶ��ϴ�.");
				modalContents.css("color", "red");
				modal.modal('show');

				provision.removeClass("has-success");
				provision.addClass("has-error");
				$('#checkingId').focus();
				return false;
			} else {
				provision.removeClass("has-error");
				provision.addClass("has-success");
			}
			
			if($("#checkingId").val() == "N"){
				modalContents.text("���̵� ���� �Ͻñ� �ٶ��ϴ�.");
				modalContents.css("color", "red");
				modal.modal('show');

				provision.removeClass("has-success");
				provision.addClass("has-error");
				$('#checkingId').focus();
				return false;
			} else {
				provision.removeClass("has-error");
				provision.addClass("has-success");
			}
			
			if($("#checkingQue").val() == ''){
				modalContents.text("�亯�� �Է� �ٶ��ϴ�.");
				modalContents.css("color", "red");
				modal.modal('show');

				provision.removeClass("has-success");
				provision.addClass("has-error");
				$('#checkingQue').focus();
				return false;
			} else {
				provision.removeClass("has-error");
				provision.addClass("has-success");
			}
			
			if($("#checkingQue").val() == "N"){
				modalContents.text("�亯 �˻縦 �Ͻñ� �ٶ��ϴ�.");
				modalContents.css("color", "red");
				modal.modal('show');

				provision.removeClass("has-success");
				provision.addClass("has-error");
				$('#checkingQue').focus();
				return false;
			} else {
				provision.removeClass("has-error");
				provision.addClass("has-success");
			}
			
			$('.join-agree-area').hide();
			$('#joinForm').show();
			
			

		});


		$('#joinPassword').keyup(function(event) {

			var divPassword = $('#divPassword');

			if ($('#joinPassword').val() == "") {
				divPassword.removeClass("has-success");
				divPassword.addClass("has-error");
			} else {
				divPassword.removeClass("has-error");
				divPassword.addClass("has-success");
			}
		});

		$('#passwordCheck').keyup(function(event) {

			var passwordCheck = $('#passwordCheck').val();
			var password = $('#joinPassword').val();
			var divPasswordCheck = $('#divPasswordCheck');

			if ((passwordCheck == "") || (password != passwordCheck)) {
				divPasswordCheck.removeClass("has-success");
				divPasswordCheck.addClass("has-error");
			} else {
				divPasswordCheck.removeClass("has-error");
				divPasswordCheck.addClass("has-success");
			}
		});



		//------- validation �˻�
		$("form").submit(
				function(event) {

					var provision = $('#provision');
					var memberInfo = $('#memberInfo');
					var divId = $('#divId');
					var divPassword = $('#divPassword');
					var divPasswordCheck = $('#divPasswordCheck');
					var divName = $('#divName');
					var divNickname = $('#divNickname');
					var divEmail = $('#divEmail');
					var divPhoneNumber = $('#divPhoneNumber');

					

					//�н����� �˻�
					if ($('#joinPassword').val() == "") {
						modalContents.text("��й�ȣ�� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");

						modal.modal('show');

						divPassword.removeClass("has-success");
						divPassword.addClass("has-error");
						$('#joinPassword').focus();
						return false;
					} else {
						divPassword.removeClass("has-error");
						divPassword.addClass("has-success");
					}

					//�н����� Ȯ��
					if ($('#passwordCheck').val() == "") {
						modalContents.text(" ��й�ȣ Ȯ���� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
						modal.modal('show');

						divPasswordCheck.removeClass("has-success");
						divPasswordCheck.addClass("has-error");
						$('#passwordCheck').focus();
						return false;
					} else {
						divPasswordCheck.removeClass("has-error");
						divPasswordCheck.addClass("has-success");
					}

					//�н����� ��
					if ($('#joinPassword').val() != $('#passwordCheck').val()
							|| $('#passwordCheck').val() == "") {
						modalContents.text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
						modal.modal('show');

						divPasswordCheck.removeClass("has-success");
						divPasswordCheck.addClass("has-error");
						$('#passwordCheck').focus();
						return false;
					} else {
						divPasswordCheck.removeClass("has-error");
						divPasswordCheck.addClass("has-success");
					}




				});

	});
	
	
</script>


</head>
<body>

	<div class="container">
		<!-- �¿����� ���� Ȯ�� -->
		<!-- ��� ���� �κ� -->


	</div>
	<!--// ��� ���� �κ� -->
	<!-- ���â -->
	<div class="modal fade" id="defaultModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">��</button>
					<h4 class="modal-title">�˸�</h4>
				</div>
				<div class="modal-body">
					<p class="modal-contents"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!--// ���â -->
	<hr />
	<!-- ���� ���� �κ� -->

	<!-- �Ӹ� �κ� -->
	<!-- 		<div class="jumbotron"> -->
	<!-- 			<h1> -->
	<!-- 				<span -->
	<!-- 					style="color: inherit; line-height: 1.4; font-family: ����, Dotum, Helvetica, sans-serif; font-size: 21px;"> ������ ��ſ� travel Maker ȸ������ ȭ�� �Դϴ�.</span> -->
	<!-- 			</h1> -->
	<!-- 		</div> -->
	<!-- �Ӹ��κ� �� -->

	<div class="join-agree-area" >
		<div class="panel panel-default">
			<div class="panel-body row" style="padding-top: 25px; padding-left: 150px; padding-right: 150px">
			
			<div class="checkingIdForm" id="checkingIdForm">
				<div class="form-group col-md-2" style="margin-bottom: 0;">
					<div class="form-group-item">
						<!-- 				<div class="form-group"> -->
						<hr>
						<label for="provision" class="control-label">���̵� Ȯ��</label>
					</div><br>
					<div class="form-group-item" id="provision">
					<div class="input-group">
					
							<input type="text" class="form-control onlyAlphabetAndNumber"
								id="checkingId" name="id" data-rule-required="true"
								placeholder="���̵� �Է��Ͻÿ�" maxlength="20">
							<span class="input-group-btn">
								<input type="hidden" id="idChkBtn" value="N">
								<input type="button" id="chkOldIdBtn" class="btn btn-default id2_btn" value="����"/>
							</span>
						</div>
						<br>
							<hr>
						
					</div>
					<div class="form-group-item">

					</div>
				</div>
				</div>
			
			<div class="checkingQuestionForm" id="checkingQuestionForm" style="display: none;">
				<div class="form-group col-md-7" style="margin-bottom: 0;">
					<div class="form-group-item">
						<!-- 				<div class="form-group"> -->
						<hr>
						<label for="provision" class="control-label">���� Ȯ��</label><br>
<!-- 					<input type="text" id="questionSentence" value="N" size="52" readonly="readonly"> -->
						<span id="questionSentence">N</span>
					</div><br>
					<div class="form-group-item" id="provision">
					
					<div class="input-group">
					
						
							
							<input type="text" class="form-control"
								id="checkingQue" name="answer" data-rule-required="true"
								placeholder="�亯�� �Է��Ͻÿ�" maxlength="30">
							<span class="input-group-btn">
								<input type="hidden" id="idRemember" value="N">
								<input type="button" id="chkOldQueBtn" class="btn btn-default id2_btn" value="�˻�"/>
							</span>
						</div>
						<br>
							<hr>
						
					</div>
					<div class="form-group-item">

					</div>
				</div>
				</div>
				
				<div class="clearfix visible-sm visible-xs"></div>
			</div>
			<div class="panel-footer">
				<div style="overflow: hidden" class="row">
					<div class="col-sm-offset-9 col-sm-3">
					<input type="hidden" id="idRemember2" value="N">
						<button class="btn btn-lg btn-default btn-block" type="button"
							id="join_agree_next">
							
							���� <i class="fa fa-angle-double-right"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 	</div> -->
	<!-- 	�����̳ʿ��� -->



	<form class="form-horizontal" id="joinForm" role="form" method="post"
		action="changePassword.do" enctype="multipart/form-data" style="display: none;">
		<div class="panel panel-default">
			<div class="panel-heading">Change Password</div>
			<!-- panel heading -->

			<div class="panel-body">

				<!-- ���ο� ��й�ȣ -->
				<div class="form-group" id="divPassword">
					<label for="inputPassword" class="col-sm-4 control-label">
						��й�ȣ <br> <small class="text-danger">(�ʼ��Է�)</small>
					</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" id="joinPassword"
							name="password" data-rule-required="true" placeholder="�н�����"
							maxlength="30">
					</div>
				</div>

				<!-- 	��й�ȣȮ��-->
				<div class="form-group" id="divPasswordCheck">
					<label for="inputPasswordCheck" class="col-sm-4 control-label">��й�ȣ
						Ȯ�� <br> <small class="text-danger">(�ʼ��Է�)</small>
					</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" id="passwordCheck"
							data-rule-required="true" placeholder="�н����� Ȯ��" maxlength="30">
					</div>
				</div>

				<input type="hidden" name="id" id="idSentence" value="N">

			</div>
			<div class="panel-footer">
				<div class="form-group" style="padding-top: 10px">
<!-- 					<div class="col-sm-2"> -->
<!-- 						<button class="btn btn-lg btn-default btn-block" type="button" -->
<!-- 							onclick="join_agree_prev();"> -->
<!-- 							<i class="fa fa-angle-double-left fa-fw"></i> ���� -->
<!-- 						</button> -->
<!-- 					</div> -->
					<div class="col-sm-offset-9 col-sm-3">
						
						<button class="btn btn-lg btn-success btn-block" type="submit">
							<i class="fa fa-check fa-fw"></i> Ȯ��
						</button>
						<input type="hidden" name="do" value="user_add"> <input
							type="hidden" name="join_priv_agree" value="" /> <input
							type="hidden" name="join_user_agree" value="" />
					</div>
				</div>
			</div>
		</div>

	</form>

	<script>

		
	</script>
	<!--// ���� ���� �κ� -->
	<hr />
	<!-- Ǫ�� ���� �κ� -->


</body>
</html>