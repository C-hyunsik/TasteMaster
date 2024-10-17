$(function(){
	// chef 클래스 요소 내의 삭제 버튼 클릭 이벤트 설정
    $(document).on('click', 'input[name="chefDelete"]', function() {
        var chefId = $(this).closest('.chef').find('.chefId').val();
		
		if(confirm('정말 이 셰프를 탈락시키겠습니까?')) {
			
			$.ajax({
				url: '/TasteMasters/api/chef/delete',
				type: 'POST',
				data: {chefId: chefId},
				success: function(reponse) {
					alert(reponse);
					location.href='/TasteMasters/page/member/admin'
				},
				error: function(e){
					console.log(e);
				}
			});//ajax
		}
	});
});