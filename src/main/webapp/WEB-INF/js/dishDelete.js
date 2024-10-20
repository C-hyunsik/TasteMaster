$(function(){
    $(document).on('click', 'input[name="dishDeleteBtn"]', function() {
        var chefId = $('#chefId').val();
        
        var dishId = $(this).data('dishid');
		
		if(confirm('정말 이 요리를 삭제하시겠습니까?')) {
			
			$.ajax({
				url: '/TasteMasters/api/dish/dishDelete',
				type: 'GET',
				data: {chefId: chefId,
						dishId: dishId},
				success: function(reponse) {
					alert('요리가 삭제되었습니다.');
					location.href='/TasteMasters/page/admin/chefUpdate?chefId=' + chefId
				},
				error: function(e){
					console.log(e);
				}
			});//ajax
		}
	});
});