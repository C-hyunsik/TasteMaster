$(function(){
    $('.commentUpdateBtn').click(function(){
        // 클릭한 버튼 중 부모 요소 가져옴
        var comment = $(this).closest('.comment');
        var commentContent = comment.find('.assisComment').text(); // 기존 댓글 내용
        console.log('commentContent = ' + commentContent);
        
        // 수정할 내용을 입력할 텍스트 영역 생성
        var textarea = $('<textarea>')
            .val(commentContent)
            .addClass('edit-comment')
            .css({
                width: '85%',
               height: '100px',
                margin: '10px auto'
            });
        
        // 수정 완료 버튼 생성
        var submitBtn = $('<input>')
            .attr('type', 'button')
            .val('수정 완료')
            .addClass('submitBtn')
            .click(function(){
                var newContent = comment.find('.updateArea').val(); // 수정된 댓글 내용
                
                console.log('newContent = ' + newContent);
                var commentId = comment.find('.commentId').val(); // 댓글 ID
	
		    	$.ajax({
		            type: 'post',
		            url: '/TasteMasters/api/comment/update?commentId=' + commentId,
		            data: { content: newContent }, // 수정된 댓글 내용
		            success: function(data) {
		                if(data) {
		                	alert('댓글 수정이 완료돠ㅣ었습니다.')
		                	location.reload(); // 페이지 새로고침
		                }
		                
		            },
		            error: function(e) {
		                console.log(e);
		                alert("수정 중 오류가 발생했습니다.");
		            }
		        });      
            });
        
        // 수정 버튼 클릭 시 기존 버튼 숨기기
        comment.find('.commentUpdateBtn').hide(); // 수정 버튼 숨기기
        comment.find('.commentDeleteBtn').hide(); // 삭제 버튼 숨기기
        comment.find('.assisComment').hide();
        comment.find('.updateArea').show();

        // 기존 댓글 내용 숨기기
        comment.find('.assisComment').hide();

        // 댓글 요소에 텍스트 영역과 수정 완료 버튼 추가
        comment.find('.assisComment').after(submitBtn);
        
    });
    
});
        




