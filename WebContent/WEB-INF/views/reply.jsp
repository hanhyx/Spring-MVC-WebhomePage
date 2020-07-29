<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
var boardNum = '${board.boardNum}'; //�Խñ� ��ȣ
 
$('[name=btnReply]').click(function(){ //��� ��� ��ư Ŭ���� 
    var insertData = $('[name=replyForm]').serialize(); //commentInsertForm�� ������ ������
    commentInsert(insertData); //Insert �Լ�ȣ��(�Ʒ�)
});
 
 
 
//��� ��� 
function commentList(){
	alert('��� Ŭ��@');
    $.ajax({
        url : '/read.do',
        type : 'get',
        data : {'boardNum':boardNum},
        success : function(data){
            var a =''; 
            $.each(data, function(replyPage, value){ 
                a += '<div class="media mb-4">';
                a += '<c:if test="'+value.seq+'>0">';
                a += '<c:forEach begin="1" end="'+value.lvl+'">&nbsp;&nbsp;</c:forEach>RE :</c:if>';
                a += '<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">';
                a += '<div class="media-body">';
                a += '<h5 class="mt-0">'+value.writer+'</h5>';
                a += '<a onclick="commentUpdate('+value.replyNum+',\''+value.content+'\');"> ���� </a>';
                a += '<a onclick="commentDelete('+value.replyNum+');"> ���� </a></div>';
                a += '<div class="commentContent'+value.replyNum+'> <p> '+value.content +'</p></div>';
                a += '</div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//��� ���
function commentInsert(insertData){
    $.ajax({
        url : '/reply.do',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //��� �ۼ� �� ��� ��� reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//��� ���� - ��� ���� ����� input ������ ���� 
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">����</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}
 
//��� ����
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(bno); //��� ������ ��� ��� 
        }
    });
}
 
//��� ���� 
function commentDelete(cno){
    $.ajax({
        url : '/comment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(bno); //��� ������ ��� ��� 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //������ �ε��� ��� ��� ��� 
});
 
 
 
</script>


