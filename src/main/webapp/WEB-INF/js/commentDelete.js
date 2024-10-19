$(function() {
    $('.commentDeleteBtn').click(function() {
        var confirmDelete = confirm('댓글을 삭제하시겠습니까?'); // confirm 변수 이름 변경
    
        if (confirmDelete) {
            var commentId = $(this).closest('.comment').find('.commentId').val();
            
            const queryString = window.location.search;

			// 쿼리 스트링을 URLSearchParams 객체로 변환
			const params = new URLSearchParams(queryString);
			
			// 특정 쿼리 파라미터 가져오기 (예: 'pg'라는 파라미터)
            var dishId = params.get('dishId');
            var postId = params.get('postId');
            
            $.ajax({
                type: 'get',
                url: '/TasteMasters/api/comment/delete?commentId=' + commentId,
                success: function(data) {
                    if(data){
                    	alert("댓글이 삭제되었습니다.");
                    	location.href = '/TasteMasters/page/post/view?dishId=' + dishId + '&postId=' + postId;
                    	}
                    },
                error: function(e) {
                    console.log(e);
                    alert("삭제 중 오류가 발생했습니다.");
                }
            });
        }
    });
});
