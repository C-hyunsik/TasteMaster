$(function() {
    $(document).on('click', '.addOnlyDishBtn', function() {
        let formData = new FormData($('#addOnlyDish')[0]);
        var chefId = $('#chefId').val();
        
        formData.append('chefId', chefId);
        
        $.ajax({
            type: 'post',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            url: '/TasteMasters/api/chef/addOnlyDish',
            data: formData,
            success: function(data) {
            	if(data) {
                	alert("쉐프 정보가 업데이트되었습니다.");
            		location.href = '/TasteMasters/admin/chefUpdate?chefId=' + chefId;	
            	}
            },
            error: function(e) {
                console.log(e);
                alert("업데이트 중 오류가 발생했습니다.");
            }
        }); // ajax
    });
});
