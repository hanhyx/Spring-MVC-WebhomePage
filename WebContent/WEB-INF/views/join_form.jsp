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

<script type="text/javascript">
	
	function chkDupId() {
		var id = $('#joinId').val();

		if ($("#joinId").val() == '') {
			alert('ID�� �Է����ּ���.');
			return;
		}
		var param = "id="+id;

		$.ajax({
			type : "post",
			url : "chkDupId.do",
			data : param,
			dataType : 'text',
			success : function(result) {
				var chkIdR = result;
				if (chkIdR == "true") {
					alert("��� ������ ID�Դϴ�.");
					$("#idChkBtm").val('Y');
				} else {
					alert("�ߺ��� ID�Դϴ�.");
					$("#idChkBtm").val('N');
				}
			},
			error : function() {
				alert("ajax ����");
			}
		});
	};
</script>
</head>
<%@include file="header21.jsp"%>
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

	<div class="join-agree-area">
		<div class="panel panel-default">
			<div class="panel-body row" style="padding-top: 25px;">
				<div class="form-group col-md-6" style="margin-bottom: 0;">
					<div class="form-group-item">
						<!-- 				<div class="form-group"> -->
						<label for="provision" class="control-label">ȸ�����Ծ��</label>
					</div>
					<div class="form-group-item" id="provision">
						<textarea class="form-control" readonly rows="10" cols="100">
�������

�� 1 �� : ��Ģ 
�� 2 �� : ���� �̿��� 
�� 3 �� : ��������� �ǹ� 
�� 4 �� : ���� �̿� 
�� 5 �� : ������� �� �̿����� 
�� 6 �� : ��Ÿ 

�� 1 �� : 
�� �˾Ƽ� �̿��� ...

�� 2 �� : 
������Ʈ�ϱ�...

�� 3 �� : 

���Ǹ� ��....

                    </textarea>
					</div>
					<div class="form-group-item">
						<div class="radio pull-right">
							<label> <input type="radio" id="provisionYn"
								name="provisionYn" value="Y" autofocus="autofocus" checked>
								�����մϴ�.
							</label> <label> <input type="radio" id="provisionYn"
								name="provisionYn" value="N"> �������� �ʽ��ϴ�.
							</label>
						</div>

					</div>
				</div>
				<div class="clearfix visible-sm visible-xs"></div>
				<div class="form-group col-md-6" style="margin-bottom: 0;">
					<div class="form-group-item">
						<label for="memberInfo" class="control-label">����������޹�ħ</label>
					</div>
					<div class="form-group-item" id="memberInfo">
						<textarea class="form-control" readonly rows="10" cols="100">
���������� �׸� �� �������
���� ���� : ���� �̿� ����
���� �Ⱓ : 1��

���� �׽�Ʈ ���Դϴ�.
�̿��ϰ� �����Ű��� ?
�׷� ������ �ּ���
���� ���� ���� �� �̿뿡 �����մϴ�.

