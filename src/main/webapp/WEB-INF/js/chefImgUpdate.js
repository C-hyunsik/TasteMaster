$(function() {
    $('#chefImgUpdateBtn').click(function() {
        var fileInput = $('#imageUpdateBtn')[0]; // 파일 입력 요소
        var formData = new FormData();

        if (fileInput.files.length > 0) {
            formData.append('chefImg', fileInput.files[0]); // 파일 추가
            
            var chefId = $('#chefId').val(); // chefId 값 가져오기
			formData.append('chefId', chefId); // chefId 추가
            
            $.ajax({
                url: '/TasteMasters/api/chef/chefImgUpdate',
                type: 'post',
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                    alert('쉐프 사진이 수정되었습니다!');
                    location.href='/TasteMasters/page/member/admin';
                },
                error: function(xhr, status, error) {
                    alert('이미지 업데이트에 실패했습니다. 다시 시도해주세요.');
                }
            });
        } else {
            alert('업데이트할 이미지를 선택하세요.');
        }
    });
});
