$(function(){
    $('#chefUploadBtn').click(function(){
        let formData = new FormData($('#chefForm')[0]);
        
        $.ajax({
            type: 'post',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            url: '/TasteMasters/api/chef/upload',
            data: formData,
            success: function(data) {
                alert("쉐프와 요리가 등록되었습니다.");
                location.href = "/TasteMasters/page/member/admin"; // 관리자 메인화면으로 이동
            },
            error: function(e) {
                console.log(e);
                alert("등록 중 오류가 발생했습니다.");
            }
        }); //ajax
    });
});