���� ���� �� ��ȣ�ؾߵȴٰ� �����մϴ�.
��������
��������
������
��������
������
��
������
                    </textarea>
					</div>
					<div class="form-group-item">
						<div class="radio pull-right">
							<label> <input type="radio" id="memberInfoYn"
								name="memberInfoYn" value="Y" checked> �����մϴ�.
							</label> <label> <input type="radio" id="memberInfoYn"
								name="memberInfoYn" value="N"> �������� �ʽ��ϴ�.
							</label>
						</div>
					</div>

				</div>
			</div>
			<div class="panel-footer">
				<div style="overflow: hidden" class="row">
					<div class="col-sm-offset-10 col-sm-2">
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
		action="join.do" enctype="multipart/form-data" style="display: none;">
		<div class="panel panel-default">
			<div class="panel-heading">Create Account</div>
			<!-- panel heading -->

			<div class="panel-body">
				<div class="form-group" id="divId">

					<!-- 		���̵� -->
					<label for="inputId" class="col-sm-4 control-label"> ���̵� <br>
						<small class="text-danger">(�ʼ��Է�)</small>
					</label>
					<div class="col-sm-6">
						<div class="input-group">
							
							<input type="text" class="form-control onlyAlphabetAndNumber"
								id="joinId" name="id" data-rule-required="true"
								placeholder="30���̳��� ���ĺ�, ������ھ�(_), ���ڸ� �Է� �����մϴ�." maxlength="30">
							<span class="input-group-btn">
								<input type="hidden" id="idChkBtm" value="N">
								<input type="button" onclick="chkDupId();" class="btn btn-default id2_btn" value="�ߺ�Ȯ��"/>
							</span>
						</div>
						<input id="joinId2" name="joinId2" type="text" class="hidden" />
					</div>
				</div>

				<!-- 	��й�ȣ -->
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

				<!-- 	�̸� -->
				<div class="form-group" id="divName">
					<label for="inputName" class="col-sm-4 control-label">�̸� <br>
						<small class="text-danger">(�ʼ��Է�)</small></label>
					<div class="col-sm-6">
						<input type="text" class="form-control onlyHangul" id="name"
							name="name" data-rule-required="true" placeholder="�ѱ۸� �Է� �����մϴ�."
							maxlength="15">
					</div>
				</div>

				<!-- 					<div class="form-group" id="divNickname"> -->
				<!-- 						<label for="inputNickname" class="col-sm-4 control-label">����</label> -->
				<!-- 						<div class="col-sm-6"> -->
				<!-- 							<input type="text" class="form-control" id="nickname" -->
				<!-- 								data-rule-required="true" placeholder="����" maxlength="15"> -->
				<!-- 						</div> -->
				<!-- 					</div> -->

				<!-- 	�̸��� -->
				<div class="form-group" id="divEmail">
					<label for="inputEmail" class="col-sm-4 control-label">�̸���
						<br> <small class="text-danger">(�ʼ��Է�)</small>
					</label>
					<div class="col-sm-6">
						<input type="email" class="form-control" id="email" name="email"
							data-rule-required="true" placeholder="�̸���" maxlength="40">
					</div>
				</div>

				<!-- 	����ȣ-->
				<div class="form-group" id="divPhoneNumber">
					<label for="inputPhoneNumber" class="col-sm-4 control-label">�޴���
						��ȣ <br> <small class="text-danger">(�ʼ��Է�)</small>
					</label>
					<div class="col-sm-6">
						<input type="tel" class="form-control onlyNumber" id="phoneNumber"
							name="phone" data-rule-required="true"
							placeholder="-�� �����ϰ� ���ڸ� �Է��ϼ���." maxlength="11">
					</div>
				</div>

				<!-- 	������ ���� -->
				<div class="form-group" id="divProfilePic">
					<label for="inputProfile" class="col-sm-4 control-label">������
						���� <small class="text-danger">(���Է½ñ⺻����)</small></label>
					<div class="col-sm-6">
						<input type="file" name="profilepic"><br>
					</div>
				</div>
				
				<!-- 	���� -->
				<div class="form-group" id="divQuestion">
					<label for="inputQuestion" class="col-sm-4 control-label">���� <br>
						<small class="text-danger">(�ʼ��Է�)</small></label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="question"
							name="question" data-rule-required="true" placeholder="��й�ȣ ã�⿡ ����ϴ� �����Դϴ�."
							maxlength="40">
					</div>
				</div>
				
				<!-- 	�亯 -->
				<div class="form-group" id="divAnswer">
					<label for="inputAnswer" class="col-sm-4 control-label">�亯 <br>
						<small class="text-danger">(�ʼ��Է�)</small></label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="answer"
							name="answer" data-rule-required="true" placeholder="��й�ȣ ã�⿡ ����ϴ� �亯�Դϴ�."
							maxlength="25">
					</div>
				</div>

				<!-- 	���� -->
				<!-- 					<div class="form-group"> -->
				<!-- 						<label for="inputPhoneNumber" class="col-sm-4 control-label">����</label> -->
				<!-- 						<div class="col-sm-6"> -->
				<!-- 							<select class="form-control" id="gender" name="gender"> -->

				<!-- 							</select> -->
				<!-- 						</div> -->
				<!-- 					</div> -->

				<!-- 		�����ȣ -->
				<!-- 					<div class="form-group"> -->
				<!-- 						<label for="zip" class="col-sm-4 control-label"> �����ȣ </label> -->
				<!-- 						<div class="col-sm-3"> -->
				<!-- 							<div class="input-group"> -->
				<!-- 								<input id="zipcode" name="zip_code" type="text" -->
				<!-- 									class="form-control zip_btn postcodify_postcode5" -->
				<!-- 									placeholder="00000" readonly style="cursor: pointer;"> -->
				<!-- 								<span class="input-group-btn"> -->
				<!-- 									<button type="button" class="btn btn-default zip_btn">�˻�</button> -->
				<!-- 								</span> -->
				<!-- 							</div> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 		�����ȣ �� -->

				<!-- �ּ� -->
				<!-- 					<div class="form-group"> -->
				<!-- 						<label for="addr" class="col-sm-4 control-label"> �ּ� </label> -->
				<!-- 						<div class="col-sm-6"> -->
				<!-- 							<input -->
				<!-- 								id="addr2" name="addr2" type="text" -->
				<!-- 								class="form-control postcodify_details" placeholder=""> -->
				<!-- 						</div> -->
				<!-- 					</div> -->

				<!-- 	�̸��� ���ſ��� -->
