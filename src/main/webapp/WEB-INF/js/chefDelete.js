$(function(){
	
    $(document).on('click', 'input[name="chefDelete"]', function() {
        var chefId = $(this).closest('.chef').find('.chefId').val();
		
		if(confirm('정말 이 셰프를 탈락시키겠습니까?')) {
			
			$.ajax({
				url: '/TasteMasters/api/chef/delete',
				type: 'GET',
				data: {chefId: chefId},
				success: function(reponse) {
					alert('셰프가 삭제되었습니다.');
					location.href='/TasteMasters/page/member/admin'
				},
				error: function(e){
					console.log(e);
				}
			});//ajax
		}
	});
});