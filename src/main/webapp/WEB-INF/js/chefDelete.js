$(function(){
	$('#chefDeleteBtn').click(function(){
		var chefId = $(this).closest('.chef').find('.chefId').val();
		
		if(confirm('정말 이 셰프를 탈락시키겠습니까?')) {
			
			$.ajax({
				url: '/TasteMasters/api/admin/apiChefDelete',
				type: 'POST',
				data: {chefId: chefId},
				success: function(reponse) {
					alert(reponse);
					location.href='/TasteMasters/page/admin/adminMain'
				},
				error: function(e){
					console.log(e);
				}
			});//ajax
		}
	});
});