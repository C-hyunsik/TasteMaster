// 음식 수정 버튼 클릭 시 이벤트 처리
$('.dishUpdateBtn').on('click', function() {
    var dishId = $(this).data('dishid'); // 수정하려는 음식 ID
    var dishName = $('input[name="dishName"][data-dishid="'+ dishId +'"]').val(); // 수정된 음식 이름
    var dishContent = $('textarea[data-dishid="'+ dishId +'"]').val(); // 수정된 음식 설명
    var dishFileInput = $('#dishFileInput_' + dishId)[0]; // 이미지 파일 input
    var chefId = $('#chefId').val();

    var formData = new FormData();
    formData.append('dishId', dishId);
    formData.append('dishName', dishName);
    formData.append('dishContent', dishContent);

    // 이미지 파일이 선택되었을 경우에만 추가
    if (dishFileInput.files.length > 0) {
        formData.append('dishImage', dishFileInput.files[0]);
    }
    if(dishFileInput.files.length <= 0){
    	alert('이미지를 등록해주세요');
    }
    else{
	    $.ajax({
	        url: '/TasteMasters/api/dish/update',
	        type: 'POST',
	        data: formData,
	        contentType: false,
	        processData: false,
	        success: function(response) {
	            alert('음식 정보가 성공적으로 수정되었습니다.');
				location.href='/TasteMasters/page/admin/chefUpdate?chefId=' + chefId;
	        },
	        error: function(xhr, status, error) {
	            alert('오류가 발생했습니다: ' + error);
	        }
	    });
    }
});