<!-- 				<div class="form-group"> -->
<!-- 					<label for="inputEmailReceiveYn" class="col-sm-4 control-label">�̸��� -->
<!-- 						���ſ���</label> -->
<!-- 					<div class="col-sm-6"> -->
<!-- 						<p class="text-left"> -->
<!-- 							<label class="radio-inline"> <input type="radio" -->
<!-- 								id="emailReceiveYn" name="email_check" value="Y" checked> -->
<!-- 								�����մϴ�.  -->
<!-- 						</p> -->
<!-- 						<p class="text-left"> -->
<!-- 						</label> <label class="radio-inline"> <input type="radio" -->
<!-- 							id="emailReceiveYn" name="email_check" value="N"> �������� -->
<!-- 							�ʽ��ϴ�. -->
<!-- 						</label> -->
<!-- 						</p> -->
<!-- 					</div> -->
<!-- 				</div> -->

			</div>
			<div class="panel-footer">
				<div class="form-group" style="padding-top: 10px">
					<div class="col-sm-2">
						<button class="btn btn-lg btn-default btn-block" type="button"
							onclick="join_agree_prev();">
							<i class="fa fa-angle-double-left fa-fw"></i> ����
						</button>
					</div>
					<div class="col-sm-offset-8 col-sm-2">
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
		// 		function join_agree_next() {
		// 			var modalContents = $(".modal-contents");
		// 			var modal = $("#defaultModal");

		// 			if (!$('#provisionYn').prop("checked")) {
		// 				modalContents.text("ȸ�����Ծ���� �����Ͽ� �ֽñ� �ٶ��ϴ�."); //��� �޽��� �Է�
		// 				modal.modal('show'); //��� ����

		// 				provision.removeClass("has-success");
		// 				provision.addClass("has-error");
		// 				$('#provisionYn').focus();
		// 				return false;
		// 			} else if (!$('#memberInfoYn').prop("checked")) {
		// 				modalContents.text("����������޹�ħ�� �����Ͽ� �ֽñ� �ٶ��ϴ�.");
		// 				modal.modal('show');

		// 				memberInfo.removeClass("has-success");
		// 				memberInfo.addClass("has-error");
		// 				$('#memberInfoYn').focus();
		// 				return false;
		// 			} else {
		// 				$('.join-agree-area').hide();
		// 				$('#joinForm').show();
		// 			}

		// 		}

		function join_agree_prev() {
			$('.join-agree-area').show();
			$('#joinForm').hide();
		}

		$(function() {
			//����� ���������� ����
			var modalContents = $(".modal-contents");
			var modal = $("#defaultModal");
			var provision = $('#provision');
			var memberInfo = $('#memberInfo');

			$("#join_agree_next").on("click", function(event) {
				if ($('#provisionYn:checked').val() == "N") {
					modalContents.text("ȸ�����Ծ���� �����Ͽ� �ֽñ� �ٶ��ϴ�."); //��� �޽��� �Է�
					modal.modal('show'); //��� ����

					provision.removeClass("has-success");
					provision.addClass("has-error");
					$('#provisionYn').focus();
					return false;
				} else {
					provision.removeClass("has-error");
					provision.addClass("has-success");
				}

				//����������޹�ħ
				if ($('#memberInfoYn:checked').val() == "N") {
					modalContents.text("����������޹�ħ�� �����Ͽ� �ֽñ� �ٶ��ϴ�.");
					modal.modal('show');

					memberInfo.removeClass("has-success");
					memberInfo.addClass("has-error");
					$('#memberInfoYn').focus();
					return false;
				} else {
					memberInfo.removeClass("has-error");
					memberInfo.addClass("has-success");
				}
				$('.join-agree-area').hide();
				$('#joinForm').show();

			});

			$('.onlyAlphabetAndNumber').keyup(function(event) {
				if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
					var inputVal = $(this).val();
					$(this).val($(this).val().replace(/[^_a-z0-9]/gi, '')); //_(underscore), ����, ���ڸ� ����
				}
			});

			$(".onlyHangul").keyup(function(event) {
				if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[a-z0-9]/gi, ''));
				}
			});

			$(".onlyNumber").keyup(function(event) {
				if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^0-9]/gi, ''));
				}
			});

			//------- �˻��Ͽ� ���¸� class�� ����
			$('#joinId').keyup(function(event) {

				var divId = $('#divId');

				if ($('#joinId').val() == "") {
					divId.removeClass("has-success");
					divId.addClass("has-error");
				} else {
					divId.removeClass("has-error");
					divId.addClass("has-success");
				}
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

			$('#name').keyup(function(event) {

				var divName = $('#divName');

				if ($.trim($('#name').val()) == "") {
					divName.removeClass("has-success");
					divName.addClass("has-error");
				} else {
					divName.removeClass("has-error");
					divName.addClass("has-success");
				}
			});

			$('#nickname').keyup(function(event) {

				var divNickname = $('#divNickname');

				if ($.trim($('#nickname').val()) == "") {
					divNickname.removeClass("has-success");
					divNickname.addClass("has-error");
				} else {
					divNickname.removeClass("has-error");
					divNickname.addClass("has-success");
				}
			});

			$('#email').keyup(function(event) {

				var divEmail = $('#divEmail');

				if ($.trim($('#email').val()) == "") {
					divEmail.removeClass("has-success");
					divEmail.addClass("has-error");
				} else {
					divEmail.removeClass("has-error");
					divEmail.addClass("has-success");
				}
			});

			$('#phoneNumber').keyup(function(event) {

				var divPhoneNumber = $('#divPhoneNumber');

				if ($.trim($('#phoneNumber').val()) == "") {
					divPhoneNumber.removeClass("has-success");
					divPhoneNumber.addClass("has-error");
				} else {
					divPhoneNumber.removeClass("has-error");
					divPhoneNumber.addClass("has-success");
				}
			});
			
			$('#question').keyup(function(event) {

				var divEmail = $('#divQuestion');

				if ($.trim($('#question').val()) == "") {
					divEmail.removeClass("has-success");
					divEmail.addClass("has-error");
				} else {
					divEmail.removeClass("has-error");
					divEmail.addClass("has-success");
				}
			});
			
			$('#answer').keyup(function(event) {

				var divEmail = $('#divAnswer');

				if ($.trim($('#answer').val()) == "") {
					divEmail.removeClass("has-success");
					divEmail.addClass("has-error");
				} else {
					divEmail.removeClass("has-error");
					divEmail.addClass("has-success");
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

						//���̵� �˻�
						if ($('#joinId').val() == "") {
							modalContents.text("���̵� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
							modalContents.css("color", "red");
							modal.modal('show');

							divId.removeClass("has-success");
							divId.addClass("has-error");
							$('#joinId').focus();
							return false;
						} else {
							divId.removeClass("has-error");
							divId.addClass("has-success");
						}
						
						//���̵� �ߺ��˻�
						if($("#idChkBtm").val() == "N"){
							modalContents.text("���̵� �ߺ� �˻� �õ��� �ٶ��ϴ�.");
							modalContents.css("color", "red");
							modal.modal('show');

							divId.removeClass("has-success");
							divId.addClass("has-error");
							$('#idChkBtm').focus();
							return false;
						} else {
							divId.removeClass("has-error");
							divId.addClass("has-success");
						}

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

						//�̸�
						if ($('#name').val() == "") {
							modalContents.text("�̸��� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
							modal.modal('show');

							divName.removeClass("has-success");
							divName.addClass("has-error");
							$('#name').focus();
							return false;
						} else {
							divName.removeClass("has-error");
							divName.addClass("has-success");
						}

						//����
						// 						if ($('#nickname').val() == "") {
						// 							modalContents.text("������ �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
						// 							modal.modal('show');

						// 							divNickname.removeClass("has-success");
						// 							divNickname.addClass("has-error");
						// 							$('#nickname').focus();
						// 							return false;
						// 						} else {
						// 							divNickname.removeClass("has-error");
						// 							divNickname.addClass("has-success");
						// 						}

						//�̸���
						if ($('#email').val() == "") {
							modalContents.text("�̸����� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
							modal.modal('show');

							divEmail.removeClass("has-success");
							divEmail.addClass("has-error");
							$('#email').focus();
							return false;
						} else {
							divEmail.removeClass("has-error");
							divEmail.addClass("has-success");
						}

						//�޴��� ��ȣ
						if ($('#phoneNumber').val() == "") {
							modalContents.text("�޴��� ��ȣ�� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
							modal.modal('show');

							divPhoneNumber.removeClass("has-success");
							divPhoneNumber.addClass("has-error");
							$('#phoneNumber').focus();
							return false;
						} else {
							divPhoneNumber.removeClass("has-error");
							divPhoneNumber.addClass("has-success");
						}
						
						//���� 
						if ($('#question').val() == "") {
							modalContents.text("������ �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
							modal.modal('show');

							divName.removeClass("has-success");
							divName.addClass("has-error");
							$('#question').focus();
							return false;
						} else {
							divName.removeClass("has-error");
							divName.addClass("has-success");
						}
						
						//�亯
						if ($('#answer').val() == "") {
							modalContents.text("�亯�� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
							modal.modal('show');

							divName.removeClass("has-success");
							divName.addClass("has-error");
							$('#answer').focus();
							return false;
						} else {
							divName.removeClass("has-error");
							divName.addClass("has-success");
						}

					});

		});
	</script>
	<!--// ���� ���� �κ� -->
	<hr />
	<!-- Ǫ�� ���� �κ� -->


</body>
<%@include file="footer.jsp"%>
</html>