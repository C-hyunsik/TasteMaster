$(function() {
    $('.commentDeleteBtn').click(function() {
        var confirmDelete = confirm('댓글을 삭제하시겠습니까?'); // confirm 변수 이름 변경
    
        if (confirmDelete) {
            var commentId = $(this).closest('.comment').find('.commentId').val();
            
            var dishId = '${dishId}';
            var postId = '${postId}';
            
            $.ajax({
                type: 'get',
                url: '/TasteMasters/api/comment/delete?commentId=' + commentId,
                success: function(data) {
                    alert(data);
                    location.href = '/TasteMasters/page/post/view?dishId=' + dishId + '&postId=' + postId;
                },
                error: function(e) {
                    console.log(e);
                    alert("삭제 중 오류가 발생했습니다.");
                }
            });
        }
    });
});
