$(document).ready(function () {
    $('#memberUpdateForm').on('submit', function (event) {
        event.preventDefault(); // 수정 안하고 제출 방지

        var formData = $(this).serialize(); 

        $.ajax({
            url: '/TasteMasters/api/member/update',
            type: 'POST',
            data: formData,
            success: function (response) {
                alert('회원정보가 수정되었습니다.');
                location.href = '/TasteMasters/page/member/mypage';
            },
            error: function (xhr, status, error) {
                if (xhr.status === 400) {
                    alert('회원정보 수정에 실패했습니다.');
                } else {
                    alert('오류가 발생했습니다. 다시 시도해 주세요.');
                }
            }
        });
    });
});
