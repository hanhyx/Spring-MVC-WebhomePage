<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>�۾��� ȭ��</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#btnAdd').click(function() {
			var inputElement = '<input type="file" class="btn btn-lg btn-dark" name="upPic" style="font-size: 12px"><br>';

			$('#fileDiv').append(inputElement);
			return false;
		})
		$('#btnRemove').click(function() {
			$('#fileDiv').empty();

			return false;
		})
		
		$('#btnSubmit').click(function() {
			if ($('#emptyTitle').val() == "") {
				alert("������ �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
				$('#emptyTitle').focus();
				return false;
			} 
			
			if ($('input[name=upPic]').val() != "") {
				var ext = $('input[name=upPic]').val().split('.').pop().toLowerCase();
			     if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
				 alert('gif,png,jpg,jpeg ���ϸ� ���ε� �Ҽ� �ֽ��ϴ�.');
				 return false;
			      }

			} 
			
		})
		
	})
	
	
						
</script>
</head>
<%@include file="header11.jsp"%>
<body>
	<form action="write.do" method="post" enctype="multipart/form-data">

		<b style="font-size: 20px">���� : </b><input type="text" name="title"
			id="emptyTitle" size="20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<b style="font-size: 20px">ī�װ� : </b><select name="boardCategory"
			id="boardCategory">
			<option value="0">���þ���</option>
			<option value="1">��⵵</option>
			<option value="2" />������
			</option>
			<option value="3" />��û��
			</option>
			<option value="4" />����
			</option>
			<option value="5" />���
			</option>
			<option value="6" />���ֵ�
			</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="btn btn-primary" id="btnAdd" style="font-size: 10px">PHOTO
			ADD</button>
		&nbsp;&nbsp;&nbsp;
		<button class="btn btn-primary" id="btnRemove" style="font-size: 10px">PHOTO
			REMOVE</button>

		<br> <br>

		<%@include file="write_note.html"%><br> <br>
		<div id="fileDiv"></div>
		<div class="text-center">
			<input type="submit" id="btnSubmit" class="btn btn-primary"
				value="CONFIRM">
		</div>
	</form>
</body>
<%@include file="footer.jsp"%>
</html>