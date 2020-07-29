<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
var boardNum = '${board.boardNum}'; //게시글 번호
 
$('[name=btnReply]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=replyForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function commentList(){
	alert('댓글 클릭@');
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
                a += '<a onclick="commentUpdate('+value.replyNum+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.replyNum+');"> 삭제 </a></div>';
                a += '<div class="commentContent'+value.replyNum+'> <p> '+value.content +'</p></div>';
                a += '</div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/reply.do',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(cno){
    $.ajax({
        url : '/comment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>


