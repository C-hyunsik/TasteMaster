<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chef Upload</title>
<link rel="stylesheet" href="../css/index.css">
<style>
    /* 테이블 스타일 */
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    th, td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
    
    /* 요리 사진 업로드 박스 스타일 */
    .dish-image-box {
        width: 100px;
        height: 100px;
        border: 2px dashed #ccc;
        position: relative;
        display: inline-block;
        cursor: pointer;
        margin: 5px;
        overflow: hidden;
    }
    .dish-image-box img {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
    }
    .dish-image-input {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        opacity: 0; /* 숨김 */
        cursor: pointer;
    }
    
    /* 요리 입력과 사진을 한 줄로 배치하기 위한 flex 컨테이너 */
    .dish-container {
        display: flex;
        align-items: center;
        margin-top: 10px;
    }
    .dish-container input[type="text"] {
        margin-right: 10px;
    }

    /* 작은 이미지 버튼을 위한 스타일 */
    .add-dish-image {
        margin-top: 5px; /* 네모박스 아래 간격 */
        cursor: pointer;
    }
</style>
</head>
<body>
<header>
    <!-- 생략 -->
</header>

<main>
    <h2>쉐프 등록</h2>
    <form id="chefForm" method="post">
        <table border="1">
            <tr>
                <th>쉐프 이름</th>
                <td>
                    <input type="text" name="chefName" required placeholder="쉐프 이름을 입력하세요">
                </td>
            </tr>
            <tr>
                <th>쉐프 사진</th>
                <td>
                    <div class="dish-image-box" id="chefImgBox">
                        <span id="showChefImg"></span>
                        <input type="file" name="chefImg" id="chefImg" class="dish-image-input" required>
                    </div>
                </td>
            </tr>
            <tr>
                <th>요리 입력</th>
                <td id="dishNameContainer">
                    <input type="text" name="dishName" required placeholder="요리 이름을 입력하세요">
                </td>
            </tr>
            <tr>
                <th>요리 사진</th>
                <td id="dishImageContainer">
                    <div class="dish-container" id="dishContainer">
                        <div class="dish-image-box">
                            <span class="showDishImg"></span>
                            <input type="file" name="dishImg" class="dish-image-input dishImg" />
                        </div>
                    </div>
                    <img alt="요리사진 추가" src="../image/addImage.png" width="30" height="30" class="add-dish-image">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" value="등록하기" id="chefUploadBtn">
                    <input type="reset" value="취소">
                </td>
            </tr>
        </table>
    </form>
</main>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/chefUpload.js"></script>
<script type="text/javascript">
// 박스 클릭 시 파일 선택 창 열기
$('#chefImgBox').on('click', function() {
    $('#chefImg').click(); // 파일 선택창 열기
});

// 요리 사진 추가 버튼 클릭 시 새로운 요리 이름 입력란 및 이미지 박스 추가
$(document).on('click', '.add-dish-image', function() {
    var dishContainer = $('#dishContainer'); // 요리 사진 컨테이너

    // 새로운 요리 이름 입력란 추가
    var newDishInput = `
        <input type="text" name="dishName" required placeholder="요리 이름을 입력하세요" style="margin-right: 10px;">
    `;
    $('#dishNameContainer').append(newDishInput); // 요리 이름 추가

    // 새로운 요리 사진 업로드 박스 추가
    var newDishImageBox = `
        <div class="dish-image-box">
            <span class="showDishImg"></span>
            <input type="file" name="dishImg" class="dish-image-input dishImg">
        </div>
    `;
    dishContainer.append(newDishImageBox); // 네모박스 추가
});

// 쉐프 이미지 미리보기
$('#chefImg').change(function(){
    $('#showChefImg').empty(); // 기존 이미지 제거
    var reader = new FileReader();
    reader.onload = function(e) {
        var img = document.createElement('img');
        img.src = e.target.result;
        img.width = 100;  // 이미지 크기 조정
        img.height = 100;
        $('#showChefImg').append(img);
    }
    reader.readAsDataURL(this.files[0]);
});

// 요리 이미지 미리보기
$(document).on('change', '.dishImg', function(){
    var showDishImg = $(this).siblings('.showDishImg');
    showDishImg.empty(); // 기존 이미지 제거
    var reader = new FileReader();
    reader.onload = function(e) {
        var img = document.createElement('img');
        img.src = e.target.result;
        img.width = 100;  // 이미지 크기 조정
        img.height = 100;
        showDishImg.append(img);
    }
    reader.readAsDataURL(this.files[0]);
});
</script>
</body>
</html>
